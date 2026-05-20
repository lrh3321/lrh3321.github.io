---
title: "PSReadLine"
description: 
slug: psreadline
date: 2026-05-20T13:33:06+08:00
lastmod: 2026-05-20T13:33:06+08:00
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
style:
hidden: false
draft: true
---

在 PSReadLine 中，获取和管理快捷键主要围绕两个核心命令：`Get-PSReadLineKeyHandler` 用于查看，`Set-PSReadLineKeyHandler` 用于设置或修改。下面详细介绍具体方法。

---

## 1. 查看当前所有快捷键

使用 `Get-PSReadLineKeyHandler` 命令可以查看当前所有已绑定的快捷键及其功能。

```powershell
Get-PSReadLineKeyHandler
```

这会列出所有快捷键（和弦）、对应的函数名称和功能描述。输出示例：

| Key        | Function               | Description                          |
|------------|------------------------|--------------------------------------|
| Ctrl+Space | MenuComplete           | 从菜单列表中选择完成输入              |
| Ctrl+r     | ReverseSearchHistory   | 反向搜索命令历史                      |
| UpArrow    | HistorySearchBackward  | 搜索历史中以当前输入开头的命令        |

---

## 2. 查看未绑定的函数

如果你想了解有哪些 PSReadLine 函数可用但目前还没有绑定快捷键，可以使用 `-Unbound` 参数：

```powershell
Get-PSReadLineKeyHandler -Unbound
```

这会列出所有可以绑定但尚未绑定快捷键的功能。

---

## 3. 按类型筛选快捷键

PSReadLine 的快捷键按功能分组（如 Basic、Completion、CursorMovement、History、Search 等）。你可以筛选出特定组的绑定：

```powershell
Get-PSReadLineKeyHandler -Bound | Where-Object { $_.Group -eq 'CursorMovement' }
```

或者查看所有自定义绑定：

```powershell
Get-PSReadLineKeyHandler -Bound | Where-Object { $_.Group -eq 'Custom' }
```

---

## 4. 设置或修改快捷键

### 方法一：绑定到现有 PSReadLine 函数

使用 `Set-PSReadLineKeyHandler` 将快捷键绑定到一个预定义的 PSReadLine 功能：

```powershell
# 将向上箭头键绑定到历史搜索功能
Set-PSReadLineKeyHandler -Chord UpArrow -Function HistorySearchBackward

# 将 Ctrl+空格键绑定到菜单补全功能
Set-PSReadLineKeyHandler -Chord 'Ctrl+Spacebar' -Function MenuComplete
```

### 方法二：绑定到自定义脚本块

你也可以将快捷键绑定到一个 PowerShell 脚本块，实现更复杂的自定义操作：

```powershell
# 按 Ctrl+B 时：清空当前行，插入 "build"，然后直接执行
Set-PSReadLineKeyHandler -Chord Ctrl+B -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert('build')
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
```

### 方法三：绑定多个快捷键到同一功能

可以一次为多个快捷键绑定同一功能：

```powershell
Set-PSReadLineKeyHandler -Chord Backspace, Ctrl+h -Function BackwardDeleteChar
```

---

## 5. 关于快捷键名称（和弦）

快捷键中的键名需要与 `[System.ConsoleKey]` 枚举中的名称匹配。

| 按键 | 和弦名称 |
|------|----------|
| 数字 2（主键盘） | `D2` |
| 数字 2（小键盘） | `NumPad2` |
| Ctrl+2 | `Ctrl+D2` |

### 如何查找键名

你可以使用以下命令来获取按下的键的名称：

```powershell
[System.Console]::ReadKey()
```

按下按键后会返回类似 `KeyChar Key Modifiers` 的信息，其中 `Key` 字段就是和弦中需要使用的名称。

### ⚠️ 注意事项

- **区分大小写**：从 PSReadLine 2.0.0 开始，`-Chord` 参数是**区分大小写**的。`Ctrl+X` 和 `Ctrl+x` 会被视为不同的绑定
- **组合键序列**：如果要绑定组合键序列（如先按 Ctrl+X 再按 Ctrl+L），用逗号分隔：`-Chord 'Ctrl+X,Ctrl+L'`

---

## 6. 移除快捷键

如果需要移除某个快捷键绑定，使用 `Remove-PSReadLineKeyHandler`：

```powershell
Remove-PSReadLineKeyHandler -Chord Ctrl+B
```

---

## 7. 让快捷键持久生效

自定义快捷键只在当前 PowerShell 会话中有效。要让它们永久生效，需要将 `Set-PSReadLineKeyHandler` 命令添加到你的 PowerShell **配置文件（Profile）** 中。

```powershell
# 打开配置文件进行编辑
notepad $PROFILE
```

然后在文件中添加你的快捷键绑定命令，保存后重新启动 PowerShell 即可。

---

## 快速参考

| 操作 | 命令 |
|------|------|
| 查看所有快捷键 | `Get-PSReadLineKeyHandler` |
| 查看未绑定的功能 | `Get-PSReadLineKeyHandler -Unbound` |
| 绑定到现有功能 | `Set-PSReadLineKeyHandler -Chord '快捷键' -Function 功能名` |
| 绑定到自定义脚本 | `Set-PSReadLineKeyHandler -Chord '快捷键' -ScriptBlock { 脚本块 }` |
| 移除快捷键 | `Remove-PSReadLineKeyHandler -Chord '快捷键'` |

---

- [PSReadLine](https://github.com/PowerShell/PSReadLine)
