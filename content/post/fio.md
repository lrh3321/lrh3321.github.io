---
title: "使用 Fio 进行磁盘性能测试"
description: 
slug: fio
date: 2023-07-15T11:10:37+08:00
lastmod: 2023-07-15T11:10:37+08:00
categories:
  - disk
tags:
  - fio
  - disk
  - benchmark
image: 
math: false
toc: true
comments: false
license: 
keywords:
  - fio
  - disk
  - benchmark
style:
hidden: false
---
## 使用 Fio 进行磁盘性能测试

现在 Fio 已经安装到了你的系统中。现在是时候看一些如何使用 Fio 的例子了。我们将进行随机写、读和读写测试。

## 执行随机写测试

执行下面的命令来开始。这个命令将要同一时间执行两个进程，写入共计 4GB（ 4 个任务 x 512MB = 2GB） 文件：

```text
sudo fio --name=randwrite --ioengine=libaio --iodepth=1 --rw=randwrite --bs=4k --direct=0 --size=512M --numjobs=2 --runtime=240 --group_reporting
...
fio-2.2.10
Starting 2 processes

randwrite: (groupid=0, jobs=2): err= 0: pid=7271: Sat Aug 5 13:28:44 2017
 write: io=1024.0MB, bw=2485.5MB/s, iops=636271, runt= 412msec
 slat (usec): min=1, max=268, avg= 1.79, stdev= 1.01
 clat (usec): min=0, max=13, avg= 0.20, stdev= 0.40
 lat (usec): min=1, max=268, avg= 2.03, stdev= 1.01
 clat percentiles (usec):
 | 1.00th=[ 0], 5.00th=[ 0], 10.00th=[ 0], 20.00th=[ 0],
 | 30.00th=[ 0], 40.00th=[ 0], 50.00th=[ 0], 60.00th=[ 0],
 | 70.00th=[ 0], 80.00th=[ 1], 90.00th=[ 1], 95.00th=[ 1],
 | 99.00th=[ 1], 99.50th=[ 1], 99.90th=[ 1], 99.95th=[ 1],
 | 99.99th=[ 1]
 lat (usec) : 2=99.99%, 4=0.01%, 10=0.01%, 20=0.01%
 cpu : usr=15.14%, sys=84.00%, ctx=8, majf=0, minf=26
 IO depths : 1=100.0%, 2=0.0%, 4=0.0%, 8=0.0%, 16=0.0%, 32=0.0%, >=64=0.0%
 submit : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
 complete : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
 issued : total=r=0/w=262144/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
 latency : target=0, window=0, percentile=100.00%, depth=1

Run status group 0 (all jobs):
 WRITE: io=1024.0MB, aggrb=2485.5MB/s, minb=2485.5MB/s, maxb=2485.5MB/s, mint=412msec, maxt=412msec

Disk stats (read/write):
 sda: ios=0/0, merge=0/0, ticks=0/0, in_queue=0, util=0.00%
```

## 执行随机读测试

我们将要执行一个随机读测试，我们将会尝试读取一个随机的 2GB 文件。

```text
sudo fio --name=randread --ioengine=libaio --iodepth=16 --rw=randread --bs=4k --direct=0 --size=512M --numjobs=4 --runtime=240 --group_reporting
```

你应该会看到下面这样的输出：

