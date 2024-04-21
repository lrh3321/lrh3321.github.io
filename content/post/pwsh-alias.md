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

### `rg`

[`rg`](https://github.com/BurntSushi/ripgrep)

ripgrep recursively searches directories for a regex pattern while respecting your gitignore

[Latest releases](https://github.com/BurntSushi/ripgrep/releases/latest)

```pwsh
cargo install ripgrep
```

```pwsh
Set-Alias -Name grep -Value rg
```

## `find`

### `findutils`

[findutils](https://github.com/uutils/findutils)

Rust implementation of findutils

#### Install

```pwsh
cargo install findutils
```

### `fd`

[`fd`](https://github.com/sharkdp/fd)

A simple, fast and user-friendly alternative to 'find'

#### Install

```pwsh
cargo install fd-find
```

```pwsh
winget install sharkdp.fd
```

```pwsh
Set-Alias -Name find -Value fd
```

## `tree`

### `erd`

[`erd`](https://github.com/solidiquis/erdtree)

A modern, multi-threaded file-tree visualization and disk usage analysis tool that respects hidden file and gitignore rules.

```pwsh
cargo install erdtree
```

```pwsh
Set-Alias -Name tree -Value erd
```

## `ls`

### `lsd`

[`lsd`](https://github.com/lsd-rs/lsd)

The next gen ls command

```pwsh
cargo install lsd
```

```pwsh
Set-Alias -Name ls -Value lsd
```

## `dig`

### `dog`

[`dog`](https://github.com/ogham/dog)

A command-line DNS client.

```pwsh
cargo install --git https://github.com/ogham/dog.git dog
```

```pwsh
Set-Alias -Name dig -Value dog
```

## `coreutils`

[coreutils](https://github.com/uutils/coreutils)

[uutils Coreutils Documentation](https://uutils.github.io/user/)

Cross-platform Rust rewrite of the GNU coreutils

```pwsh
cargo install coreutils
```

```pwsh
#  [, arch, b2sum, b3sum, base32, base64, basename, basenc, cat, cksum, comm, cp, csplit, cut,
#  date, dd, df, dir, dircolors, dirname, du, echo, env, expand, expr, factor, false, fmt,
#  fold, hashsum, head, hostname, join, link, ln, ls, md5sum, mkdir, mktemp, more, mv, nl,
#  nproc, numfmt, od, paste, pr, printenv, printf, ptx, pwd, readlink, realpath, relpath, rm,
#  rmdir, seq, sha1sum, sha224sum, sha256sum, sha3-224sum, sha3-256sum, sha3-384sum, sha3-
#  512sum, sha384sum, sha3sum, sha512sum, shake128sum, shake256sum, shred, shuf, sleep, sort,
#  split, sum, sync, tac, tail, tee, test, touch, tr, true, truncate, tsort, uname, unexpand,
#  uniq, unlink, vdir, wc, whoami, yes

Set-Location $(Split-Path -Path $(Get-Command coreutils).Source)

$comands = "[", "arch", "b2sum", "b3sum", "base32", "base64", "basename", "basenc", "cksum", "comm", "csplit", "cut"
$comands += "date", "dd", "df", "dir", "dircolors", "dirname", "du", "echo", "env", "expand", "expr", "factor", "false", "fmt"
$comands += "fold", "hashsum", "head", "hostname", "join", "link", "ln", "ls", "md5sum", "mkdir", "mktemp", "more", "mv", "nl"
$comands += "nproc", "numfmt", "od", "paste", "pr", "printenv", "printf", "ptx", "pwd", "readlink", "realpath", "relpath", "rm"
$comands += "rmdir", "seq", "sha1sum", "sha224sum", "sha256sum", "sha3-224sum", "sha3-256sum", "sha3-384sum", "sha3-512sum"
$comands += "sha384sum", "sha3sum", "sha512sum", "shake128sum", "shake256sum", "shred", "shuf", "sleep", "sort"
$comands += "split", "sum", "sync", "tac", "tail", "tee", "test", "touch", "tr", "true", "truncate", "tsort", "uname", "unexpand"
$comands += "uniq", "unlink", "vdir", "wc", "whoami", "yes"

foreach ($e in $comands) {
    # enumerate over the whole array
    New-Item -Path ("${e}" + ".exe") -ItemType SymbolicLink -Value coreutils.exe
}

```

----

- [Awesome Rust](https://github.com/rust-unofficial/awesome-rust#system-tools)
- [Modern Unix](https://github.com/ibraheemdev/modern-unix)
