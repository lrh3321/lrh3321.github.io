---
title: "Readline"
description: 
slug: readline
date: 2025-01-01T13:58:59+08:00
lastmod: 2025-01-01T13:58:59+08:00
categories: 
- bash
tags: 
- bash
image: 
math: false
toc: true
comments: false
license: 
keywords: 
- bash
style:
hidden: false
draft: true
---

```readline .inputrc
# case insensitive tab completion
set completion-ignore-case On

# show all available completions
set show-all-if-ambiguous on

set menu-complete-display-prefix on
TAB:menu-complete

set mark-symlinked-directories on

# vim mode in bash
# set show-mode-in-prompt on
# set vi-ins-mode-string ""
# set vi-cmd-mode-string ""

# Useful key bindings
Control-l:clear-screen

# Open file with nvim
Control-v:"v \C-t"

# Backspacing until slash or whitespace
Control-g: unix-filename-rubout

# Alt-Left and Alt-Right go backward and forward by word in bash prompt
"\e[1;3D": backward-word
"\e[1;3C": forward-word
# Alt-h and Alt-l go backward and forward by word in bash prompt
"\eh": backward-word
"\el": forward-word
# Alt-j and Alt-k go backward and forward in history
Control-p:history-search-backward 
Control-n:history-search-forward
```

## MSYS Bash 配置

```readline /etc/inputrc
# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <https://creativecommons.org/publicdomain/zero/1.0/>.

# "\e[3~": delete-char

# VT
# "\e[1~": beginning-of-line
# "\e[4~": end-of-line

# kvt
# "\e[H": beginning-of-line
# "\e[F": end-of-line

# rxvt and konsole (i.e. the KDE-app...)
# "\e[7~": beginning-of-line
# "\e[8~": end-of-line

# VT220
# "\eOH": beginning-of-line
# "\eOF": end-of-line

# Allow 8-bit input/output
# set meta-flag on
# set convert-meta off
# set input-meta on
# set output-meta on
#$if Bash
  # Don't ring bell on completion
  set bell-style none

  # or, don't beep at me - show me
  #set bell-style visible

  # Show all instead of beeping first
  set show-all-if-ambiguous off

  # Filename completion/expansion
  set completion-ignore-case on
  #set show-all-if-ambiguous on

  # Expand homedir name
  #set expand-tilde on

  # Append "/" to all dirnames
  #set mark-directories on
  #set mark-symlinked-directories on

  # visible-stats
  # Append a mark according to the file type in a listing
  set visible-stats off
  set mark-directories on

  # Match all files
  #set match-hidden-files on

  # 'Magic Space'
  # Insert a space character then performs
  # a history expansion in the line
  #Space: magic-space
#$endif

# MSYSTEM is emacs based
$if mode=emacs
  # Common to Console & RXVT
  "\e[2~": paste-from-clipboard      # "Ins. Key"
  "\e[5~": beginning-of-history      # Page up
  "\e[6~": end-of-history            # Page down

  $if term=msys # RXVT
    "\e[7~": beginning-of-line      # Home Key
    "\e[8~": end-of-line            # End Key
    "\e[11~": display-shell-version # F1
    "\e[15~": re-read-init-file     # F5
    "\e[12~": "Function Key 2"
    "\e[13~": "Function Key 3"
    "\e[14~": "Function Key 4"
    "\e[17~": "Function Key 6"
    "\e[18~": "Function Key 7"
    "\e[19~": "Function Key 8"
    "\e[20~": "Function Key 9"
    "\e[21~": "Function Key 10"
  $else
  # Eh, normal Console is not really cygwin anymore, is it? Using 'else' instead. -mstormo
  # $if term=cygwin # Console
    "\e[1~": beginning-of-line      # Home Key
    "\e[4~": end-of-line            # End Key
    "\e[3~": delete-char      # Delete Key
    "\e\e[C": forward-word      # Alt-Right
    "\e\e[D": backward-word      # Alt-Left
    "\e[1;5C": forward-word   # ctrl + right
    "\e[1;5D": backward-word  # ctrl + left
    "\e[17~": "Function Key 6"
    "\e[18~": "Function Key 7"
    "\e[19~": "Function Key 8"
    "\e[20~": "Function Key 9"
    "\e[21~": "Function Key 10"
    "\e[23~": "Function Key 11"
  $endif
$endif
```

## Git Bash 配置

```readline /etc/inputrc
# none, visible or audible
set bell-style visible

# Ask before displaying >40 items
# Since $WINDIR $PATH var can be in $PATH, this could list
# all window executables in C:\WINDOWS
set completion-query-items 40

# Ignore case for the command-line-completion functionality
# on:  default on a Windows style console
# off: default on a *nix style console
set completion-ignore-case on

# disable/enable 8bit input
set input-meta on
set output-meta on
set convert-meta off

# visible-stats
# Append a mark according to the file type in a listing
set visible-stats off
set mark-directories on
set mark-symlinked-directories on

# Beep first, show all only upon double-Tab
set show-all-if-ambiguous off

# MSYSTEM is emacs based
$if mode=emacs
  # Common to Console & RXVT
  "\e[2;2~": paste-from-clipboard   # Shift-Insert
  "\e[5~": beginning-of-history     # Page up
  "\e[6~": end-of-history           # Page down

  # Mintty
  "\e[1;5D": "\eOD"                 # Ctrl-Left
  "\e[1;5C": "\eOC"                 # Ctrl-Right
  "\e[1;5A": "\eOA"                 # Ctrl-Up
  "\e[1;5B": "\eOB"                 # Ctrl-Down
  "\e[1;3D": "\e\e[D"               # Alt-Left
  "\e[1;3C": "\e\e[C"               # Alt-Right

  "\e[Z": complete                  # Shift-Tab

  $if term=msys # RXVT
    "\e[7~": beginning-of-line      # Home Key
    "\e[8~": end-of-line            # End Key
    "\e[11~": display-shell-version # F1
    "\e[15~": re-read-init-file     # F5
    "\e[12~": "Function Key 2"
    "\e[13~": "Function Key 3"
    "\e[14~": "Function Key 4"
    "\e[17~": "Function Key 6"
    "\e[18~": "Function Key 7"
    "\e[19~": "Function Key 8"
    "\e[20~": "Function Key 9"
    "\e[21~": "Function Key 10"
  $else
  # Eh, normal Console is not really cygwin anymore, is it? Using 'else' instead. -mstormo
  # $if term=cygwin # Console
    "\e[1~": beginning-of-line      # Home Key
    "\e[4~": end-of-line            # End Key
    "\e[3~": delete-char            # Delete Key
    "\e[1;5D": backward-word        # Ctrl-Left
    "\e[1;5C": forward-word         # Ctrl-Right
    "\e\e[C": forward-word          # Alt-Right
    "\e\e[D": backward-word         # Alt-Left
    "\e[17~": "Function Key 6"
    "\e[18~": "Function Key 7"
    "\e[19~": "Function Key 8"
    "\e[20~": "Function Key 9"
    "\e[21~": "Function Key 10"
    "\e[23~": "Function Key 11"
  $endif

  $if term=cygwin
    "\e[A": previous-history # Cursor Up
    "\e[B": next-history     # Cursor Down
    "\e[C": forward-char     # Cursor Right
    "\e[D": backward-char    # Cursor Left
  $endif
$endif
```

---

- [GNU Readline Library](https://tiswww.case.edu/php/chet/readline/readline.html)
