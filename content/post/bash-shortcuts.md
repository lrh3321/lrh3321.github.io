---
title: "Bash Shortcuts"
description: 
slug: bash-shortcuts
date: 2023-08-30T22:07:48+08:00
lastmod: 2026-05-24T22:07:48+08:00
categories:
- bash
tags: 
- bash
- shortcut
image: 
math: false
toc: true
comments: false
license: 
keywords:
- bash
- shortcut
style:
hidden: false
draft: false
---

- `Ctrl + C`: Terminate the command / 终止命令
- `Ctrl + Z`: Suspend the command / 挂起命令
- `Ctrl + A`: Move to the start of the line / 移动到行首
- `Ctrl + E`: Move to the end of the line / 移动到行尾
- `Ctrl + F`: Move forward one character / 向前移动一个字符
- `Ctrl + B`: Move backward one character / 向后移动一个字符
- `Ctrl + U`: Delete from the cursor to the start of the line / 删除从光标到行首的内容
- `Ctrl + K`: Delete from the cursor to the end of the line / 删除从光标到行尾的内容
- `Ctrl + W`: Delete from the cursor to the start of the word / 删除从光标到词首的内容
- `Ctrl + D`: Delete the character under the cursor / 删除光标下的字符
- `Ctrl + H`: Delete the character before the cursor / 删除光标前的字符
- `Ctrl + T`: Swap the character under the cursor with the previous one / 交换光标下的字符与前一个字符
- `Ctrl + L`: Clear the screen / 清屏

## Editing Shortcuts / 编辑快捷键

| Action                                                                                               | Bash Shortcuts |
| ---------------------------------------------------------------------------------------------------- | -------------- |
| Tab / 制表符                                                                                         | `Ctrl + I`     |
| New Line / 换行                                                                                      | `Ctrl + J`     |
| Enter / 回车                                                                                         | `Ctrl + M`     |
| Paste the Last Thing to be Cut / 粘贴最后剪切的内容                                                  | `Ctrl + Y`     |
| Undo / 撤销                                                                                          | `Ctrl + _`     |
| Upper the case Every Character Form Cursor / 将光标后所有字符转为大写                                | `Alt + U`      |
| Lower the case Every Character Form Cursor / 将光标后所有字符转为小写                                | `Alt + L`      |
| Capitalize the Character Under Cursor and Move to the End of the Word / 将光标下字符大写并移动到词尾 | `Alt + C`      |
| Cancel Changes and Put Back the Line / 取消更改并恢复行                                              | `Alt + R`      |
| Delete Character Under Cursor / 删除光标下的字符                                                     | `Ctrl + D`     |
| Delete Character From Left / 从左侧删除字符                                                          | `Ctrl + H`     |
| Delete Word before Cursor / 删除光标前的单词                                                         | `Alt + Delete` |
| Delete Word after Cursor / 删除光标后的单词                                                          | `Alt + D`      |
| Clear Screen / 清屏                                                                                  | `Ctrl + L`     |
| Escape / 退出                                                                                        | `Ctrl + [`     |
| Cut Word Before Cursor to Clipboard / 剪切光标前的单词到剪贴板                                       | `Ctrl + W`     |
| Cut Line After Cursor to Clipboard / 剪切光标后的行到剪贴板                                          | `Ctrl + K`     |
| Cut Line Before Cursor to Clipboard / 剪切光标前的行到剪贴板                                         | `Ctrl + U`     |
| Swap Current Word with Previous / 交换当前单词与前一个单词                                           | `Alt + T`      |
| Swap the Last Character before Cursor / 交换光标前的最后一个字符                                     | `Ctrl + T`     |
| Swap the Last Two Words Before the Cursor / 交换光标前的最后两个单词                                 | `Esc + T`      |

## Emacs and Vi Mode Shortcuts / Emacs 和 Vi 模式快捷键

| Action                           | Bash Shortcut keys |
| -------------------------------- | ------------------ |
| Set Emacs Mode / 设置 Emacs 模式 | `$set -o emacs`    |
| Set Vi Mode / 设置 Vi 模式       | `$set -o vi`       |

## Navigation Shortcuts / 导航快捷键

| Action                                       | Bash Shortcuts |
| -------------------------------------------- | -------------- |
| Go to the Beginning of the Line / 移动到行首 | `Home`         |
| Go to the End of the Line / 移动到行尾       | `End`          |
| Forward one character / 向前移动一个字符     | `Ctrl + F`     |
| Backward one character / 向后移动一个字符    | `Ctrl + B`     |
| Previous Command / 前一个命令                | `Ctrl + P`     |
| Next Command / 下一个命令                    | `Ctrl + N`     |
| Back one word / 向后移动一个单词             | `Alt + B`      |
| Forward one word / 向前移动一个单词          | `Alt + F`      |

## Control Character Shortcuts / 控制字符快捷键
| Action                                               | Bash Shortcuts |
| ---------------------------------------------------- | -------------- |
| ^@                                                   | `Ctrl + 2`     |
| ^Escape                                              | `Ctrl + 3`     |
| ^\                                                   | `Ctrl + 4`     |
| ^                                                    | `Ctrl + 5`     |
| ^^                                                   | `Ctrl + 6`     |
| ^_Undo / ^_撤销                                      | `Ctrl + 7`     |
| ^? Backward Delete Character / ^? 向后删除字符       | `Ctrl + 8`     |
| Display Sequence for entering Key / 显示按键输入序列 | `Ctrl + V`     |

## History Shortcuts / 历史命令快捷键

