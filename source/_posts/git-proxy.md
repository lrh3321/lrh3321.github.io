---
title: git-proxy
categories: git-proxy
date: 2020-04-13 14:16:53
updated: 2020-04-13 14:16:53
tags:
---
# 为 Git 启用代理

## HTTP 代理

```shell
# 全局
git config http.proxy http://127.0.0.1:1089   --global
git config https.proxy https://127.0.0.1:1089 --global
# 仓库
git config http.proxy http://127.0.0.1:1089
git config https.proxy https://127.0.0.1:1089
```

## Socks 5 代理

```shell
# 全局
git config http.proxy socks5://127.0.0.1:1088  --global
git config https.proxy socks5://127.0.0.1:1088 --global
# 仓库
git config http.proxy socks5://127.0.0.1:1088
git config https.proxy socks5://127.0.0.1:1088
```

## 取消代理

```shell
# 全局
git config --unset http.proxy  --global
git config --unset https.proxy --global
# 仓库
git config --unset http.proxy
git config --unset https.proxy
```
