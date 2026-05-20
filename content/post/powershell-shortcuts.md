---
title: "Powershell Shortcuts"
description: 
slug: powershell-shortcuts
date: 2026-05-21T10:52:29+08:00
lastmod: 2026-05-21T10:52:29+08:00
categories:
- powershell
tags:
- powershell
- shortcut
image: 
math: false
toc: true
comments: false
license: 
keywords: 
- powershell
- shortcut
style:
hidden: false
draft: false
---

## 🚀 一键配置：让 PowerShell 像 Bash

```powershell
# 1. Ctrl+U：删除光标到行首
Set-PSReadLineKeyHandler -Chord 'Ctrl+u' -Function BackwardDeleteLine

# 2. Ctrl+K：删除光标到行尾
Set-PSReadLineKeyHandler -Chord 'Ctrl+k' -Function ForwardDeleteLine

# 3. 设置历史搜索方式（关键）
# 输入部分命令后，按 ↑ 键自动匹配历史中以此开头的命令，而不是滚动所有历史
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# 4. 设置 Tab 补全为菜单模式（与 bash 行为一致）
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# 5. （可选）关闭烦人的“滴”声
Set-PSReadLineOption -BellStyle None
```
