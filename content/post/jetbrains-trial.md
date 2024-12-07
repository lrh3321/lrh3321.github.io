---
title: Windows 无限试用 JetBrains 系列产品
categories:
  - jetbrains
date: 2020-06-24 10:14:39+08:00
lastmod: 2020-06-24 10:14:39+08:00
tags:
  - jetbrains
  - goland
keywords:
  - jetbrains
  - goland
---

# Windows 无限试用 JetBrains 系列产品

## 2020 系列

删除 `%APPDATA%\JetBrains\<产品名>\eval\*.key`，如 `GoLand 2020.1.2` 产品就是 `GoLand2020.1`

PowerShell 脚本

```powershell
# 修改为系统上安装了的版本
$products = "IntelliJIdea2020.1", "GoLand2020.1", "PyCharm2020.1", "WebStorm2020.1"

foreach ($product in $products) {
    $parent = "${ENV:APPDATA}\JetBrains\${product}\eval"
    if (Test-Path -Path $parent) {
        Write-Host -ForegroundColor Green "Remove:" "$parent\*.key"
        Remove-Item "$parent\*.key"
    }
    else {
        Write-Host -ForegroundColor Yellow $parent "Not Found"
    }
}
```

## 2019 以及之前版本

删除 `%USERPROFILE%\<.产品名>\config\eval\*.key` 如 `GoLand 2019.3.1` 产品就是 `.GoLand2019.3`

- 删除目录：C:\Users\<用户>\.WebStorm2019.1\config\eval
- 删除文件：C:\Users\<用户>\.WebStorm2019.1\config\options\other.xml
- 删除注册表项：HKEY_CURRENT_USER\Software\JavaSoft\Prefs\jetbrains\webstorm

```powershell
# 修改为系统上安装了的版本
$products = "GoLand2019.3", "PyCharm2019.3", "WebStorm2019.3"

foreach ($product in $products) {
    $parent = "${ENV:USERPROFILE}\.${product}\config\eval"
    if (Test-Path -Path $parent) {
        Write-Host -ForegroundColor Green "Remove:" "$parent\*.key"
        Remove-Item "$parent\*.key"
    }
    else {
        Write-Host -ForegroundColor Yellow $parent "Not Found"
    }
}
```

----

## 参考

- [关于无限试用JetBrains产品的方案](https://www.cnblogs.com/htsg/p/9461096.html)
