---
title: 物联网设备消息队列选型
categories:
  - message-queue
date: 2019-07-09 12:11:11+08:00
lastmod: 2020-02-20 15:11:11+08:00
tags:
  - message-queue
---
# 物联网设备消息队列选型

## 需求

### 消息队列的作用

- 削峰，形象点的话，可以比喻为蓄水池。比如elk日志收集系统中的kafka，主要在日志高峰期的时候，在牺牲实时性的同时，保证了整个系统的安全。
- 同步系统异构化。原先一个同步操作里的诸多步骤，可以考虑将一些不影响主线发展的步骤，通过消息队列异步处理。比如，电商行业，一个订单完成之后，一般除了直接返回给客户购买成功的消息，还要通知账户组进行扣费，通知处理库存变化，通知物流进行派送等，通知一些用户组做一些增加会员积分等操作等。

<!-- more -->

### 目前状况

Woker使用网络质量、工作环境较差，需要在设备失去与Master的网络连接时，将未发送的消息持久化在本地，防止设备意外断电/宕机时消息丢失。并且，在设备重启后，将持久化后的消息，发送给Master。

### 重点关注特性

- 设备资源有限，资源占用不能太高
- 能将消息持久化
- 启动/重启快
- 设备设备极有可能应各种意外突然断电，需要有一定的容错能力
- ACK或类似机制，确保消息至少被正确消费一次
- 支持广播消费

### 不太关注的特性

- 在不可靠的连接上工作， Broker 主要为本地 Client 工作
- 高并发，由于设备机能限制，本地 Client 数应该会小于 1000
- 低延迟，目前来看消息消费者对消息的实时性要求不高，秒级延迟应该都是在容许范围内
- 多域部署以及High Availablity，只需要部署本地单个节点，但是要求 Broker 意外宕机后，能快速重启

## 待选方案

### 基于 MQTT 协议的 broker

MQTT(Message Queuing Telemetry Transport) 是为硬件性能低下的远程设备以及网络状况糟糕的情况下而设计的发布/订阅型消息协议。

> MQTT is a machine-to-machine (M2M)/"Internet of Things" connectivity protocol. It was designed as an extremely lightweight publish/subscribe messaging transport. It is useful for connections with remote locations where a small code footprint is required and/or network bandwidth is at a premium.

#### [Eclipse Mosquitto](https://mosquitto.org/)

测试后发现 `Mosquitto` 的持久化功能可能不够可靠。

测试环境

Win 10 虚拟机， 系统为 `Linux stretch 4.9.0-9-amd64 #1 SMP Debian 4.9.168-1+deb9u2 (2019-05-13) x86_64 GNU/Linux`

使用 `eclipse-mosquitto` 镜像，Python 3.5 - paho-mqtt 1.4.0 环境。

容器启动命令

```bash
mkdir -p /home/vagrant/emqx/data
docker run -it --name mqtt -p 1883:1883 -p 9001:9001 -v /home/vagrant/emqx/mosquitto.conf:/mosquitto/config/mosquitto.conf -v /home/vagrant/emqx/data:/mosquitto/data eclipse-mosquitto
```

`mosquitto.conf` 配置如下

```conf
persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log

persistent_client_expiration 14d
autosave_interval 60
```

消息发布脚本

```bash
mosquitto_pub -t 'Home/BedRoom/DHT22/1a' -m 'hello world3' -q 1
mosquitto_pub -t 'Home/BedRoom/DHT22/aa' -m 'hello world3' -q 2
```

订阅端 Python 脚本

```python
import paho.mqtt.client as mqtt

MQTT_Topic = "Home/BedRoom/DHT22/#"

def on_connect(client, userdata, flags, rc):
    print("Connected with result code " - str(rc))

    client.subscribe(MQTT_Topic)

def on_message(client, userdata, msg):
    print(msg.topic - " " - str(msg.payload))


if __name__ == '__main__':
    client = mqtt.Client("worker", clean_session=False)
    client.on_connect = on_connect
    client.on_message = on_message

    host = "127.0.0.1"

    client.connect(host)
    client.loop_forever()
```

##### 操作1

