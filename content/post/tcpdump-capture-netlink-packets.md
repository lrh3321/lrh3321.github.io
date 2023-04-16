---
title: tcpdump 捕获 netlink 包
categories:
  - tcpdump
slug: "tcpdump-capture-netlink-packets"
date: 2021-07-17 11:44:17+08:00
lastmod: 2022-07-17 11:44:17+08:00
tags:
  - tcpdump
  - netlink
  - capture
---

# `tcpdump` 捕获 `netlink` 包

NLMON

NLMON is a Netlink monitor device.

Use an NLMON device when you want to monitor system Netlink messages.

Here's how to create an NLMON device:

```bash
ip link add nlmon0 type nlmon
ip link set nlmon0 up
tcpdump -i nlmon0 -w nlmsg.pcap
```

This creates an NLMON device named nlmon0 and sets it up. Use a packet sniffer (for example, tcpdump) to capture Netlink messages. Recent versions of Wireshark feature decoding of Netlink messages.

<!-- more -->

```bash
modprobe nlmon
ip link add type nlmon
ip link set nlmon0 up
tcpdump -i nlmon0  -s 0 -w nlmon.pcap 
ip link set nlmon0 down
ip link del dev nlmon0
rmmod nlmon
```

```bash
modprobe nlmon
ip netns add testing
ip -n testing link add nlmon0 type nlmon
ip -n testing link set dev nlmon0 up
# 必须使用 -w 保存到文件
ip netns exec tcpdump -i nlmon0 -w netlinik.pcap
```

----

## 参考链接

- [Introduction to Linux interfaces for virtual networking](https://developers.redhat.com/blog/2018/10/22/introduction-to-linux-interfaces-for-virtual-networking#nlmon)