```text
...
fio-2.2.10
Starting 4 processes
randread: Laying out IO file(s) (1 file(s) / 512MB)
randread: Laying out IO file(s) (1 file(s) / 512MB)
randread: Laying out IO file(s) (1 file(s) / 512MB)
randread: Laying out IO file(s) (1 file(s) / 512MB)
Jobs: 4 (f=4): [r(4)] [100.0% done] [71800KB/0KB/0KB /s] [17.1K/0/0 iops] [eta 00m:00s]
randread: (groupid=0, jobs=4): err= 0: pid=7586: Sat Aug 5 13:30:52 2017
 read : io=2048.0MB, bw=80719KB/s, iops=20179, runt= 25981msec
 slat (usec): min=72, max=10008, avg=195.79, stdev=94.72
 clat (usec): min=2, max=28811, avg=2971.96, stdev=760.33
 lat (usec): min=185, max=29080, avg=3167.96, stdev=798.91
 clat percentiles (usec):
 | 1.00th=[ 2192], 5.00th=[ 2448], 10.00th=[ 2576], 20.00th=[ 2736],
 | 30.00th=[ 2800], 40.00th=[ 2832], 50.00th=[ 2928], 60.00th=[ 3024],
 | 70.00th=[ 3120], 80.00th=[ 3184], 90.00th=[ 3248], 95.00th=[ 3312],
 | 99.00th=[ 3536], 99.50th=[ 6304], 99.90th=[15168], 99.95th=[18816],
 | 99.99th=[22912]
 bw (KB /s): min=17360, max=25144, per=25.05%, avg=20216.90, stdev=1605.65
 lat (usec) : 4=0.01%, 10=0.01%, 250=0.01%, 500=0.01%, 750=0.01%
 lat (usec) : 1000=0.01%
 lat (msec) : 2=0.01%, 4=99.27%, 10=0.44%, 20=0.24%, 50=0.04%
 cpu : usr=1.35%, sys=5.18%, ctx=524309, majf=0, minf=98
 IO depths : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=100.0%, 32=0.0%, >=64=0.0%
 submit : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
 complete : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.1%, 32=0.0%, 64=0.0%, >=64=0.0%
 issued : total=r=524288/w=0/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
 latency : target=0, window=0, percentile=100.00%, depth=16

Run status group 0 (all jobs):
 READ: io=2048.0MB, aggrb=80718KB/s, minb=80718KB/s, maxb=80718KB/s, mint=25981msec, maxt=25981msec

Disk stats (read/write):
 sda: ios=521587/871, merge=0/1142, ticks=96664/612, in_queue=97284, util=99.85%
```

最后，我们想要展示一个简单的随机读-写测试来看一看 Fio 返回的输出类型。

## 读写性能测试

下述命令将会测试 USB Pen 驱动器 (`/dev/sdc1`) 的随机读写性能：

```text
sudo fio --randrepeat=1 --ioengine=libaio --direct=1 --gtod_reduce=1 --name=test --filename=random_read_write.fio --bs=4k --iodepth=64 --size=4G --readwrite=randrw --rwmixread=75
```

下面的内容是我们从上面的命令得到的输出：

```text
fio-2.2.10
Starting 1 process
Jobs: 1 (f=1): [m(1)] [100.0% done] [217.8MB/74452KB/0KB /s] [55.8K/18.7K/0 iops] [eta 00m:00s]
test: (groupid=0, jobs=1): err= 0: pid=8475: Sat Aug 5 13:36:04 2017
 read : io=3071.7MB, bw=219374KB/s, iops=54843, runt= 14338msec
 write: io=1024.4MB, bw=73156KB/s, iops=18289, runt= 14338msec
 cpu : usr=6.78%, sys=20.81%, ctx=1007218, majf=0, minf=9
 IO depths : 1=0.1%, 2=0.1%, 4=0.1%, 8=0.1%, 16=0.1%, 32=0.1%, >=64=100.0%
 submit : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.0%, >=64=0.0%
 complete : 0=0.0%, 4=100.0%, 8=0.0%, 16=0.0%, 32=0.0%, 64=0.1%, >=64=0.0%
 issued : total=r=786347/w=262229/d=0, short=r=0/w=0/d=0, drop=r=0/w=0/d=0
 latency : target=0, window=0, percentile=100.00%, depth=64

Run status group 0 (all jobs):
 READ: io=3071.7MB, aggrb=219374KB/s, minb=219374KB/s, maxb=219374KB/s, mint=14338msec, maxt=14338msec
 WRITE: io=1024.4MB, aggrb=73156KB/s, minb=73156KB/s, maxb=73156KB/s, mint=14338msec, maxt=14338msec

Disk stats (read/write):
 sda: ios=774141/258944, merge=1463/899, ticks=748800/150316, in_queue=900720, util=99.35%
```

---
- [如何在 Linux 中使用 Fio 来测评硬盘性能](https://zhuanlan.zhihu.com/p/41802948)