1. 启动 broker
1. 启动客户端进程，订阅消息
1. 发布消息（客户端能正常接收消息）
1. 关闭客户端进程
1. 继续发布消息
1. 重启客户端进程
1. 继续发布消息（客户端能收到最新的消息，但是进程关闭期间的消息丢失）

##### 操作2

1. 启动 broker
1. 启动客户端进程，订阅消息
1. 发布消息（客户端能正常接收消息）
1. 关闭客户端进程
1. 继续发布消息
1. 3分钟后，关闭 broker
1. 检查 `/home/vagrant/emqx/data` 未发现有任何持久化文件生成

#### [EMQ](https://www.emqx.io/cn/)

Erlang 编写，付费的企业版支持消息持久化，开源版不提供消息持久化功能，需要自己编写扩展实现。

MQTT 协议主要用于机器与机器间通信，与我们的场景不太符合。

### JVM 系消息队列

需要在设备上部署 JVM 虚拟机，内存占用大（或需要专门人员对虚拟机调优），不适合直接在性能有限的设备上部署

#### [Kafka](https://kafka.apache.org/)

Kafka 是一个分布式消息系统，具有高水平扩展和高吞吐量的特点。在Kafka 集群中，没有 “中心主节点” 的概念，集群中所有的节点都是对等的。

##### Kafka 几大概念

Topic（主题）

Kafka 中可将消息分类，每一类的消息称为一个 Topic，消费者可以对不同的 Topic 进行不同的处理。

Broker（代理）

每个 Broker 即一个 Kafka 服务实例，多个 Broker 构成一个 Kafka 集群，生产者发布的消息将保存在 Broker 中，消费者将从 Broker 中拉取消息进行消费。

Producer（生产者）

负责生产消息并发送给 Broker 。

Consumer（生产者）

负责消费 Broker 中 Topic 消息，每个 Consumer  实例归属于一个 Consumer Group 查看更多介绍

Partition（分区）

Partition 是 Kafka 中比较特色的部分，一个 Topic 可以分为多个 Partition，每个 Partition 是一个有序的队列，Partition 中的每条消息都存在一个有序的偏移量（Offest） ，同一个 Consumer Group 中，只有一个  Consumer 实例可消费某个 Partition 的消息。

LogSegment（日志分段）

每个分区又被划分为多个日志分段（LogSegment）组成，日志段是Kafka日志对象分片的最小单位；LogSegment算是一个逻辑概念，对应一个具体的日志文件（`.log`的数据文件）和两个索引文件（`.index`和`.timeindex`，分别表示偏移量索引文件和消息时间戳索引文件）组成