| Action                                                                                   | Bash Shortcuts |
| ---------------------------------------------------------------------------------------- | -------------- |
| Recall Last Command / 回忆最后一条命令                                                   | `Ctrl + R`     |
| Previous Command in History / 历史中的前一个命令                                         | `Ctrl + P`     |
| Next Command in History / 历史中的下一个命令                                             | `Ctrl + N`     |
| Go back to Next Most Recent Command / 返回到下一个最近的命令                             | `Ctrl + S`     |
| Escape from History Searching Mode / 退出历史搜索模式                                    | `Ctrl + O`     |
| Repeat Last Command / 重复最后一条命令                                                   | `Ctrl + G`     |
| Run Last Command Starting with `ABC` / 运行以 `ABC` 开头的最后一条命令                   | `!!`           |
| Print the last Command starting with `ABC` / 打印以 `ABC` 开头的最后一条命令             | `!abc`         |
| Last Argument of Previous Command / 前一个命令的最后一个参数                             | `!abc:p`       |
| Last Argument of Previous Command / 前一个命令的最后一个参数                             | `!$`           |
| All Arguments of Previous Command / 前一个命令的所有参数                                 | `Alt + .`      |
| Run Previous Command, replacing `abc` with `def` / 运行前一个命令，将 `abc` 替换为 `def` | `^abc^def`     |

## Process Controls Shortcuts / 进程控制快捷键

| Action                                                                | Bash Shortcuts |
| --------------------------------------------------------------------- | -------------- |
| Recall Last Command / 回忆最后一条命令                                | `Ctrl + R`     |
| Interrupt or Kill Whatever you are running / 中断或终止正在运行的程序 | `Ctrl + C`     |
| Clear Screen / 清屏                                                   | `Ctrl + L`     |
| Stop Output to Screen / 停止屏幕输出                                  | `Ctrl + S`     |
| Allow Output to Screen / 允许屏幕输出                                 | `Ctrl + Q`     |
| Send an EOF Marker / 发送 EOF 标记                                    | `Ctrl + D`     |
| Send the signal SIGTSTP to Current Task / 向当前任务发送 SIGTSTP 信号 | `Ctrl + Z`     |

The bash shortcuts will boost maximizing your productivity to around 90%. However, Bash is not the only shell out there. The one that can be the best alternative to bash is ZSH. It is a default shell in macOS. No doubt the experience of using this shell can be quite different. Dig into the ZSH shortcuts list.

使用 Bash 快捷键可以将您的工作效率提升约 90%。然而，Bash 并不是唯一的 shell。ZSH 是 Bash 的最佳替代品，它是 macOS 的默认 shell。毫无疑问，使用这个 shell 的体验会有很大不同。深入了解 ZSH 快捷键列表。

---

## `/etc/inputrc`

