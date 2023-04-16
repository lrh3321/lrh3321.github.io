---
title: "Git Tips"
description: Git 使用技巧
slug: git-tips
date: 2023-04-15T19:23:03+08:00
lastmod: 2023-04-15T19:23:03+08:00
categories:
  - git
tags:
  - git
image: 
math: false
toc: true
comments: false
license: 
keywords:
  - git
style:
hidden: false
draft: false

# https://gohugo.io/content-management/front-matter/
---
# Git 使用小技巧

## 取消 `sslVerify`

应对 SNI 阻断

`git config --global http.sslVerify false`

## 使用 SSH 替代 HTTP 方式拉取 Repo

尤其适合 Golang 从私有仓库拉取包

`~/.gitconfig`

```toml
[url "git@github.com:"]
    insteadOf = https://github.com/
[url "git@gitlab.com:"]
    insteadOf = https://gitlab.com/
```
  
```bash
# 或者：

git config --global url."git@gitlab.com:groupName/projectName.git".insteadOf "https://gitlab.com/groupName/projectName.git"`

# 全局替换,拉取域名下的所有包
git config --global url."git@gitlab.yoursite.com:".insteadof "https://gitlab.yoursite.com/"
```

## Git 跟踪文件更改
  
```bash
git log --follow --patch routes/admin/contract_operation.js
```


---

- [使用gitlab作为go mod私服](https://www.cnblogs.com/tomtellyou/p/14411214.html)