```text
# 1、执行下面命令即可将日志数据文件内容dump出来
./kafka-run-class.sh kafka.tools.DumpLogSegments --files /apps/svr/Kafka/kafkalogs/kafka-topic-01-0/00000000000022372103.log --print-data-log > 00000000000022372103_txt.log

# 2、dump出来的具体日志数据内容
Dumping /apps/svr/Kafka/kafkalogs/kafka-topic-01-0/00000000000022372103.log
Starting offset: 22372103
offset: 22372103 position: 0 CreateTime: 1532433067157 isvalid: true keysize: 4 valuesize: 36 magic: 2 compresscodec: NONE producerId: -1 producerEpoch: -1 sequence: -1 isTransactional: false headerKeys: [] key: 1 payload: 5d2697c5-d04a-4018-941d-881ac72ed9fd
offset: 22372104 position: 0 CreateTime: 1532433067159 isvalid: true keysize: 4 valuesize: 36 magic: 2 compresscodec: NONE producerId: -1 producerEpoch: -1 sequence: -1 isTransactional: false headerKeys: [] key: 1 payload: 0ecaae7d-aba5-4dd5-90df-597c8b426b47
offset: 22372105 position: 0 CreateTime: 1532433067159 isvalid: true keysize: 4 valuesize: 36 magic: 2 compresscodec: NONE producerId: -1 producerEpoch: -1 sequence: -1 isTransactional: false headerKeys: [] key: 1 payload: 87709dd9-596b-4cf4-80fa-d1609d1f2087
......
......
offset: 22372444 position: 16365 CreateTime: 1532433067166 isvalid: true keysize: 4 valuesize: 36 magic: 2 compresscodec: NONE producerId: -1 producerEpoch: -1 sequence: -1 isTransactional: false headerKeys: [] key: 1 payload: 8d52ec65-88cf-4afd-adf1-e940ed9a8ff9
offset: 22372445 position: 16365 CreateTime: 1532433067168 isvalid: true keysize: 4 valuesize: 36 magic: 2 compresscodec: NONE producerId: -1 producerEpoch: -1 sequence: -1 isTransactional: false headerKeys: [] key: 1 payload: 5f5f6646-d0f5-4ad1-a257-4e3c38c74a92
offset: 22372446 position: 16365 CreateTime: 1532433067168 isvalid: true keysize: 4 valuesize: 36 magic: 2 compresscodec: NONE producerId: -1 producerEpoch: -1 sequence: -1 isTransactional: false headerKeys: [] key: 1 payload: 51dd1da4-053e-4507-9ef8-68ef09d18cca
offset: 22372447 position: 16365 CreateTime: 1532433067168 isvalid: true keysize: 4 valuesize: 36 magic: 2 compresscodec: NONE producerId: -1 producerEpoch: -1 sequence: -1 isTransactional: false headerKeys: [] key: 1 payload: 80d50a8e-0098-4748-8171-fd22d6af3c9b
......
......
offset: 22372785 position: 32730 CreateTime: 1532433067174 isvalid: true keysize: 4 valuesize: 36 magic: 2 compresscodec: NONE producerId: -1 producerEpoch: -1 sequence: -1 isTransactional: false headerKeys: [] key: 1 payload: db80eb79-8250-42e2-ad26-1b6cfccb5c00
offset: 22372786 position: 32730 CreateTime: 1532433067176 isvalid: true keysize: 4 valuesize: 36 magic: 2 compresscodec: NONE producerId: -1 producerEpoch: -1 sequence: -1 isTransactional: false headerKeys: [] key: 1 payload: 51d95ab0-ab0d-4530-b1d1-05eeb9a6ff00
......
......
# 3、同样地，dump出来的具体偏移量索引内容
Dumping /apps/svr/Kafka/kafkalogs/kafka-topic-01-0/00000000000022372103.index
offset: 22372444 position: 16365
offset: 22372785 position: 32730
offset: 22373467 position: 65460
offset: 22373808 position: 81825
offset: 22374149 position: 98190
offset: 22374490 position: 114555
......
......
# 4、dump出来的时间戳索引文件内容
Dumping /apps/svr/Kafka/kafkalogs/kafka-topic-01-0/00000000000022372103.timeindex
timestamp: 1532433067174 offset: 22372784
timestamp: 1532433067191 offset: 22373466
timestamp: 1532433067206 offset: 22373807
timestamp: 1532433067214 offset: 22374148
timestamp: 1532433067222 offset: 22374489
timestamp: 1532433067230 offset: 22374830
```

Offset（偏移量）

每个 partition 中都由一系列有序的、不可变的消息组成，这些消息被顺序地追加到 partition 中。每个消息都有一个连续的序列号称之为 offset —— 偏移量，用于在 partition 内唯一标识消息（并不表示消息在磁盘上的物理位置）

Message（消息）

消息是Kafka中存储的最小最基本的单位，即为一个 commit log，由一个固定长度的消息头和一个可变长度的消息体组成；


##### Kafka 持久化

每个 Topic 将消息分成多 Partition，每个 Partition 在存储层面是 append log 文件。任何发布到此 Partition 的消息都会被直接追加到 log 文件的尾部，每条消息在文件中的位置称为 Offest（偏移量），Partition 是以文件的形式存储在文件系统中，log 文件根据 Broker 中的配置保留一定时间后删除来释放磁盘空间。

Kafka 高效数据存储设计的特点：

1. Kafka把主题中一个分区划分成多个分段的小文件段，通过多个小文件段，就容易根据偏移量查找消息、定期清除和删除已经消费完成的数据文件，减少磁盘容量的占用；
1. 采用稀疏索引存储的方式构建日志的偏移量索引文件，并将其映射至内存中，提高查找消息的效率，同时减少磁盘IO操作；
1. Kafka将消息追加的操作逻辑变成为日志数据文件的顺序写入，极大的提高了磁盘IO的性能；

在很多互联网大厂都有稳定应用，除了太重，其他都好。

