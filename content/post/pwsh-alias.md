---
title: "在 Powershell 中增加命令别名"
description: 
slug: pwsh-alias
date: 2023-04-22T19:21:22+08:00
lastmod: 2023-04-23T19:21:22+08:00
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

```powershell
code $PROFILE.CurrentUserAllHosts
```

## `which`

```powershell
Function Show-Full-Path {
    $(Get-Command $args[0]).Source;
}

Set-Alias -Name which -Value Show-Full-Path

```

## `grep`

```powershell
Set-Alias -Name grep -Value Select-String
```

### `rg`

[`rg`](https://github.com/BurntSushi/ripgrep)

ripgrep recursively searches directories for a regex pattern while respecting your gitignore

[Latest releases](https://github.com/BurntSushi/ripgrep/releases/latest)

```powershell
cargo install ripgrep
```

```powershell
Set-Alias -Name grep -Value rg
```

## `find`

### `findutils`

[findutils](https://github.com/uutils/findutils)

Rust implementation of findutils

#### Install

```powershell
cargo install findutils
```

### `fd`

[`fd`](https://github.com/sharkdp/fd)

A simple, fast and user-friendly alternative to 'find'

#### Install

```powershell
cargo install fd-find
```

```powershell
winget install sharkdp.fd
```

```powershell
Set-Alias -Name find -Value fd
```

## `tree`

### `erd`

[`erd`](https://github.com/solidiquis/erdtree)

A modern, multi-threaded file-tree visualization and disk usage analysis tool that respects hidden file and gitignore rules.

```powershell
cargo install erdtree
```

```powershell
Set-Alias -Name tree -Value erd
```

## `ls`

### `lsd`

[`lsd`](https://github.com/lsd-rs/lsd)

The next gen ls command

```powershell
cargo install lsd
```

```powershell
Set-Alias -Name ls -Value lsd
```

## `dig`

### `dog`

[`dog`](https://github.com/ogham/dog)

A command-line DNS client.

```powershell
cargo install --git https://github.com/ogham/dog.git dog
```

```powershell
Set-Alias -Name dig -Value dog
```

## `coreutils`

[coreutils](https://github.com/uutils/coreutils)

[uutils Coreutils Documentation](https://uutils.github.io/user/)

Cross-platform Rust rewrite of the GNU coreutils

```powershell
cargo install coreutils
```

```powershell
#  [, arch, b2sum, b3sum, base32, base64, basename, basenc, cat, cksum, comm, cp, csplit, cut,
#  date, dd, df, dir, dircolors, dirname, du, echo, env, expand, expr, factor, false, fmt,
#  fold, hashsum, head, hostname, join, link, ln, ls, md5sum, mkdir, mktemp, more, mv, nl,
#  nproc, numfmt, od, paste, pr, printenv, printf, ptx, pwd, readlink, realpath, relpath, rm,
#  rmdir, seq, sha1sum, sha224sum, sha256sum, sha3-224sum, sha3-256sum, sha3-384sum, sha3-
#  512sum, sha384sum, sha3sum, sha512sum, shake128sum, shake256sum, shred, shuf, sleep, sort,
#  split, sum, sync, tac, tail, tee, test, touch, tr, true, truncate, tsort, uname, unexpand,
#  uniq, unlink, vdir, wc, whoami, yes

Set-Location $(Split-Path -Path $(Get-Command coreutils).Source)

$comands=$(coreutils --list)

foreach ($e in $comands) {
    # enumerate over the whole array
    New-Item -Path ("${e}" + ".exe") -ItemType SymbolicLink -Value coreutils.exe
}

```

----

- [Awesome Rust](https://github.com/rust-unofficial/awesome-rust#system-tools)
- [Modern Unix](https://github.com/ibraheemdev/modern-unix)
