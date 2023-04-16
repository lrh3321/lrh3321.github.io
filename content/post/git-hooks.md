---
title: 利用 GitHook 构建持续交付和部署
categories:
  - git
date: 2017-10-22 21:16:08+08:00
lastmod: 2017-10-22 21:16:08+08:00
tags:
  - git
keywords:
  - git
  - hook
---
# 利用 GitHook 构建持续交付和部署

## Git 钩子

和其它版本控制系统一样，Git 能在特定的重要动作发生时触发自定义脚本。 有两组这样的钩子：客户端的和服务器端的。 客户端钩子由诸如提交和合并这样的操作所调用，而服务器端钩子作用于诸如接收被推送的提交这样的联网操作。 你可以随心所欲地运用这些钩子。本文只介绍服务器端钩子。

### 安装一个钩子

钩子都被存储在 Git 目录下的 `hooks` 子目录中。 也即绝大部分项目中的 `.git/hooks` 。 当你用 `git init` 初始化一个新版本库时，Git 默认会在这个目录中放置一些示例脚本。这些脚本除了本身可以被调用外，它们还透露了被触发时所传入的参数。 所有的示例都是 shell 脚本，其中一些还混杂了 Perl 代码，不过，任何正确命名的可执行脚本都可以正常使用 —— 你可以用 Ruby 或 Python，或其它语言编写它们。 这些示例的名字都是以 .sample 结尾，如果你想启用它们，得先移除这个后缀。

把一个正确命名且可执行的文件放入 Git 目录下的 `hooks` 子目录中，即可激活该钩子脚本。 这样一来，它就能被 Git 调用。

<!-- more -->

### 服务器端钩子

这些钩子脚本在推送到服务器之前和之后运行。 推送到服务器前运行的钩子可以在任何时候以非零值退出，拒绝推送并给客户端返回错误消息，还可以依你所想设置足够复杂的推送策略。

### `pre-receive`

处理来自客户端的推送操作时，最先被调用的脚本是 `pre-receive`。 它从标准输入获取一系列被推送的引用。如果它以非零值退出，所有的推送内容都不会被接受。 你可以用这个钩子阻止对引用进行非快进（non-fast-forward）的更新，或者对该推送所修改的所有引用和文件进行访问控制。

### `update`

`update` 脚本和 `pre-receive` 脚本十分类似，不同之处在于它会为每一个准备更新的分支各运行一次。 假如推送者同时向多个分支推送内容，`pre-receive` 只运行一次，相比之下 `update` 则会为每一个被推送的分支各运行一次。 它不会从标准输入读取内容，而是接受三个参数：引用的名字（分支），推送前的引用指向的内容的 SHA-1 值，以及用户准备推送的内容的 SHA-1 值。 如果 `update` 脚本以非零值退出，只有相应的那一个引用会被拒绝；其余的依然会被更新。

### `post-receive`

`post-receive` 挂钩在整个过程完结以后运行，可以用来更新其他系统服务或者通知用户。 它接受与 `pre-receive` 相同的标准输入数据。 它的用途包括给某个邮件列表发信，通知持续集成（continous integration）的服务器，或者更新问题追踪系统（ticket-tracking system） —— 甚至可以通过分析提交信息来决定某个问题（ticket）是否应该被开启，修改或者关闭。 该脚本无法终止推送进程，不过客户端在它结束运行之前将保持连接状态，所以如果你想做其他操作需谨慎使用它，因为它将耗费你很长的一段时间。

## 配置测试服务器

### 在测试服务器上新建仓库

因为需要在测试服务器上构建和集成，所以仓库需要有工作目录

```bash
cd /opt/git
mkdir demo.git
cd demo.git
git init
# 允许更新非纯仓库的当前分支
git config receive.denyCurrentBranch ignore
```

### 编写`post-receive`钩子

```bash
vim /opt/git/demo/.git/hooks/post-receive
```

一个仅供参考的Spring boot项目钩子

```bash
#!/bin/bash

DEST=/opt/git/demo

unset GIT_DIR

pushd $DEST

# 清理仓库
git reset --hard
# 打包Jar
gradle bootJar
# 使用Docker打包镜像，需要用户属于docker组
docker build -t demo:latest
# 移除旧的容器
docker stop demo && docker rm demo
# 使用新镜像启动容器
docker run -d --name demo demo:latest
popd
```

之后每次向测试服务器推送代码，都会自动执行`post-receive`钩子

---

- [husky - Modern native Git hooks made easy](https://github.com/typicode/husky)