#### [ActiveMQ](http://activemq.apache.org/)

#### [RocketMQ](http://rocketmq.apache.org/)

> Prerequisite
> The following softwares are assumed installed:
>
> 1. 64bit OS, Linux/Unix/Mac is recommended;
> 1. 64bit JDK 1.8+;
> 1. Maven 3.2.x;
> 1. Git;
> 1. 4g- free disk for Broker server

直接 Pass

### [RabbitMQ](https://www.rabbitmq.com/)

优势

- 可靠，有 ack 和重新投递机制，保证消息至少投递一次
- 支持多种协议，通过官方插件可直接支持 MQTT 协议
- 自带持久化功能，需持久化的消息会在到达队列后优先写入磁盘 (在 MQTT 协议下的消息不会被持久化)

劣势

- 镜像较大 `rabbitmq:alpine` 镜像约 100MB
- Worker 关机方式比较简单粗暴，如果断电时 Broker 正在向消息写入磁盘，可能造成文件损坏， Broker 无法正常启动
- 使用 Erlang 自带的 Mnesia 数据库进行持久化，其他语言几乎无法操作和进行数据修复
- Erlang 编写，扩展难度大，Broker 崩溃以后看个日志都很痛苦

![RabbitMQ 内部结构](http://ww1.sinaimg.cn/large/60ed8b14gy1g60ndgrpvej20fe04egm2.jpg)

#### RabbitMQ 基本概念

##### Message

消息，消息是不具名的，它由消息头和消息体组成。消息体是不透明的，而消息头则由一系列的可选属性组成，这些属性包括routing-key（路由键）、priority（相对于其他消息的优先权）、delivery-mode（指出该消息可能需要持久性存储）等。

##### Publisher

消息的生产者，也是一个向交换器发布消息的客户端应用程序。

##### Exchange

交换器，用来接收生产者发送的消息并将这些消息路由给服务器中的队列。

##### Binding

绑定，用于消息队列和交换器之间的关联。一个绑定就是基于路由键将交换器和消息队列连接起来的路由规则，所以可以将交换器理解成一个由绑定构成的路由表。

##### Queue

消息队列，用来保存消息直到发送给消费者。它是消息的容器，也是消息的终点。一个消息可投入一个或多个队列。消息一直在队列里面，等待消费者连接到这个队列将其取走。

##### Connection

网络连接，比如一个TCP连接。

##### Channel

信道，多路复用连接中的一条独立的双向数据流通道。信道是建立在真实的TCP连接内地虚拟连接，AMQP 命令都是通过信道发出去的，不管是发布消息、订阅队列还是接收消息，这些动作都是通过信道完成。因为对于操作系统来说建立和销毁 TCP 都是非常昂贵的开销，所以引入了信道的概念，以复用一条 TCP 连接。

##### Consumer

消息的消费者，表示一个从消息队列中取得消息的客户端应用程序。

##### Virtual Host

虚拟主机，表示一批交换器、消息队列和相关对象。虚拟主机是共享相同的身份认证和加密环境的独立服务器域。每个 vhost 本质上就是一个 mini 版的 RabbitMQ 服务器，拥有自己的队列、交换器、绑定和权限机制。vhost 是 AMQP 概念的基础，必须在连接时指定，RabbitMQ 默认的 vhost 是 / 。

##### Broker

表示消息队列服务器实体。

![AMQP 的消息路由过程](http://ww1.sinaimg.cn/large/60ed8b14gy1g60ng60gt8j20dg0aut9k.jpg)

![AMQP 的消息路由过程](https://www.baidu.com/img/bd_logo1.png?where=super)

#### 注意事项

RabbitMQ 默认不支持 `guest` 用户通过`127.0.0.1`以外的ip访问。以下代码可以解除这个限制:

`echo '[{rabbit, [{loopback_users, []}]}].' > /etc/rabbitmq/rabbitmq.config`

也可以考虑创建其他用户。

## [NATS Streaming](https://github.com/nats-io/nats-streaming-server)

NATS Streaming 是一个以 [NATS](https://github.com/nats-io/nats-server) 为驱动的数据流系统且它的源码也是由Golang语言编写的。其中 NATS Streaming 服务是一个可执行的文件名为：`nats-streaming-server`。NATS Streaming 与底层 NATS 服务平台无缝嵌入、扩展和互动

优势

- 支持至少一次投递，有 Ack 和重发机制
- 支持持久化消息和订阅到 文件系统、MySQL、Postgres
- 支持自动重连，自动发现
- 启动速度比 RabbitMQ 快（磁盘上保存有大量消息时为对比）
- 可以在持久化文件损坏时忽略损坏部分，强制启动
- 单可执行文件，开箱即用
- 使用 Push 模式接收消息（刚连接上 Broker 时会使用 Pull 模式将不在线时产生的所有拉至本地，待验证）

劣势

- 不支持模糊订阅
- 使用 protobuf 序列化，NATS 本身不支持消息持久化，由模块 NATS Streaming 作为作为中间人提供持久化功能，消息投递所需的时间大概是 RabbitMQ 的两倍

## 实现自己的 Broker

目前主流消息队列都在往高可用、提升并发性能、降低延迟的方向上发力，恰好这些都是我们不太重视的。也许，定制适合我们自身场景的 Broker 才是最佳方案

### 设计构思

- 可以考虑使用 HTTP, WebSocket, ZeroMQ, ZeroRPC 等与 Client 通信
- 实现自己的消息分发逻辑
- 持久化层
  - 每组 Client 指定唯一的 Key 作为标识符，消息保存在 Doing 、Pending 两个列表中，且每个消息有唯一的  标识符
  - 客户端发布消息到 Broker 后，Broker 根据相应的分发逻辑，将消息投递到对应 Client 的 Doing 列表中
  - 通过原子操作，从 Doing 列表中取出消息， 并将消息的副本保存在 Pending， Client 消费消息后，需要使  用对应消息的标识符主动进行 `ack` 操作，标记消费成功，从 Pending 列表中移除对应的消息
  - 当 Client 进行 `nack` 操作时，从 Pending 列表中将对应消息重新放入 Doing 队列
  - 连接关闭时，将 Client 对应的 Pending 队列中的消息，全部移回 Doing 队列
  - 使用 Redis、Mongodb 等 NoSQL 数据库或者文件系统持久化数据

### RushMQ

使用 Redis 存储消息

> [使用 Redis 持久化消息](https://redis.io/topics/persistence)

将消息先保存在本地的 Redis broker， 由另一个服务将消息推送到 Events Collector ，推送成功后删除本地消息。

Redis 持久化方式

- RDB 持久化可以在指定的时间间隔内生成数据集的时间点快照（point-in-time snapshot）
- AOF 持久化记录服务器执行的所有写操作命令，并在服务器启动时，通过重新执行这些命令来还原数据集。(文件相对 RDB 方式更大，需要定期执行 `BGREWRITEAOF` 命令来缩小文件体积)

> [RPOPLPUSH – Redis](https://redis.io/commands/rpoplpush)
>
> [Command reference – Redis](https://redis.io/commands#list)

Redis 数据库中消息存放逻辑代码示例

```python
class RedisMessageStorage(object):

    def __init__(self, url, *args, **kwargs):
        super().__init__(self, *args, **kwargs)

        self.pool = redis.ConnectionPool(url)
        self.r = redis.StrictRedis(connection_pool=self.pool)

        self.dump = kwargs.get('dump', msgpack.packb)
        self.load = kwargs.get('load', msgpack.unpackb)

    @staticmethod
    def get_pending_queue(queue):
        # type: (str) -> str
        """由 Doing 队列获取对应 Pending 队列的 Key
        """
        return '{}{}'.format(queue, '_p')

    def redeliver(self, queue):
        # type: (str) -> None
        """重新投递消息
        """
        dst = self.get_pending_queue(queue)
        start, count = 0, 5
        while True:
            arr = self.r.lrange(queue, start, count)
            if not arr:
                break
            self._enqueue(dst, *arr)
            start += count
        self.r.delete(queue)

    def initialize(self):
        """Broker 重启后，将所有 Pending 队列中消息重新放入 Doing 队列
        """
        for src in self.r.scan_iter('*_p'):
            dst = src[:-2]
            if self.r.exists(dst):
                self.redeliver(dst)

    def append_id(self, obj, obj_id):
        # type: (object, str) -> bytes
        """将消息的 id 和对应消息，组装成一个对象
        """
        id_bytes = obj_id.encode('utf-8')

        buffer = BytesIO()

        buffer.write(struct.pack('H', len(id_bytes)))
        buffer.write(id_bytes)

        buffer.write(self.dump(obj))

        return buffer.getvalue()

    def trim_id(self, buff):
        # type: (bytes) -> (object, int)
        """将组装后对象，还原会原始对象和对应消息 id
        """

        buffer = BytesIO(buff)
        length, = struct.unpack('H', buffer.read(4))
        obj_id = buffer.read(length).decode('utf-8')

        value = buffer.read()
        obj = self.dump(value)
        return obj, obj_id

    def _enqueue(self, queue, *obj):
        """将组装后对象存入队列
        """
        self.r.rpush(queue, *obj)

    def enqueue(self, queue, obj, obj_id):
        # type: (str, object, str) -> None
        """将组消息存入队列
        """
        self._enqueue(queue, self.append_id(obj, obj_id))

    def dequeue(self, queue):
        # type: (str) -> (object, str)
        """从 Doing 队列中取出消息
        """
        buff = self.r.rpoplpush(queue, self.get_pending_queue(queue))
        if buff:
            return self.load(buff)
        return None

    def _search_pending_queue(self, queue, obj_id):
        # type: (str, str) -> bytes
        """在 Pending 队列中查找具有指定 id 的消息
        """
        p_queue = self.get_pending_queue(queue)
        buff = self.r.lpop(p_queue)
        if not buff:
            # pending 队列为空
            return None
        result, _obj_id = self.trim_id(buff)
        if _obj_id == obj_id:
            return buff

        _que = deque()
        _que.append(result)

        buff = self.r.lpop(p_queue)
        while buff:
            result, _obj_id = self.trim_id(buff)
            if _obj_id == obj_id:
                self._enqueue(p_queue, *_que)
                return buff

            _que.append(result)
            buff = self.r.lpop(p_queue)

    def ack(self, queue, obj_id):
        # type: (str, str) -> None
        self. _search_pending_queue(queue, obj_id)

    def nack(self, queue, obj_id):
        # type: (str, str) -> None

        buff = self. _search_pending_queue(queue, obj_id)
        if buff:
            self._enqueue(queue, buff)
```

### FileMQ

学习 Kafka

> Kafka的整个设计中，Partition相当于一个非常长的数组，而Broker接收到的所有消息顺序写入这个大数组中。同时Consumer通过Offset顺序消费这些数据，并且不删除已经消费的数据，从而避免了随机写磁盘的过程。
>
> 由于磁盘有限，不可能保存所有数据，实际上作为消息系统Kafka也没必要保存所有数据，需要删除旧的数据。而这个删除过程，并非通过使用“读-写”模式去修改文件，而是将Partition分为多个Segment，每个Segment对应一个物理文件，通过删除整个文件的方式去删除Partition内的数据。这种方式清除旧数据的方式，也避免了对文件的随机写操作。
>
> Kafka删除Segment的方式，是直接删除Segment对应的整个log文件和整个index文件而非删除文件中的部分内容。
>
> [Kafka设计解析（六）- Kafka高性能架构之道](http://www.jasongj.com/kafka/high_throughput/)

存储逻辑

- 直接使用文件存储消息，每个 Topic 对应一个文件夹，文件夹内以递增的形式存放 Segment ，主文件以追加写入到当前 Segment 的方式保存消息。写入消息前先写入消息长度和校验码。
- 并使用另外一个文件记录 主文件最后一条记录的所在的 Segment 和 Offset
- Broker 每次启动前校验最后一条消息是否完整
- 为每组 Client ，在其订阅的 Topic 文件下使用两个文件，分别记录 Doing、Pending 队列在主文件中的 Segment 和 Offset，采用先写临时文件再改名的方式保证每条被正确持久化的消息至少被消费一次

#### 优势

- 突然断电对 Broker 影响较小，只会丢失未及时写入磁盘的消息（发生概率极小）

#### 缺点

- 消息只能按顺序消费， 每组 Client 必须先消费掉前一条消息，才能继续消费之后的消息

### MoonMQ

使用 MongoDB 存储消息

特点与 RushMQ 相似
