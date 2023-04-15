---
title: SSH配置文件详解
slug: ssh_config
description: "SSH配置文件详解"
categories:
  - ssh
date: 2017-08-15 20:11:11+08:00
lastmod: 2020-06-15 20:11:11+08:00
tags:
  - ssh
---
# SSH 配置文件详解

## 配置文件 `~/.ssh/config` 和 `/etc/ssh/ssh_config`

一般不需要修改 OpenSSH 客户端配置文件。

对于给定用户，共有两个配置文件：`~/.ssh/config`（用户专用）和`/etc/ssh/ssh_config`（全局共享）。

要按照该顺序读取这些文件，对于给定的某个参数，它使用的是读取过程中发现的第一个配置。用户可以通过以下方式将全局参数设置覆盖掉：在自己的用户配置文件中设置同样的参数即可。

在`ssh`或`scp`命令行上给出的参数的优先级要高于这两个文件中所设置的参数的优先级。

用户的`~/.ssh/config`文件必须由该用户所有（他是目录"`~/`"的所有者），并且除了所有者之外任何人都不能写入该文件。

否则客户端就会给出一条错误消息然后退出。

这个文件的模式通常被设为 `600`，这是因为除了它的所有者之外任何人没有理由能够读取它。

这些配置文件中的配置行包含着声明，这些声明均以某个关键字（不区分大小写）开头，后面跟着空格，最后是参数（区分大小写）。

可以使用关键字`Host`，让声明只作用于特定的系统。`Host`声明作用于它与下一条`Host`声明之间的所有配置行。

<!-- more -->

### CheckHostIP

`yes | no`

如果将其设置为`yes`（默认值），那么除了用**known_hosts**文件中的主机名之外，还可以采用IP地址来识别远程系统。

若设置为`no`，则只使用主机名。

将`CheckHostIP`设置为yes可以提高系统的安全性。

### ForwardX11

`yes | no`

如果设置为`yes`，那么自动通过一条安全通道以不可信模式来转发X11连接，但是并不设置shell变量`DISPLAY`。如果`ForwardX11Trusted`也设置为`yes`,那么连接以可信模式转发。此外，可以在命令行上使用选项-X以不可信模式重定向X11连接。

这个参数的默认值是`no`。要想让X11转发起作用，还必须将服务器上的`/etc/sshd_config`文件中的`X11Forwarding`设置为`yes`。

### ForwardX11Trusted

`yes | no`

与ForwardX11一块使用时，ForwardX11必须设置为 `yes`（默认），这个声明才能起作用。
当这个声明设置为`yes`（默认），而`ForwardX11`也设置为`yes`时，这个声明将设置shell变量`DISPLAY`，并给予远程X11客户端对原来的（服务器）X11显示的完全访问权限。
此外，可以在命令行上使用选项`-Y`以可信模式重定向X11连接。

这个声明的默认值是`no`。要想让X11转发起作用，必须将服务器上的`/etc/sshd_config`文件中的`X11Forwarding`设置为`yes`。

### HashKnownHosts

- 当设置为 `yes` 时，OpenSSH 会将文件 `~/.ssh/known_hosts` 中的主机名和地址进行散列。
- 当设置为 `no` 时，主机名与地址将以明文形式写入。Ubuntu Linux 将这份声明设置为 `yes` 来提高系统的安全性。

### Host hostnames

指定它后面的（直到下一个主机声明为止）声明只适用于与hostnames相匹配的主机。
Hostnames可以包含?与`*`通配符。单个的`*`指定所有主机。如果没有这个关键字，任何声明都适用于所有主机。

### HostbasedAuthentication

`yes | no`

- 当设置为 `yes` 时，尝试进行rhosts身份验证。
- 对于安全性要求较高的系统，设置为 `no`（默认）。

### HostKeyAlgorithms algorithms

其中algorithms是一个由逗号隔开的算法列表，客户端按照优先级顺序依次使用这些算法。
从`ssh-rsa`或`ssh-dss`中选择algorithms（默认值为`ssh-rsa, ssh-dss`）。

### Port num

使OpenSSH通过num端口与远程系统连接。默认值为 `22`。

### StrictHostKeyChecking

`yes | no | ask`

