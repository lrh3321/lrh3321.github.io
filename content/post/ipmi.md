---
title: "使用 IPMI 管理 Linux 服务器"
description: 
slug: ipmi
date: 2023-07-15T11:08:58+08:00
lastmod: 2023-07-15T11:08:58+08:00
categories:
  - ipmi
tags:
  - ipmi
  - bmc
image: 
math: false
toc: true
comments: false
license: 
keywords:
  - ipmi
  - bmc
style:
hidden: false
---
# 使用 IPMI 管理 Linux 服务器

## 安装 ipmitool

### Debian 系

```bash
apt install -y ipmitool
```

### RHEL 系

```bash
yum install -y ipmitool
# 或
dnf install -y ipmitool
```

```bash
# modprobe ipmi_msghandler
# modprobe ipmi_devintf
# modprobe ipmi_si

ipmitool user list 1
ipmitool user list 2
```

## 使用命令设置IPMI地址

```bash
# 查看当前设置
ipmitool lan print 1
ipmitool lan print 8

ipmitool lan set 1 ipsrc static #设置IPMI的IP地址配置方式未静态IP
ipmitool lan set 1 ipaddr 192.168.21.200 #设置IPMI的IP地址
ipmitool lan set 1 netmask 255.255.255.0 #设置IPMI的掩码
ipmitool lan set 1 defgw ipaddr 192.168.21.1 #设置IPMI的网关
```

## 重置服务器硬件管理口 IMM IPMI BMC 密码

```bash
ipmitool user set password 2 Lrh@3321
```

### 常见服务器 IPMI 初始密码

- DELL 服务器: `root`\ `calvin` `root` \ `root`
- 浪潮服务器: `root` \ `superuser`
- 泰安主板: `root` \ `superuser`
- 超微主板: `ADMIN` \ `ADMIN`
- Lenvon: `USERID` \ `PASSW0RD`

## 远程管理其他服务器

```bash
bmc_ip=""
bmc_user="root"
bmc_passwd="root"

args="" # 要执行的参数

ipmitool -H ${bmc_ip} -I lanplus -U ${bmc_user} -P ${bmc_passwd} ${args}

alias remote_ipmitool='ipmitool -H ${bmc_ip} -I lanplus -U ${bmc_user} -P ${bmc_passwd}'
```

---

- [服务器 I IPMI 密码重置及初始密码](https://blog.csdn.net/qq_40907977/article/details/116330142)
- [使用命令设置IPMI地址](https://blog.csdn.net/qq_33932782/article/details/127222081)
- [重置服务器硬件管理口 IMM IPMI BMC 密码](https://blog.csdn.net/wangyfde/article/details/107388792)
