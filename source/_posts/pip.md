---
title: 调教 Pip
categories: pip
date: 2017-10-21 20:12:08
updated: 2020-06-21 20:12:08
tags:
  - pip
  - mirror
---
# 配置 Pip 源

## Pip 源配置文件可以放置的位置

## Linux/Unix

+ `/etc/pip.con`
+ `~/.pip/pip.conf`
+ `~/.config/pip/pip.conf`

## Mac OSX

+ `~/Library/Application Support/pip/pip.conf`
+ `~/.pip/pip.conf`
+ `/Library/Application Support/pip/pip.conf`

## Windows

+ `%APPDATA%\pip\pip.ini`
+ `%HOME%\pip\pip.ini`
+ `C:\Documents and Settings\All Users\Application Data\PyPA\pip\pip.conf` (Windows XP)
+ `C:\ProgramData\PyPA\pip\pip.conf` (Windows 7及以后)

<!-- more -->

## Pip 配置的主要一些配置

可以配置如下：

### 阿里源

```ini
[global]
index-url = https://mirrors.aliyun.com/pypi/simple/

[install]
trusted-host=mirrors.aliyun.com
```

### 豆瓣源

```ini
index-url = http://pypi.douban.com/simple # 豆瓣源，可以换成其他的源
trusted-host = pypi.douban.com            #添加豆瓣源为可信主机，要不然可能报错
disable-pip-version-check = true          #取消pip版本检查，排除每次都报最新的pip
timeout = 120
```

## Poetry 配置源

在 `project.toml` 中添加

```toml
[[tool.poetry.source]]
name = "aliyun"
url = "https://mirrors.aliyun.com/pypi/simple/"
default = true

# 配置其他源，如私有源
[[tool.poetry.source]]
name = "lrh3321"
url = "http://pypi.lrh3321.win/simple/"
secondary = true
```