决定OpenSSH是否将主机密钥添加到用户的known_hosts文件中以及如何添加。
如果将该选项设置为ask，那么在连接新系统时会询问是否添加主机密钥；
如果设置为no，就会自动添加主机密钥；
如果设置为yes，就要求手工添加主机密钥。
若将参数设置yes或ask，则当某系统的主机密钥发生改变之后，OpenSSH会拒绝连接到该系统。
对于安全性要求较高的系统，请将此参设置为yes或ask。默认为ask。

### TCPKeepAlive

`yes | no`

如果设置为yes（默认值），就定期检查连接是否存活。如果服务器崩溃或者由于其他原因导致连接死掉，那么这种检查将会导致ssh或scp连接中断，即便连接只是暂时死掉。
若将这个参数设置为no，则会导致客户端不去检查连接是否存活。这项声明用到了TCP keepalive选项，它未经加密，并且容易受到IP欺骗（参见术语表）。如果希望采用能够防止IP欺骗的替代品，
那么可以采用基于服务器的相关技术。

### User name

指定登录系统时所用的用户名。可用Host声明来指定系统。该选项意味着，在远程系统上登录时，如果使用的用户名不同于在本地系统上登录所用的用户名，那么不必在命令行上输入用户名。

```text
# $OpenBSD: ssh_config,v 1.30 2016/02/20 23:06:23 sobrado Exp $

# This is the ssh client system-wide configuration file.  See
# ssh_config(5) for more information.  This file provides defaults for
# users, and the values can be changed in per-user configuration files
# or on the command line.

# Configuration data is parsed as follows:
#  1. command line options
#  2. user-specific file
#  3. system-wide file
# Any configuration value is only changed the first time it is set.
# Thus, host-specific definitions should be at the beginning of the
# configuration file, and defaults at the end.

# Site-wide defaults for some commonly used options.  For a comprehensive
# list of available options, their meanings and defaults, please see the
# ssh_config(5) man page.

# Host *
#   ForwardAgent no
#   ForwardX11 no
#   RhostsRSAAuthentication no
#   RSAAuthentication yes
#   PasswordAuthentication yes
#   HostbasedAuthentication no
#   GSSAPIAuthentication no
#   GSSAPIDelegateCredentials no
#   BatchMode no
#   CheckHostIP yes
#   AddressFamily any
#   ConnectTimeout 0
#   StrictHostKeyChecking ask
#   IdentityFile ~/.ssh/identity
#   IdentityFile ~/.ssh/id_rsa
#   IdentityFile ~/.ssh/id_dsa
#   IdentityFile ~/.ssh/id_ecdsa
#   IdentityFile ~/.ssh/id_ed25519
#   Port 22
#   Protocol 2
#   Cipher 3des
#   Ciphers aes128-ctr,aes192-ctr,aes256-ctr,arcfour256,arcfour128,aes128-cbc,3des-cbc
#   MACs hmac-md5,hmac-sha1,umac-64@openssh.com,hmac-ripemd160
#   EscapeChar ~
#   Tunnel no
#   TunnelDevice any:any
#   PermitLocalCommand no
#   VisualHostKey no
#   ProxyCommand ssh -q -W %h:%p gateway.example.com
#   RekeyLimit 1G 1h
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile=~/.ssh/known_hosts
    IdentityFile=~/.ssh/github_rsa
    IdentityFile=~/.ssh/github3_rsa
    IdentityFile=~/.ssh/id_rsa

Host github.com
    StrictHostKeyChecking no
    UserKnownHostsFile=/dev/null
    IdentityFile=~/.ssh/github_rsa

```

## SSH登录很慢问题的解决

### DNS反向解析的问题

OpenSSH 在用户登录的时候会验证 IP ，它根据用户的IP使用反向DNS找到主机名，再使用 DNS 找到 IP 地址，最后匹配一下登录的 IP 是否合法。如果客户机的 IP 没有域名，或者 DNS 服务器很慢或不通，那么登录就会很花时间。

解决办法：

在目标服务器上修改sshd服务器端配置,并重启 sshd

`vi /etc/ssh/sshd_config`，设置 `UseDNS` 为 `no` 即可

当然也可以通过提供DNS正确反向解析的方法解决，有如下两种思路

1. 修改server上的 hosts 文件，将目标机器的IP和域名加上去。或者
2. 让本机的 DNS 服务器能解析目标地址。

在 server 上 `/etc/hosts` 文件中把常用的 ip 和 hostname 加入，然后在` /etc/nsswitch.conf` 看看程序是否先查询 `hosts` 文件（一般缺省是这样）。

