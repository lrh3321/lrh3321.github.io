---
title: 如何自己搭建git服务器
categories:
  - git
date: 2017-09-21 20:12:08+08:00
tags:
  - git
---
# 如何自己搭建 git 服务器

## 准备

+ 可以用 SSH 访问的服务器

## 在服务器上安装git

如果要在 Linux 上安装预编译好的 Git 二进制安装包，可以直接用系统提供的包管理工具。在 Fedora 上用 `yum` 安装：

```bash
yum install git-core
```

在 Ubuntu 这类 Debian 体系的系统上，可以用 `apt` 安装：

```bash
sudo apt install git
```

<!-- more -->

## SSH 连接

如果已经有了一个所有开发成员都可以用 SSH 访问的服务器，架设第一个服务器将变得异常简单，几乎什么都不用做。如果需要对仓库进行更复杂的访问控制，只要使用服务器操作系统的本地文件访问许可机制就行了。

如果需要团队里的每个人都对仓库有写权限，又不能给每个人在服务器上建立账户，那么提供 SSH 连接就是唯一的选择了。我们假设用来共享仓库的服务器已经安装了 SSH 服务，而且你通过它访问服务器。

有好几个办法可以让团队的每个人都有访问权。下面介绍3种：

### 1. 给每个人建立一个账户

直截了当但略过繁琐。反复运行 adduser 并给所有人设定临时密码可不是好玩的。

### 2. 在主机上建立一个 git 账户

让每个需要写权限的人发送一个 SSH 公钥，然后将其加入 git 账户的 `~/.ssh/authorized_keys` 文件。这样一来，所有人都将通过 git 账户访问主机。这丝毫不会影响提交的数据 — 访问主机用的身份不会影响提交对象的提交者信息。

首先，创建一个操作系统用户 `git`，并为其建立一个 `.ssh` 目录。

```bash
sudo adduser git
su git
cd
mkdir .ssh && chmod 700 .ssh
touch .ssh/authorized_keys && chmod 600 .ssh/authorized_keys
```

接着，我们需要为系统用户 git 的 authorized_keys 文件添加一些开发者 SSH 公钥。 假设我们已经获得了若干受信任的公钥，并将它们保存在临时文件中。将这些公钥加入系统用户 `git` 的 `.ssh` 目录下 `authorized_keys` 文件的末尾：

```bash
# 假设开发者的公钥保存在 /tmp/id_rsa.pub
cat /tmp/id_rsa.pub >> ~/.ssh/authorized_keys
```

### 3. 让 SSH 服务器通过某个 LDAP 服务，或者其他已经设定好的集中授权机制，来进行授权

只要每个人都能获得主机的 shell 访问权，任何可用的 SSH 授权机制都能达到相同效果。

## 新建一个空仓库

为开发者新建一个空仓库。可以借助带 `--bare` 选项的 `git init` 命令来做到这一点，该命令在初始化仓库时不会创建工作目录：

```bash
cd /opt/git
mkdir project.git
cd project.git
git init --bare
```

此时，有 ssh 访问权限的开发者可以克隆此仓库，并推回各自的改动，步骤很简单：

```bash
# 假设已在 DNS 配置或hosts文件中将 gitserver 指向此服务器
git clone git@gitserver:/opt/git/project.git
cd project
vim README.md
git commit -am 'fix for the README.md file'
git push origin master
```

通过这种方法，你可以快速搭建一个具有读写权限、面向多个开发者的 Git 服务器。

----

- [Gitea - Git with a cup of tea](https://gitea.io)
- [Gogs - painless self-hosted Git service](https://gogs.io)
- [GitLab](https://docs.gitlab.com/ee/install/)
