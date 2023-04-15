---
title: 复用已建立的 SSH 连接，减少输入密码次数
categories:
  - ssh
date: 2021-06-17 11:44:17+08:00
lastmod: 2021-06-17 11:44:17+08:00
tags:
- ssh
---

# 复用已建立的 SSH 连接，减少输入密码次数

有时候登录ssh机器是一个动态口令，频繁输入密码特别不方便。可以通过连接复用的方式来达到不用每次输入密码的目的。

<!-- more -->

Mac上没有诸如xshell之类的客户端，对于非免密登录的主机来说，多个相同主机的连接就要输入多次密码，无法实现会话克隆，非常难受。
终端的ssh是标准的OpenSSH client
如果需要克隆会话功能，可以通过配置打开:

```bash
vi ~/.ssh/config
```

增加：

```
Host *
    ControlMaster auto
    ControlPath ~/.ssh/socket/%h-%p-%r
    ControlPersist yes
```

这样每连上一个服务器都会自动在`~/.ssh/socket/`下创建一个socket文件，下次用相同用户名、端口、主机名进行连接就会自动复用，为防止意外，请事先使用对应用户创建好该目录

`ControlMaster` 默认是关闭的，通过上述配置可以打开,我们可以通过`ControlMaster`字段，让新建的SSH Session复用已有的socket通信文件。当我们将该字段值设置为`auto`时，每次建立SSH连接时程序都会检查是否存在已有到socket文件，有即复用，没有的话就创建一个符合ControlPath规则的socket文件。

`ControlPath` 用来描述socket文件路径，其中：

`%r` 是用户名，
`%h` 是远程主机 IP
`%p` 是端口

`ControlPersist yes` 打开之后即使关闭了所有的已连接ssh连接，一段时间内也能无需密码重新连接。也可以写作：
`ControlPersist 4h` 每次通过SSH与服务器建立连接之后，这条连接将被保持4个小时，即使在你退出服务器之后这条连接依然可以重用，因此，在你下一次(4小时之内)登录服务器时，你会发现连接以闪电般的速度建立完成，这个选项对于通过scp拷贝多个文件提速尤其明显，因为你不在需要为每个文件做单独的认证了

注：SSH版本必须是5.6或以上版本才可使用`ControlPersist`特性
配置文件最终如下：

```
Host *
    Compression yes
    ServerAliveInterval 30
    ServerAliveCountMax 360
    ControlMaster auto
    ControlPath ~/.ssh/socket/%h-%p-%r
    ControlPersist yes
    ForwardAgent yes
```

----

## 参考链接

- [Mac/Linux下SSH管理](https://blog.bbzhh.com/index.php/archives/162.html)
- [开启 ControlPersist 来大幅度提升 SSH 的连接速度](https://www.hi-linux.com/posts/21998.html)
