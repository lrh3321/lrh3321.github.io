---
title: SSH 端口转发
slug: ssh-forward
categories:
  - ssh
date: 2020-02-22 15:34:40+08:00
lastmod: 2022-04-07 18:30:40+08:00
tags:
  - ssh
---

# SSH 端口转发

SSH 会自动加密和解密所有 SSH 客户端与服务端之间的网络数据。但是，SSH 还同时提供了一个非常有用的功能，这就是端口转发。它能够将其他 TCP 端口的网络数据通过 SSH 链接来转发，并且自动提供了相应的加密及解密服务。这一过程有时也被叫做“隧道”（tunneling），这是因为 SSH 为其他 TCP 链接提供了一个安全的通道来进行传输而得名。例如，Telnet，SMTP，LDAP 这些 TCP 应用均能够从中得益，避免了用户名，密码以及隐私信息的明文传输。而与此同时，如果您工作环境中的防火墙限制了一些网络端口的使用，但是允许 SSH 的连接，那么也是能够通过将 TCP 端口转发来使用 SSH 进行通讯。总的来说 SSH 端口转发能够提供两大功能：

1. 加密 SSH Client 端至 SSH Server 端之间的通讯数据。
1. 突破防火墙的限制完成一些之前无法建立的 TCP 连接。

使用了端口转发之后，TCP 端口 A 与 B 之间现在并不直接通讯，而是转发到了 SSH 客户端及服务端来通讯，从而自动实现了数据加密并同时绕过了防火墙的限制。

## SSH端口本地转发

假设在实验室里有一台 LDAP 服务器（LdapServerHost），但是限制了只有本机上部署的应用才能直接连接此 LDAP 服务器。如果我们由于调试或者测试的需要想临时从远程机器（LdapClientHost）直接连接到这个 LDAP 服务器 , 有什么方法能够实现呢？

答案无疑是本地端口转发了，它的命令格式是：

```bash
ssh -L <local port>:<remote host>:<remote port> <SSH hostname>
```

在 LdapClientHost 上执行如下命令即可建立一个 SSH 的本地端口转发，例如：

```bash
ssh -L 7001:localhost:389 LdapServerHost
```

这里需要注意的是本例中我们选择了 `7001` 端口作为本地的监听端口，在选择端口号时要注意非管理员帐号是无权绑定 `1-1023` 端口的，所以一般是选用一个 `1024-65535` 之间的并且尚未使用的端口号即可。

然后我们可以将远程机器（LdapClientHost）上的应用直接配置到本机的 `7001` 端口上（而不是 LDAP 服务器的 `389` 端口上）。之后的数据流将会是下面这个样子：

- 我们在 LdapClientHost 上的应用将数据发送到本机的 `7001` 端口上，
而本机的 SSH Client 会将 `7001` 端口收到的数据加密并转发到 LdapServertHost 的 SSH Server 上。
- SSH Server 会解密收到的数据并将之转发到监听的 LDAP `389` 端口上，
- 最后再将从 LDAP 返回的数据原路返回以完成整个流程。

我们可以看到，这整个流程应用并没有直接连接 LDAP 服务器，而是连接到了本地的一个监听端口，但是 SSH 端口转发完成了剩下的所有事情，加密，转发，解密，通讯。

这里有几个地方需要注意：

