---
title: 为 Flutter 设定镜像配置
categories:
  - flutter
date: 2020-11-21 13:50:44+08:00
lastmod: 2022-11-21 13:50:44+08:00
tags:
  - flutter
  - dart
  - mirrors
keywords:
  - flutter
  - dart
  - mirrors
---

# 为 Flutter 设定镜像配置

## macOS / Linux

```bash
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
git clone -b stable https://github.com/flutter/flutter.git
export PATH="$PWD/flutter/bin:$PATH"
cd ./flutter
flutter doctor
```

## Windows

```powershell
$env:PUB_HOSTED_URL="https://pub.flutter-io.cn"
$env:FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
git clone -b stable https://github.com/flutter/flutter.git
$env:PATH="$PWD\flutter\bin:$env:PATH"
cd ./flutter
flutter doctor

[environment]::SetEnvironmentvariable("PUB_HOSTED_URL", "https://pub.flutter-io.cn", "User")
[environment]::SetEnvironmentvariable("FLUTTER_STORAGE_BASE_URL", "https://storage.flutter-io.cn", "User")
```

## 社区运行的镜像站点

### Flutter 社区

社区主镜像，采用多种方式同步 Flutter 开发者资源（推荐）。

```bash
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
```

### 上海交大 Linux 用户组

使用反向代理方式建立 Flutter 镜像，数据与站源实时同步。 Pub API 返回值未做处理，可能造成无法访问的情况。

```bash
export PUB_HOSTED_URL=https://dart-pub.mirrors.sjtug.sjtu.edu.cn
export FLUTTER_STORAGE_BASE_URL=https://mirrors.sjtug.sjtu.edu.cn
```

### 清华大学 TUNA 协会

采取自定义脚本定时主动抓取策略，并配置了完善的回源策略（推荐）。查看帮助文档： Flutter 镜像安装帮助， Pub 镜像安装帮助。

```bash
export PUB_HOSTED_URL=https://mirrors.tuna.tsinghua.edu.cn/dart-pub
export FLUTTER_STORAGE_BASE_URL=https://mirrors.tuna.tsinghua.edu.cn/flutter
```

### CNNIC

基于 TUNA 协会的镜像服务，数据策略与 TUNA 一致，通过非教育网的域名访问（建议选择 TUNA）。

```bash
export PUB_HOSTED_URL=http://mirrors.cnnic.cn/dart-pub
export FLUTTER_STORAGE_BASE_URL=http://mirrors.cnnic.cn/flutter
```

### 腾讯云开源镜像站

使用 TUNA 开源的脚本每天凌晨 0 - 2 点定时与站源同步，未配置回源策略。

```bash
export PUB_HOSTED_URL=https://mirrors.cloud.tencent.com/dart-pub
export FLUTTER_STORAGE_BASE_URL=https://mirrors.cloud.tencent.com/flutter
```

---

## 参考 

- [Using Flutter in China](https://flutter.dev/community/china)
- [在中国网络环境下使用 Flutter](https://flutter.cn/community/china)
- [Flutter 镜像安装帮助](https://mirrors.tuna.tsinghua.edu.cn/help/flutter/)
- [Windows 10 环境变量：如何通过 CMD 和 PowerShell 写入环境变量](https://zhuanlan.zhihu.com/p/349455443)