### GSSAPI 认证造成的

用 `ssh -v user@server` 可以看到登录时有如下信息：

```
debug1: Next authentication method: gssapi-with-mic

debug1: Unspecified GSS failure. Minor code may provide more information
```

> 注：`ssh -vvv user@server` 可以看到更细的debug信息

解决办法：

在客户端上修改 ssh 客户端配置(注意不是 `sshd_conf`)

`vi /etc/ssh/ssh_config`，设置 `GSSAPIAuthentication no`  并重启 `sshd`

可以使用

```bash script
ssh -A -o StrictHostKeyChecking=no -o GSSAPIAuthentication=no -p 32200 username@server_ip
```

GSSAPI ( Generic Security Services Application Programming Interface) 是一套类似Kerberos 5 的通用网络安全系统接口。该接口是对各种不同的客户端服务器安全机制的封装，以消除安全接口的不同，降低编程难度。但该接口在目标机器无域名解析时会有问题

使用 `strace` 查看后发现，ssh 在验证完 key 之后，进行 `authentication gssapi-with-mic`，此时先去连接 DNS 服务器，在这之后会进行其他操作。

## How to Keep Alive SSH Sessions

添加以下配置到 `/etc/ssh/ssh_config` (修改系统内所有用户) 或 `~/.ssh/config ` (只修改当前用户) ，开启 keep alive

```
Host *
    ServerAliveInterval 300
    ServerAliveCountMax 2
```

添加以下配置到 `/etc/ssh/sshd_config`，可以使 OpenSSH 服务器保留所有活跃连接:

```
ClientAliveInterval 300
ClientAliveCountMax 2
```

这些设置将使SSH客户端或服务器每300秒（5分钟）向另一侧发送一个空数据包，并在两次尝试后仍未收到任何响应的情况下放弃，此时连接很可能已被丢弃。

## SSH登录时不自动执行 `.bashrc`

在 `~/.bash_profile` 文件中添加以下内容：

```bash
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
```

## `key_load_public: invalid format`

重新生成公钥

```bash
ssh-keygen -f ~/.ssh/id_rsa -y > ~/.ssh/id_rsa.pub
```

## Authentication refused: bad ownership or modes for directory 
 
**问题**

设置 ssh 免密码登陆的时候，发现有一些机器设置不生效。有一些机器正常。

**跟踪**

登陆目标机器，查看 sshd 的日志信息。日志信息目录为，`/var/log/auth.log`
你会发现如下字样的日志信息。

```
Jul 22 14:20:33 v138020.go sshd[4917]: Authentication refused: bad ownership or modes for directory /home/xinhailong
```

**原因**

sshd 为了安全，对属主的目录和文件权限有所要求。如果权限不对，则 ssh 的免密码登陆不生效。

用户目录权限为 `755` 或者 `700`，就是不能是`77x`

- `.ssh` 目录权限一般为 `755` 或者 `700`
- `rsa_id.pub` 及 `authorized_keys` 权限一般为 `644`
- `rsa_id` 权限必须为 `600`

**解决方法**

检测目录权限，把不符合要求的按要求设置权限即可。

---

## 参考链接

- [配置文件~/.ssh/config和/etc/ssh/ssh_config](http://book.51cto.com/art/200906/126284.htm)
- [SSH登录很慢问题的解决](https://www.cnblogs.com/leoyang63/articles/12061136.html)
- [How to Keep Alive SSH Sessions
](https://patrickmn.com/aside/how-to-keep-alive-ssh-sessions/)
- [ssh免密码登陆设置时Authentication refused: bad ownership or modes错误解决方法](https://www.bo56.com/ssh%E5%85%8D%E5%AF%86%E7%A0%81%E7%99%BB%E9%99%86%E8%AE%BE%E7%BD%AE%E6%97%B6authentication-refused-bad-ownership-or-modes%E9%94%99%E8%AF%AF%E8%A7%A3%E5%86%B3%E6%96%B9%E6%B3%95/)
- [设置免密码ssh后出现key_load_public: invalid format](https://hostingwiki.cn/en/%E8%AE%BE%E7%BD%AE%E5%85%8D%E5%AF%86%E7%A0%81ssh%E5%90%8E%E5%87%BA%E7%8E%B0key_load_public-invalid-format/)