1. SSH 端口转发是通过 SSH 连接建立起来的，我们必须保持这个 SSH 连接以使端口转发保持生效。一旦关闭了此连接，相应的端口转发也会随之关闭。
1. 我们只能在建立 SSH 连接的同时创建端口转发，而不能给一个已经存在的 SSH 连接增加端口转发。
1. 你可能会疑惑上面命令中的 `<remote host>` 为什么用 `localhost`，它指向的是哪台机器呢？在本例中，它指向 LdapServertHost 。我们为什么用 `localhost` 而不是 IP 地址或者主机名呢？其实这个取决于我们之前是如何限制 LDAP 只有本机才能访问。如果只允许 lookback 接口访问的话，那么自然就只有 `localhost` 或者 IP 为 `127.0.0.1` 才能访问了，而不能用真实 IP 或者主机名。
1. 命令中的 `<remote host>` 和 `<SSH hostname>` 必须是同一台机器么？其实是不一定的，它们可以是两台不同的机器。我们在后面的例子里会详细阐述这点。
1. 好了，我们已经在 LdapClientHost 建立了端口转发，那么这个端口转发可以被其他机器使用么？比如能否新增加一台 LdapClientHost2 来直接连接 LdapClientHost 的 `7001` 端口？答案是不行的，在主流 SSH 实现中，本地端口转发绑定的是 lookback 接口，这意味着只有 `localhost` 或者 `127.0.0.1` 才能使用本机的端口转发 , 其他机器发起的连接只会得到“ connection refused. ”。好在 SSH 同时提供了 `GatewayPorts` 关键字，我们可以通过指定它与其他机器共享这个本地端口转发。

```bash
ssh -g -L <local port>:<remote host>:<remote port> <SSH hostname>
```

对应的参数格式:

- `-L [bind_address:]port:host:hostport`
- `-L [bind_address:]port:remote_socket`
- `-L local_socket:host:hostport`
- `-L local_socket:remote_socket`

相关选项：

 `-f` 后台启用
 `-N` 不打开远程 shell，处于等待状态
 `-g` 启用网关功能

## SSH端口远程装发

这次假设由于网络或防火墙的原因我们不能用 SSH 直接从 LdapClientHost 连接到 LDAP 服务器（LdapServertHost），但是反向连接却是被允许的。那此时我们的选择自然就是远程端口转发了。

它的命令格式是：

```bash
ssh -R <local port>:<remote host>:<remote port> <SSH hostname>
```

例如在 LDAP 服务器（LdapServertHost）端执行如下命令：

```bash
ssh -R 7001:localhost:389 LdapClientHost
```

和本地端口转发相比，这次的图里，SSH Server 和 SSH Client 的位置对调了一下，但是数据流依然是一样的。我们在 LdapClientHost 上的应用将数据发送到本机的 `7001` 端口上，而本机的 SSH Server 会将 `7001` 端口收到的数据加密并转发到 LdapServertHost 的 SSH Client 上。 SSH Client 会解密收到的数据并将之转发到监听的 LDAP `389` 端口上，最后再将从 LDAP 返回的数据原路返回以完成整个流程。

对应的参数格式:

- `-R [bind_address:]port:host:hostport`
- `-R [bind_address:]port:local_socket`
- `-R remote_socket:host:hostport`
- `-R remote_socket:local_socket`
- `-R [bind_address:]port`

## 动态端口转发

本地转发和远程转发，的前提是要求有一个固定的应用服务端的端口号，例如前面例子中的 LDAP 服务端的 `389` 端口。那如果没有这个端口号怎么办？等等，什么样的应用会没有这个端口号呢？嗯，比如说用浏览器进行 Web 浏览，比如说 MSN 等等。

当我们在一个不安全的 WiFi 环境下上网，用 SSH 动态转发来保护我们的网页浏览及 MSN 信息无疑是十分必要的。让我们先来看一下动态转发的命令格式：

```bash
ssh -D <local port> <SSH Server>
```

SSH 实际是创建了一个 SOCKS 代理服务。而这里需要值得注意的是，此时 SSH 所包护的范围只包括从浏览器端（SSH Client 端）到 SSH Server 端的连接，并不包含从 SSH Server 端 到目标网站的连接。如果后半截连接的安全不能得到充分的保证的话，这种方式仍不是合适的解决方案。

对应的参数格式:

- `-D [bind_address:]port`

如果经常使用动态转发，可以将设置写入 SSH 客户端的用户个人配置文件（`~/.ssh/config`）。

```text
DynamicForward tunnel-host:local-port
```

----

## 参考资料

- [实战 SSH 端口转发](https://www.ibm.com/developerworks/cn/linux/l-cn-sshforward/index.html)
- [SSH 端口转发](https://wangdoc.com/ssh/port-forwarding.html)