[readline(3) — Linux manual page](https://www.man7.org/linux/man-pages/man3/readline.3.html)

[GNU Readline Library](https://tiswww.case.edu/php/chet/readline/rluserman.html)

[8.4 Bindable Readline Commands](https://www.gnu.org/software/bash/manual/bash.html#Bindable-Readline-Commands)

`~/.inputrc`

```shell
# List functions and bindings in a form that can be reused as input.
bind -p
# List variable names and values in a form that can be reused as input.
bind -v
# Query about which keys invoke the named function.
bind -q yank
```

```plaintext
help bind
bind: bind [-lpsvPSVX] [-m keymap] [-f filename] [-q name] [-u name] [-r keyseq] [-x keyseq:shell-command] [keyseq:readline-function or readline-command]
    Set Readline key bindings and variables.

    Bind a key sequence to a Readline function or a macro, or set a
    Readline variable.  The non-option argument syntax is equivalent to
    that found in ~/.inputrc, but must be passed as a single argument:
    e.g., bind '"\C-x\C-r": re-read-init-file'.

    Options:
      -m  keymap         Use KEYMAP as the keymap for the duration of this
                         command.  Acceptable keymap names are emacs,
                         emacs-standard, emacs-meta, emacs-ctlx, vi, vi-move,
                         vi-command, and vi-insert.
      -l                 List names of functions.
      -P                 List function names and bindings.
      -p                 List functions and bindings in a form that can be
                         reused as input.
      -S                 List key sequences that invoke macros and their values
      -s                 List key sequences that invoke macros and their values
                         in a form that can be reused as input.
      -V                 List variable names and values
      -v                 List variable names and values in a form that can
                         be reused as input.
      -q  function-name  Query about which keys invoke the named function.
      -u  function-name  Unbind all keys which are bound to the named function.
      -r  keyseq         Remove the binding for KEYSEQ.
      -f  filename       Read key bindings from FILENAME.
      -x  keyseq:shell-command  Cause SHELL-COMMAND to be executed when
                                KEYSEQ is entered.
      -X                 List key sequences bound with -x and associated commands
                         in a form that can be reused as input.

    Exit Status:
    bind returns 0 unless an unrecognized option is given or an error occurs.

```

### Commands For Moving / 移动命令

`beginning-of-line` (`C-a`)

Move to the start of the current line.

移动到当前行的开头。

`end-of-line` (`C-e`)

Move to the end of the line.

移动到行尾。

`forward-char` (`C-f`)

Move forward a character.

向前移动一个字符。

`backward-char` (`C-b`)

Move back a character.

向后移动一个字符。

`forward-word` (`M-f`)

Move forward to the end of the next word. Words are composed of letters and digits.

向前移动到下一个单词的末尾。单词由字母和数字组成。

`backward-word` (`M-b`)

Move back to the start of the current or previous word. Words are composed of letters and digits.

向后移动到当前或前一个单词的开头。单词由字母和数字组成。

`shell-forward-word` (`M-C-f`)

Move forward to the end of the next word. Words are delimited by non-quoted shell metacharacters.

向前移动到下一个单词的末尾。单词由非引号的 shell 元字符分隔。

`shell-backward-word` (`M-C-b`)

Move back to the start of the current or previous word. Words are delimited by non-quoted shell metacharacters.

向后移动到当前或前一个单词的开头。单词由非引号的 shell 元字符分隔。

`previous-screen-line` ()

Attempt to move point to the same physical screen column on the previous physical screen line. This will not have the desired effect if the current Readline line does not take up more than one physical line or if point is not greater than the length of the prompt plus the screen width.

尝试将光标移动到上一物理屏幕行的相同物理屏幕列位置。如果当前 Readline 行不超过一个物理行，或者光标位置不大于提示符长度加上屏幕宽度，则不会产生预期效果。

`next-screen-line` ()

Attempt to move point to the same physical screen column on the next physical screen line. This will not have the desired effect if the current Readline line does not take up more than one physical line or if the length of the current Readline line is not greater than the length of the prompt plus the screen width.

尝试将光标移动到下一物理屏幕行的相同物理屏幕列位置。如果当前 Readline 行不超过一个物理行，或者当前 Readline 行的长度不大于提示符长度加上屏幕宽度，则不会产生预期效果。

`clear-display` (`M-C-l`)

Clear the screen and, if possible, the terminal's scrollback buffer, then redraw the current line, leaving the current line at the top of the screen.

清屏，并在可能的情况下清除终端的回滚缓冲区，然后重绘当前行，使当前行位于屏幕顶部。

`clear-screen` (`C-l`)

Clear the screen, then redraw the current line, leaving the current line at the top of the screen.

清屏，然后重绘当前行，使当前行位于屏幕顶部。

`redraw-current-line` ()

Refresh the current line. By default, this is unbound.

刷新当前行。默认情况下，此命令未绑定。

### Commands For Manipulating The History / 历史命令操作命令

accept-line (Newline or Return)
Accept the line regardless of where the cursor is. If this line is non-empty, add it to the history list according to the setting of the HISTCONTROL and HISTIGNORE variables. If this line is a modified history line, then restore the history line to its original state.

接受当前行，无论光标在何处。如果此行非空，则根据 HISTCONTROL 和 HISTIGNORE 变量的设置将其添加到历史列表中。如果此行是修改后的历史行，则将历史行恢复为其原始状态。

`previous-history` (`C-p`)

Move 'back' through the history list, fetching the previous command.

在历史列表中"向后"移动，获取前一个命令。

`next-history` (`C-n`)

Move 'forward' through the history list, fetching the next command.

在历史列表中"向前"移动，获取下一个命令。

`beginning-of-history` (`M-<`)

Move to the first line in the history.

移动到历史中的第一行。

`end-of-history` (`M->`)

Move to the end of the input history, i.e., the line currently being entered.

移动到输入历史的末尾，即当前正在输入的行。

`reverse-search-history` (`C-r`)

Search backward starting at the current line and moving 'up' through the history as necessary. This is an incremental search. This command sets the region to the matched text and activates the mark.

从当前行开始向后搜索，并根据需要"向上"遍历历史。这是增量搜索。此命令将区域设置为匹配的文本并激活标记。

`forward-search-history` (`C-s`)

Search forward starting at the current line and moving 'down' through the history as necessary. This is an incremental search. This command sets the region to the matched text and activates the mark.

从当前行开始向前搜索，并根据需要"向下"遍历历史。这是增量搜索。此命令将区域设置为匹配的文本并激活标记。

`non-incremental-reverse-search-history` (`M-p`)

Search backward starting at the current line and moving 'up' through the history as necessary using a non-incremental search for a string supplied by the user. The search string may match anywhere in a history line.

从当前行开始向后搜索，并使用用户提供的字符串进行非增量搜索，根据需要"向上"遍历历史。搜索字符串可以匹配历史行中的任何位置。

`non-incremental-forward-search-history` (`M-n`)

Search forward starting at the current line and moving 'down' through the history as necessary using a non-incremental search for a string supplied by the user. The search string may match anywhere in a history line.

从当前行开始向前搜索，并使用用户提供的字符串进行非增量搜索，根据需要"向下"遍历历史。搜索字符串可以匹配历史行中的任何位置。

`history-search-forward` ()

Search forward through the history for the string of characters between the start of the current line and the point. The search string must match at the beginning of a history line. This is a non-incremental search. By default, this command is unbound.

在历史中向前搜索当前行开头到光标之间的字符串。搜索字符串必须匹配历史行的开头。这是非增量搜索。默认情况下，此命令未绑定。

`history-search-backward` ()

Search backward through the history for the string of characters between the start of the current line and the point. The search string must match at the beginning of a history line. This is a non-incremental search. By default, this command is unbound.

在历史中向后搜索当前行开头到光标之间的字符串。搜索字符串必须匹配历史行的开头。这是非增量搜索。默认情况下，此命令未绑定。

`history-substring-search-forward` ()

Search forward through the history for the string of characters between the start of the current line and the point. The search string may match anywhere in a history line. This is a non-incremental search. By default, this command is unbound.

在历史中向前搜索当前行开头到光标之间的字符串。搜索字符串可以匹配历史行中的任何位置。这是非增量搜索。默认情况下，此命令未绑定。

`history-substring-search-backward` ()

Search backward through the history for the string of characters between the start of the current line and the point. The search string may match anywhere in a history line. This is a non-incremental search. By default, this command is unbound.

在历史中向后搜索当前行开头到光标之间的字符串。搜索字符串可以匹配历史行中的任何位置。这是非增量搜索。默认情况下，此命令未绑定。

`yank-nth-arg` (`M-C-y`)

Insert the first argument to the previous command (usually the second word on the previous line) at point. With an argument n, insert the nth word from the previous command (the words in the previous command begin with word 0). A negative argument inserts the nth word from the end of the previous command. Once the argument n is computed, the argument is extracted as if the '!n' history expansion had been specified.

在光标处插入前一个命令的第一个参数（通常是上一行的第二个单词）。使用参数 n 时，插入前一个命令的第 n 个单词（前一个命令中的单词从单词 0 开始）。负参数插入前一个命令倒数第 n 个单词。一旦计算出参数 n，就会像指定了 '!n' 历史扩展一样提取参数。

`yank-last-arg` (`M-.` or `M-_`)

Insert last argument to the previous command (the last word of the previous history entry). With a numeric argument, behave exactly like yank-nth-arg. Successive calls to yank-last-arg move back through the history list, inserting the last word (or the word specified by the argument to the first call) of each line in turn. Any numeric argument supplied to these successive calls determines the direction to move through the history. A negative argument switches the direction through the history (back or forward). The history expansion facilities are used to extract the last argument, as if the '!$' history expansion had been specified.

插入前一个命令的最后一个参数（上一个历史条目的最后一个单词）。使用数字参数时，行为与 yank-nth-arg 完全相同。连续调用 yank-last-arg 会在历史列表中向后移动，依次插入每一行的最后一个单词（或第一次调用时参数指定的单词）。提供给这些连续调用的任何数字参数决定了在历史中移动的方向。负参数会切换在历史中移动的方向（向后或向前）。使用历史扩展功能来提取最后一个参数，就像指定了 '!$' 历史扩展一样。

`operate-and-get-next` (`C-o`)

Accept the current line for return to the calling application as if a newline had been entered, and fetch the next line relative to the current line from the history for editing. A numeric argument, if supplied, specifies the history entry to use instead of the current line.

接受当前行以返回到调用应用程序，就像输入了换行符一样，并从历史中获取相对于当前行的下一行进行编辑。如果提供数字参数，则指定要使用的历史条目而不是当前行。

`fetch-history` ()

With a numeric argument, fetch that entry from the history list and make it the current line. Without an argument, move back to the first entry in the history list.

使用数字参数时，从历史列表中获取该条目并将其设为当前行。不带参数时，移回历史列表中的第一个条目。

### Commands For Changing Text / 文本更改命令

`end-of-file` (usually `C-d`)

The character indicating end-of-file as set, for example, by stty. If this character is read when there are no characters on the line, and point is at the beginning of the line, Readline interprets it as the end of input and returns EOF.

表示文件结束的字符，例如由 stty 设置。如果在行上没有字符且光标在行首时读取到此字符，Readline 会将其解释为输入结束并返回 EOF。

`delete-char` (`C-d`)

Delete the character at point. If this function is bound to the same character as the tty EOF character, as C-d commonly is, see above for the effects.

删除光标处的字符。如果此函数绑定到与 tty EOF 字符相同的字符（如 C-d 通常那样），请参见上面的效果说明。

`backward-delete-char` (`Rubout`)

Delete the character behind the cursor. A numeric argument means to kill the characters instead of deleting them.

删除光标后面的字符。数字参数表示删除（kill）字符而不是删除它们。

`forward-backward-delete-char` ()

Delete the character under the cursor, unless the cursor is at the end of the line, in which case the character behind the cursor is deleted. By default, this is not bound to a key.

删除光标下的字符，除非光标在行尾，在这种情况下删除光标后面的字符。默认情况下，此命令未绑定到键。

`quoted-insert` (`C-q` or `C-v`)

Add the next character typed to the line verbatim. This is how to insert key sequences like C-q, for example.

按字面意思将下一个输入的字符添加到行中。例如，这就是如何插入像 C-q 这样的键序列的方法。

`self-insert` (a, b, A, 1, !, …)

Insert yourself.

插入自身。

`bracketed-paste-begin` ()

This function is intended to be bound to the "bracketed paste" escape sequence sent by some terminals, and such a binding is assigned by default. It allows Readline to insert the pasted text as a single unit without treating each character as if it had been read from the keyboard. The characters are inserted as if each one was bound to self-insert instead of executing any editing commands.

Bracketed paste sets the region (the characters between point and the mark) to the inserted text. It uses the concept of an active mark: when the mark is active, Readline redisplay uses the terminal's standout mode to denote the region.

此函数旨在绑定到某些终端发送的"括号粘贴"转义序列，并且默认分配了这样的绑定。它允许 Readline 将粘贴的文本作为单个单元插入，而不将每个字符视为从键盘读取。字符的插入方式就好像每个字符都绑定到 self-insert 而不是执行任何编辑命令。

括号粘贴将区域（光标和标记之间的字符）设置为插入的文本。它使用活动标记的概念：当标记活动时，Readline 重新显示使用终端的突出显示模式来表示区域。

`transpose-chars` (`C-t`)

Drag the character before the cursor forward over the character at the cursor, moving the cursor forward as well. If the insertion point is at the end of the line, then this transposes the last two characters of the line. Negative arguments have no effect.

将光标前的字符向前拖动到光标处的字符上，同时向前移动光标。如果插入点在行尾，则交换行的最后两个字符。负参数无效。

`transpose-words` (`M-t`)

Drag the word before point past the word after point, moving point past that word as well. If the insertion point is at the end of the line, this transposes the last two words on the line.

将光标前的单词拖动到光标后的单词之后，同时将光标移动到该单词之后。如果插入点在行尾，则交换行上的最后两个单词。

`upcase-word` (`M-u`)

Uppercase the current (or following) word. With a negative argument, uppercase the previous word, but do not move the cursor.

将当前（或后续）单词转换为大写。使用负参数时，将前一个单词转换为大写，但不移动光标。

`downcase-word` (`M-l`)

Lowercase the current (or following) word. With a negative argument, lowercase the previous word, but do not move the cursor.

将当前（或后续）单词转换为小写。使用负参数时，将前一个单词转换为小写，但不移动光标。

`capitalize-word` (`M-c`)

Capitalize the current (or following) word. With a negative argument, capitalize the previous word, but do not move the cursor.

将当前（或后续）单词首字母大写。使用负参数时，将前一个单词首字母大写，但不移动光标。

`overwrite-mode` ()

Toggle overwrite mode. With an explicit positive numeric argument, switches to overwrite mode. With an explicit non-positive numeric argument, switches to insert mode. This command affects only emacs mode; vi mode does overwrite differently. Each call to readline() starts in insert mode.

In overwrite mode, characters bound to self-insert replace the text at point rather than pushing the text to the right. Characters bound to backward-delete-char replace the character before point with a space.

By default, this command is unbound.

切换覆盖模式。使用显式正数字参数时，切换到覆盖模式。使用显式非正数字参数时，切换到插入模式。此命令仅影响 emacs 模式；vi 模式的覆盖方式不同。每次调用 readline() 都以插入模式开始。

在覆盖模式下，绑定到 self-insert 的字符替换光标处的文本，而不是将文本向右推。绑定到 backward-delete-char 的字符用空格替换光标前的字符。

默认情况下，此命令未绑定。

### Killing And Yanking / 删除和粘贴

`kill-line` (`C-k`)

Kill the text from point to the end of the line. With a negative numeric argument, kill backward from the cursor to the beginning of the current line.

删除从光标到行尾的文本。使用负数字参数时，从光标向后删除到当前行的开头。

`backward-kill-line` (`C-x Rubout`)

Kill backward from the cursor to the beginning of the current line. With a negative numeric argument, kill forward from the cursor to the end of the current line.

从光标向后删除到当前行的开头。使用负数字参数时，从光标向前删除到当前行的末尾。

`unix-line-discard` (`C-u`)

Kill backward from the cursor to the beginning of the current line.

从光标向后删除到当前行的开头。

`kill-whole-line` ()

Kill all characters on the current line, no matter where point is. By default, this is unbound.

删除当前行上的所有字符，无论光标在何处。默认情况下，此命令未绑定。

`kill-word` (`M-d`)

Kill from point to the end of the current word, or if between words, to the end of the next word. Word boundaries are the same as forward-word.

从光标删除到当前单词的末尾，或者如果在单词之间，则删除到下一个单词的末尾。单词边界与 forward-word 相同。

`backward-kill-word` (`M-DEL`)

Kill the word behind point. Word boundaries are the same as backward-word.

删除光标后的单词。单词边界与 backward-word 相同。

`shell-kill-word` (`M-C-d`)

Kill from point to the end of the current word, or if between words, to the end of the next word. Word boundaries are the same as shell-forward-word.

从光标删除到当前单词的末尾，或者如果在单词之间，则删除到下一个单词的末尾。单词边界与 shell-forward-word 相同。

`shell-backward-kill-word` ()

Kill the word behind point. Word boundaries are the same as shell-backward-word.

删除光标后的单词。单词边界与 shell-backward-word 相同。

`shell-transpose-words` (`M-C-t`)

Drag the word before point past the word after point, moving point past that word as well. If the insertion point is at the end of the line, this transposes the last two words on the line. Word boundaries are the same as shell-forward-word and shell-backward-word.

将光标前的单词拖动到光标后的单词之后，同时将光标移动到该单词之后。如果插入点在行尾，则交换行上的最后两个单词。单词边界与 shell-forward-word 和 shell-backward-word 相同。

`unix-word-rubout` (`C-w`)

Kill the word behind point, using white space as a word boundary. The killed text is saved on the kill-ring.

删除光标后的单词，使用空白作为单词边界。删除的文本保存在 kill-ring 中。

`unix-filename-rubout` ()

Kill the word behind point, using white space and the slash character as the word boundaries. The killed text is saved on the kill-ring.

删除光标后的单词，使用空白和斜杠字符作为单词边界。删除的文本保存在 kill-ring 中。

`delete-horizontal-space` ()

Delete all spaces and tabs around point. By default, this is unbound.

删除光标周围的所有空格和制表符。默认情况下，此命令未绑定。

`kill-region` ()

Kill the text in the current region. By default, this command is unbound.

删除当前区域中的文本。默认情况下，此命令未绑定。

`copy-region-as-kill` ()

Copy the text in the region to the kill buffer, so it can be yanked right away. By default, this command is unbound.

将区域中的文本复制到 kill 缓冲区，以便可以立即粘贴。默认情况下，此命令未绑定。

`copy-backward-word` ()

Copy the word before point to the kill buffer. The word boundaries are the same as backward-word. By default, this command is unbound.

将光标前的单词复制到 kill 缓冲区。单词边界与 backward-word 相同。默认情况下，此命令未绑定。

`copy-forward-word` ()

Copy the word following point to the kill buffer. The word boundaries are the same as forward-word. By default, this command is unbound.

将光标后的单词复制到 kill 缓冲区。单词边界与 forward-word 相同。默认情况下，此命令未绑定。

`yank` (`C-y`)

Yank the top of the kill ring into the buffer at point.

将 kill ring 顶部的内容粘贴到光标处的缓冲区。

`yank-pop` (`M-y`)

Rotate the kill-ring, and yank the new top. You can only do this if the prior command is yank or yank-pop.

旋转 kill-ring，并粘贴新的顶部内容。只有在前一个命令是 yank 或 yank-pop 时才能执行此操作。

### Specifying Numeric Arguments / 指定数字参数

`digit-argument` (`M-0`, `M-1`, … `M--`)

Add this digit to the argument already accumulating, or start a new argument. M-- starts a negative argument.

将此数字添加到已累积的参数中，或开始新参数。M-- 开始一个负参数。

`universal-argument` ()

This is another way to specify an argument. If this command is followed by one or more digits, optionally with a leading minus sign, those digits define the argument. If the command is followed by digits, executing universal-argument again ends the numeric argument, but is otherwise ignored. As a special case, if this command is immediately followed by a character that is neither a digit nor minus sign, the argument count for the next command is multiplied by four. The argument count is initially one, so executing this function the first time makes the argument count four, a second time makes the argument count sixteen, and so on. By default, this is not bound to a key.

这是指定参数的另一种方式。如果此命令后跟一个或多个数字（可选地带有前导减号），则这些数字定义参数。如果命令后跟数字，再次执行 universal-argument 会结束数字参数，否则会被忽略。作为一种特殊情况，如果此命令后立即跟着一个既不是数字也不是减号的字符，则下一个命令的参数计数乘以四。参数计数最初为一，因此第一次执行此函数使参数计数为四，第二次使参数计数为十六，依此类推。默认情况下，此命令未绑定到键。

### Letting Readline Type For You / 让 Readline 为您输入

`complete` (`TAB`)
Attempt to perform completion on the text before point. The actual completion performed is application-specific. Bash attempts completion treating the text as a variable (if the text begins with '$'), username (if the text begins with '~'), hostname (if the text begins with '@'), or command (including aliases and functions) in turn. If none of these produces a match, filename completion is attempted.

尝试对光标前的文本执行补全。实际执行的补全是应用程序特定的。Bash 尝试将文本视为变量（如果文本以 '$' 开头）、用户名（如果文本以 '~' 开头）、主机名（如果文本以 '@' 开头）或命令（包括别名和函数）进行补全。如果这些都不产生匹配，则尝试文件名补全。

`possible-completions` (`M-?`)

List the possible completions of the text before point. When displaying completions, Readline sets the number of columns used for display to the value of completion-display-width, the value of the environment variable COLUMNS, or the screen width, in that order.

列出光标前文本的可能补全。显示补全时，Readline 将用于显示的列数设置为 completion-display-width 的值、环境变量 COLUMNS 的值或屏幕宽度，按此顺序。

`insert-completions` (`M-*`)

Insert all completions of the text before point that would have been generated by possible-completions.

插入所有可能由 possible-completions 生成的光标前文本的补全。

`menu-complete` ()

Similar to complete, but replaces the word to be completed with a single match from the list of possible completions. Repeated execution of menu-complete steps through the list of possible completions, inserting each match in turn. At the end of the list of completions, the bell is rung (subject to the setting of bell-style) and the original text is restored. An argument of n moves n positions forward in the list of matches; a negative argument may be used to move backward through the list. This command is intended to be bound to TAB, but is unbound by default.

类似于 complete，但用可能补全列表中的单个匹配项替换要补全的单词。重复执行 menu-complete 会遍历可能补全列表，依次插入每个匹配项。在补全列表的末尾，会响铃（取决于 bell-style 的设置）并恢复原始文本。参数 n 在匹配列表中向前移动 n 个位置；可以使用负参数在列表中向后移动。此命令旨在绑定到 TAB，但默认情况下未绑定。

`menu-complete-backward` ()

Identical to menu-complete, but moves backward through the list of possible completions, as if menu-complete had been given a negative argument.

与 menu-complete 相同，但在可能补全列表中向后移动，就像给 menu-complete 提供了负参数一样。

`delete-char-or-list` ()

Deletes the character under the cursor if not at the beginning or end of the line (like delete-char). If at the end of the line, behaves identically to possible-completions. This command is unbound by default.

如果不在行的开头或结尾，则删除光标下的字符（如 delete-char）。如果在行尾，则行为与 possible-completions 相同。此命令默认未绑定。

`complete-filename` (`M-/`)

Attempt filename completion on the text before point.

尝试对光标前的文本执行文件名补全。

`possible-filename-completions` (`C-x /`)

List the possible completions of the text before point, treating it as a filename.

列出光标前文本的可能补全，将其视为文件名。

`complete-username` (`M-~`)

Attempt completion on the text before point, treating it as a username.

尝试对光标前的文本执行补全，将其视为用户名。

`possible-username-completions` (`C-x ~`)

List the possible completions of the text before point, treating it as a username.

列出光标前文本的可能补全，将其视为用户名。

`complete-variable` (`M-$`)

Attempt completion on the text before point, treating it as a shell variable.

尝试对光标前的文本执行补全，将其视为 shell 变量。

`possible-variable-completions` (`C-x $`)

List the possible completions of the text before point, treating it as a shell variable.

列出光标前文本的可能补全，将其视为 shell 变量。

`complete-hostname` (`M-@`)

Attempt completion on the text before point, treating it as a hostname.

尝试对光标前的文本执行补全，将其视为主机名。

`possible-hostname-completions` (`C-x @`)

List the possible completions of the text before point, treating it as a hostname.

列出光标前文本的可能补全，将其视为主机名。

`complete-command` (`M-!`)

Attempt completion on the text before point, treating it as a command name. Command completion attempts to match the text against aliases, reserved words, shell functions, shell builtins, and finally executable filenames, in that order.

尝试对光标前的文本执行补全，将其视为命令名。命令补全尝试按顺序将文本与别名、保留字、shell 函数、shell 内置命令，最后是可执行文件名进行匹配。

`possible-command-completions` (`C-x !`)

List the possible completions of the text before point, treating it as a command name.

列出光标前文本的可能补全，将其视为命令名。

`dynamic-complete-history` (`M-TAB`)

Attempt completion on the text before point, comparing the text against lines from the history list for possible completion matches.

尝试对光标前的文本执行补全，将文本与历史列表中的行进行比较以寻找可能的补全匹配。

`dabbrev-expand` ()

Attempt menu completion on the text before point, comparing the text against lines from the history list for possible completion matches.

尝试对光标前的文本执行菜单补全，将文本与历史列表中的行进行比较以寻找可能的补全匹配。

`complete-into-braces` (`M-{`)

Perform filename completion and insert the list of possible completions enclosed within braces so the list is available to the shell (see Brace Expansion).

执行文件名补全并插入括在大括号中的可能补全列表，以便 shell 可以使用该列表（参见大括号扩展）。

### Keyboard Macros / 键盘宏

`start-kbd-macro` (`C-x (`)

Begin saving the characters typed into the current keyboard macro.

开始将输入的字符保存到当前键盘宏中。

`end-kbd-macro` (`C-x )`)

Stop saving the characters typed into the current keyboard macro and save the definition.

停止将输入的字符保存到当前键盘宏中并保存定义。

`call-last-kbd-macro` (`C-x e`)

Re-execute the last keyboard macro defined, by making the characters in the macro appear as if typed at the keyboard.

重新执行最后定义的键盘宏，使宏中的字符看起来像是在键盘上输入的。

`print-last-kbd-macro` ()

Print the last keyboard macro defined in a format suitable for the inputrc file.

以适合 inputrc 文件的格式打印最后定义的键盘宏。

### Some Miscellaneous Commands / 其他杂项命令

`re-read-init-file` (`C-x C-r`)

Read in the contents of the inputrc file, and incorporate any bindings or variable assignments found there.

读取 inputrc 文件的内容，并合并其中找到的任何绑定或变量赋值。

`abort` (`C-g`)

Abort the current editing command and ring the terminal's bell (subject to the setting of bell-style).

中止当前编辑命令并响铃（取决于 bell-style 的设置）。

`do-lowercase-version` (`M-A`, `M-B`, `M-x`, …)

If the metafied character x is upper case, run the command that is bound to the corresponding metafied lower case character. The behavior is undefined if x is already lower case.

如果元字符 x 是大写的，则运行绑定到相应元化小写字符的命令。如果 x 已经是小写，则行为未定义。

`prefix-meta` (`ESC`)

Metafy the next character typed. This is for keyboards without a meta key. Typing 'ESC f' is equivalent to typing M-f.

元化下一个输入的字符。这适用于没有元键的键盘。输入 'ESC f' 等同于输入 M-f。

`undo` (`C-_` or `C-x C-u`)

Incremental undo, separately remembered for each line.

增量撤销，每行单独记忆。

`revert-line` (`M-r`)

Undo all changes made to this line. This is like executing the undo command enough times to get back to the beginning.

撤消对此行所做的所有更改。这就像执行足够多次的撤销命令以回到开头。

`tilde-expand` (`M-&`)

Perform tilde expansion on the current word.

对当前单词执行波浪号扩展。

`set-mark` (`C-@`)

Set the mark to the point. If a numeric argument is supplied, the mark is set to that position.

将标记设置为光标位置。如果提供数字参数，则标记设置为该位置。

`exchange-point-and-mark` (`C-x C-x`)

Swap the point with the mark. The current cursor position is set to the saved position, and the old cursor position is saved as the mark.

交换光标和标记。当前光标位置设置为保存的位置，旧的光标位置保存为标记。

`character-search` (`C-]`)

A character is read and point is moved to the next occurrence of that character. A negative argument searches for previous occurrences.

读取一个字符并将光标移动到该字符的下一个出现位置。负参数搜索之前的出现位置。

`character-search-backward` (`M-C-]`)

A character is read and point is moved to the previous occurrence of that character. A negative argument searches for subsequent occurrences.

读取一个字符并将光标移动到该字符的前一个出现位置。负参数搜索后续的出现位置。

`skip-csi-sequence` ()

Read enough characters to consume a multi-key sequence such as those defined for keys like Home and End. Such sequences begin with a Control Sequence Indicator (CSI), usually ESC-[. If this sequence is bound to "\e[", keys producing such sequences will have no effect unless explicitly bound to a Readline command, instead of inserting stray characters into the editing buffer. This is unbound by default, but usually bound to ESC-[.

读取足够的字符以消耗多键序列，如为 Home 和 End 等键定义的序列。此类序列以控制序列指示符（CSI）开头，通常为 ESC-[。如果此序列绑定到 "\e["，则产生此类序列的键将无效，除非显式绑定到 Readline 命令，而不是将杂乱字符插入编辑缓冲区。此命令默认未绑定，但通常绑定到 ESC-[。

`insert-comment` (`M-#`)

Without a numeric argument, the value of the comment-begin variable is inserted at the beginning of the current line. If a numeric argument is supplied, this command acts as a toggle: if the characters at the beginning of the line do not match the value of comment-begin, the value is inserted, otherwise the characters in comment-begin are deleted from the beginning of the line. In either case, the line is accepted as if a newline had been typed. The default value of comment-begin causes this command to make the current行 a shell comment. If a numeric argument causes the comment character to be removed, the line will be executed by the shell.

不带数字参数时，comment-begin 变量的值插入到当前行的开头。如果提供数字参数，此命令充当切换开关：如果行开头的字符与 comment-begin 的值不匹配，则插入该值，否则从行开头删除 comment-begin 中的字符。在任何一种情况下，该行都被接受，就像输入了换行符一样。comment-begin 的默认值使此命令将当前行变为 shell 注释。如果数字参数导致注释字符被移除，则该行将由 shell 执行。

`dump-functions` ()

Print all of the functions and their key bindings to the Readline output stream. If a numeric argument is supplied, the output is formatted in such a way that it can be made part of an inputrc file. This command is unbound by default.

将所有函数及其键绑定打印到 Readline 输出流。如果提供数字参数，则输出的格式使其可以成为 inputrc 文件的一部分。此命令默认未绑定。

`dump-variables` ()

Print all of the settable variables and their values to the Readline output stream. If a numeric argument is supplied, the output is formatted in such a way that it can be made part of an inputrc file. This command is unbound by default.

将所有可设置变量及其值打印到 Readline 输出流。如果提供数字参数，则输出的格式使其可以成为 inputrc 文件的一部分。此命令默认未绑定。

`dump-macros` ()

Print all of the Readline key sequences bound to macros and the strings they output. If a numeric argument is supplied, the output is formatted in such a way that it can be made part of an inputrc file. This command is unbound by default.

打印所有绑定到宏的 Readline 键序列及其输出的字符串。如果提供数字参数，则输出的格式使其可以成为 inputrc 文件的一部分。此命令默认未绑定。

`spell-correct-word` (`C-x s`)

Perform spelling correction on the current word, treating it as a directory or filename, in the same way as the cdspell shell option. Word boundaries are the same as those used by shell-forward-word.

对当前单词执行拼写纠正，将其视为目录或文件名，与 cdspell shell 选项的方式相同。单词边界与 shell-forward-word 使用的相同。

`glob-complete-word` (`M-g`)

The word before point is treated as a pattern for pathname expansion, with an asterisk implicitly appended. This pattern is used to generate a list of matching file names for possible completions.

光标前的单词被视为路径名扩展的模式，隐式附加星号。此模式用于生成匹配文件名的列表以供可能的补全。

`glob-expand-word` (`C-x *`)

The word before point is treated as a pattern for pathname expansion, and the list of matching file names is inserted, replacing the word. If a numeric argument is supplied, a '*' is appended before pathname expansion.

光标前的单词被视为路径名扩展的模式，并插入匹配文件名的列表，替换该单词。如果提供数字参数，则在路径名扩展之前附加 '*'。

`glob-list-expansions` (`C-x g`)

The list of expansions that would have been generated by glob-expand-word is displayed, and the line is redrawn. If a numeric argument is supplied, a '*' is appended before pathname expansion.

显示将由 glob-expand-word 生成的扩展列表，并重绘该行。如果提供数字参数，则在路径名扩展之前附加 '*'。

`display-shell-version` (`C-x C-v`)

Display version information about the current instance of Bash.

显示当前 Bash 实例的版本信息。

`shell-expand-line` (`M-C-e`)

Expand the line as the shell does. This performs alias and history expansion as well as all of the shell word expansions (see Shell Expansions).

像 shell 一样扩展该行。这会执行别名和历史扩展以及所有 shell 单词扩展（参见 Shell 扩展）。

`history-expand-line` (`M-^`)

Perform history expansion on the current line.

对当前行执行历史扩展。

`magic-space` ()

Perform history expansion on the current line and insert a space (see History Expansion).

对当前行执行历史扩展并插入空格（参见历史扩展）。

`alias-expand-line` ()

Perform alias expansion on the current line (see Aliases).

对当前行执行别名扩展（参见别名）。

`history-and-alias-expand-line` ()

Perform history and alias expansion on the current line.

对当前行执行历史和别名扩展。

`insert-last-argument` (`M-.` or `M-_`)

A synonym for yank-last-arg.

yank-last-arg 的同义词。

`edit-and-execute-command` (`C-x C-e`)

Invoke an editor on the current command line, and execute the result as shell commands. Bash attempts to invoke $VISUAL, $EDITOR, and emacs as the editor, in that order.

在当前命令行上调用编辑器，并将结果作为 shell 命令执行。Bash 尝试按顺序调用 $VISUAL、$EDITOR 和 emacs 作为编辑器。

----

https://tutorialtactic.com/keyboard-shortcuts/bash-shortcuts/

https://github.com/fliptheweb/bash-shortcuts-cheat-sheet

https://www.gnu.org/software/bash/manual/bash.html#Readline-Init-File-Syntax-1
