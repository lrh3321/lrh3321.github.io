---
title: "在 Powershell 中增加命令别名"
description: 
slug: pwsh-alias
date: 2023-04-22T19:21:22+08:00
lastmod: 2023-04-22T19:21:22+08:00
categories:
  - powershell
tags:
  - powershell
image: 
math: false
toc: true
comments: false
license: 
keywords:
  - powershell
  - which
style:
hidden: false
draft: false
---

打开 Powershell Profile 配置文件

```pwsh
code $PROFILE.CurrentUserAllHosts
```

## `which`

```pwsh
Function Show-Full-Path {
    $(Get-Command $args[0]).Source;
}

Set-Alias -Name which -Value Show-Full-Path

```

## `grep`

```pwsh
Set-Alias -Name grep -Value Select-String
```