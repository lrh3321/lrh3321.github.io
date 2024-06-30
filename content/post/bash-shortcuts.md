---
title: "Bash Shortcuts"
description: 
slug: bash-shortcuts
date: 2023-08-30T22:07:48+08:00
lastmod: 2024-06-30T22:07:48+08:00
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

- `Ctrl + C`: Terminate the command
- `Ctrl + Z`: Suspend the command
- `Ctrl + A`: Move to the start of the line
- `Ctrl + E`: Move to the end of the line
- `Ctrl + F`: Move forward one character
- `Ctrl + B`: Move backward one character
- `Ctrl + U`: Delete from the cursor to the start of the line
- `Ctrl + K`: Delete from the cursor to the end of the line
- `Ctrl + W`: Delete from the cursor to the start of the word
- `Ctrl + D`: Delete the character under the cursor
- `Ctrl + H`: Delete the character before the cursor
- `Ctrl + T`: Swap the character under the cursor with the previous one
- `Ctrl + L`: Clear the screen

## Editing Shortcuts

| Action                                                                | Bash Shortcuts |
| --------------------------------------------------------------------- | -------------- |
| Tab                                                                   | `Ctrl + I`     |
| New Line                                                              | `Ctrl + J`     |
| Enter                                                                 | `Ctrl + M`     |
| Paste the Last Thing to be Cut                                        | `Ctrl + Y`     |
| Undo                                                                  | `Ctrl + _`     |
| Upper the case Every Character Form Cursor                            | `Alt + U`      |
| Lower the case Every Character Form Cursor                            | `Alt + L`      |
| Capitalize the Character Under Cursor and Move to the End of the Word | `Alt + C`      |
| Cancel Changes and Put Back the Line                                  | `Alt + R`      |
| Delete Character Under Cursor                                         | `Ctrl + D`     |
| Delete Character From Left                                            | `Ctrl + H`     |
| Delete Word before Cursor                                             | `Alt + Delete` |
| Delete Word after Cursor                                              | `Alt + D`      |
| Clear Screen                                                          | `Ctrl + L`     |
| Escape                                                                | `Ctrl + [`     |
| Cut Word Before Cursor to Clipboard                                   | `Ctrl + W`     |
| Cut Line After Cursor to Clipboard                                    | `Ctrl + K`     |
| Cut Line Before Cursor to Clipboard                                   | `Ctrl + U`     |
| Swap Current Word with Previous                                       | `Alt + T`      |
| Swap the Last Character before Cursor                                 | `Ctrl + T`     |
| Swap the Last Two Words Before the Cursor                             | `Esc + T`      |

## Emacs and Vi Mode Shortcuts

| Action         | Bash Shortcut keys |
| -------------- | ------------------ |
| Set Emacs Mode | `$set -o emacs`    |
| Set Vi Mode    | `$set -o vi`       |

## Navigation Shortcuts

| Action                          | Bash Shortcuts |
| ------------------------------- | -------------- |
| Go to the Beginning of the Line | `Home`         |
| Go to the End of the Line       | `End`          |
| Forward one character           | `Ctrl + F`     |
| Backward one character          | `Ctrl + B`     |
| Previous Command                | `Ctrl + P`     |
| Next Command                    | `Ctrl + N`     |
| Back one word                   | `Alt + B`      |
| Forward one word                | `Alt + F`      |

## Control Character Shortcuts
| Action                            | Bash Shortcuts |
| --------------------------------- | -------------- |
| ^@                                | `Ctrl + 2`     |
| ^Escape                           | `Ctrl + 3`     |
| ^\                                | `Ctrl + 4`     |
| ^                                 | `Ctrl + 5`     |
| ^^                                | `Ctrl + 6`     |
| ^_Undo                            | `Ctrl + 7`     |
| ^? Backward Delete Character      | `Ctrl + 8`     |
| Display Sequence for entering Key | `Ctrl + V`     |

## History Shortcuts

| Action                                           | Bash Shortcuts |
| ------------------------------------------------ | -------------- |
| Recall Last Command                              | `Ctrl + R`     |
| Previous Command in History                      | `Ctrl + P`     |
| Next Command in History                          | `Ctrl + N`     |
| Go back to Next Most Recent Command              | `Ctrl + S`     |
| Escape from History Searching Mode               | `Ctrl + O`     |
| Repeat Last Command                              | `Ctrl + G`     |
| Run Last Command Starting with `ABC`             | `!!`           |
| Print the last Command starting with `ABC`       | `!abc`         |
| Last Argument of Previous Command                | `!abc:p`       |
| Last Argument of Previous Command                | `!$`           |
| All Arguments of Previous Command                | `Alt + .`      |
| Run Previous Command, replacing `abc` with `def` | `^abc^def`     |

## Process Controls Shortcuts

| Action                                     | Bash Shortcuts |
| ------------------------------------------ | -------------- |
| Recall Last Command                        | `Ctrl + R`     |
| Interrupt or Kill Whatever you are running | `Ctrl + C`     |
| Clear Screen                               | `Ctrl + L`     |
| Stop Output to Screen                      | `Ctrl + S`     |
| Allow Output to Screen                     | `Ctrl + Q`     |
| Send an EOF Marker                         | `Ctrl + D`     |
| Send the signal SIGTSTP to Current Task    | `Ctrl + Z`     |

The bash shortcuts will boost maximizing your productivity to around 90%. However, Bash is not the only shell out there. The one that can be the best alternative to bash is ZSH. It is a default shell in macOS. No doubt the experience of using this shell can be quite different. Dig into the ZSH shortcuts list.

---

## `/etc/inputrc`

[readline(3) — Linux manual page](https://www.man7.org/linux/man-pages/man3/readline.3.html)

[GNU Readline Library](https://tiswww.case.edu/php/chet/readline/rluserman.html)

[8.4 Bindable Readline Commands](https://www.gnu.org/software/bash/manual/bash.html#Bindable-Readline-Commands)

### Commands For Moving

`beginning-of-line` (`C-a`)

Move to the start of the current line.

`end-of-line` (`C-e`)

Move to the end of the line.

`forward-char` (`C-f`)

Move forward a character.

`backward-char` (`C-b`)

Move back a character.

`forward-word` (`M-f`)

Move forward to the end of the next word. Words are composed of letters and digits.

`backward-word` (`M-b`)

Move back to the start of the current or previous word. Words are composed of letters and digits.

`shell-forward-word` (`M-C-f`)

Move forward to the end of the next word. Words are delimited by non-quoted shell metacharacters.

`shell-backward-word` (`M-C-b`)

Move back to the start of the current or previous word. Words are delimited by non-quoted shell metacharacters.

`previous-screen-line` ()

Attempt to move point to the same physical screen column on the previous physical screen line. This will not have the desired effect if the current Readline line does not take up more than one physical line or if point is not greater than the length of the prompt plus the screen width.

`next-screen-line` ()

Attempt to move point to the same physical screen column on the next physical screen line. This will not have the desired effect if the current Readline line does not take up more than one physical line or if the length of the current Readline line is not greater than the length of the prompt plus the screen width.

`clear-display` (`M-C-l`)

Clear the screen and, if possible, the terminal’s scrollback buffer, then redraw the current line, leaving the current line at the top of the screen.

`clear-screen` (`C-l`)

Clear the screen, then redraw the current line, leaving the current line at the top of the screen.

`redraw-current-line` ()

Refresh the current line. By default, this is unbound.

### Commands For Manipulating The History

accept-line (Newline or Return)
Accept the line regardless of where the cursor is. If this line is non-empty, add it to the history list according to the setting of the HISTCONTROL and HISTIGNORE variables. If this line is a modified history line, then restore the history line to its original state.

`previous-history` (`C-p`)

Move ‘back’ through the history list, fetching the previous command.

`next-history` (`C-n`)

Move ‘forward’ through the history list, fetching the next command.

`beginning-of-history` (`M-<`)

Move to the first line in the history.

`end-of-history` (`M->`)

Move to the end of the input history, i.e., the line currently being entered.

`reverse-search-history` (`C-r`)

Search backward starting at the current line and moving ‘up’ through the history as necessary. This is an incremental search. This command sets the region to the matched text and activates the mark.

`forward-search-history` (`C-s`)

Search forward starting at the current line and moving ‘down’ through the history as necessary. This is an incremental search. This command sets the region to the matched text and activates the mark.

`non-incremental-reverse-search-history` (`M-p`)

Search backward starting at the current line and moving ‘up’ through the history as necessary using a non-incremental search for a string supplied by the user. The search string may match anywhere in a history line.

`non-incremental-forward-search-history` (`M-n`)

Search forward starting at the current line and moving ‘down’ through the history as necessary using a non-incremental search for a string supplied by the user. The search string may match anywhere in a history line.

`history-search-forward` ()

Search forward through the history for the string of characters between the start of the current line and the point. The search string must match at the beginning of a history line. This is a non-incremental search. By default, this command is unbound.

`history-search-backward` ()

Search backward through the history for the string of characters between the start of the current line and the point. The search string must match at the beginning of a history line. This is a non-incremental search. By default, this command is unbound.

`history-substring-search-forward` ()

Search forward through the history for the string of characters between the start of the current line and the point. The search string may match anywhere in a history line. This is a non-incremental search. By default, this command is unbound.

`history-substring-search-backward` ()

Search backward through the history for the string of characters between the start of the current line and the point. The search string may match anywhere in a history line. This is a non-incremental search. By default, this command is unbound.

`yank-nth-arg` (`M-C-y`)

Insert the first argument to the previous command (usually the second word on the previous line) at point. With an argument n, insert the nth word from the previous command (the words in the previous command begin with word 0). A negative argument inserts the nth word from the end of the previous command. Once the argument n is computed, the argument is extracted as if the ‘!n’ history expansion had been specified.

`yank-last-arg` (`M-.` or `M-_`)

Insert last argument to the previous command (the last word of the previous history entry). With a numeric argument, behave exactly like yank-nth-arg. Successive calls to yank-last-arg move back through the history list, inserting the last word (or the word specified by the argument to the first call) of each line in turn. Any numeric argument supplied to these successive calls determines the direction to move through the history. A negative argument switches the direction through the history (back or forward). The history expansion facilities are used to extract the last argument, as if the ‘!$’ history expansion had been specified.

`operate-and-get-next` (`C-o`)

Accept the current line for return to the calling application as if a newline had been entered, and fetch the next line relative to the current line from the history for editing. A numeric argument, if supplied, specifies the history entry to use instead of the current line.

`fetch-history` ()

With a numeric argument, fetch that entry from the history list and make it the current line. Without an argument, move back to the first entry in the history list.

### Commands For Changing Text

`end-of-file` (usually `C-d`)

The character indicating end-of-file as set, for example, by stty. If this character is read when there are no characters on the line, and point is at the beginning of the line, Readline interprets it as the end of input and returns EOF.

`delete-char` (`C-d`)

Delete the character at point. If this function is bound to the same character as the tty EOF character, as C-d commonly is, see above for the effects.

`backward-delete-char` (`Rubout`)

Delete the character behind the cursor. A numeric argument means to kill the characters instead of deleting them.

`forward-backward-delete-char` ()

Delete the character under the cursor, unless the cursor is at the end of the line, in which case the character behind the cursor is deleted. By default, this is not bound to a key.

`quoted-insert` (`C-q` or `C-v`)

Add the next character typed to the line verbatim. This is how to insert key sequences like C-q, for example.

`self-insert` (a, b, A, 1, !, …)

Insert yourself.

`bracketed-paste-begin` ()

This function is intended to be bound to the "bracketed paste" escape sequence sent by some terminals, and such a binding is assigned by default. It allows Readline to insert the pasted text as a single unit without treating each character as if it had been read from the keyboard. The characters are inserted as if each one was bound to self-insert instead of executing any editing commands.

Bracketed paste sets the region (the characters between point and the mark) to the inserted text. It uses the concept of an active mark: when the mark is active, Readline redisplay uses the terminal’s standout mode to denote the region.

`transpose-chars` (`C-t`)

Drag the character before the cursor forward over the character at the cursor, moving the cursor forward as well. If the insertion point is at the end of the line, then this transposes the last two characters of the line. Negative arguments have no effect.

`transpose-words` (`M-t`)

Drag the word before point past the word after point, moving point past that word as well. If the insertion point is at the end of the line, this transposes the last two words on the line.

`upcase-word` (`M-u`)

Uppercase the current (or following) word. With a negative argument, uppercase the previous word, but do not move the cursor.

`downcase-word` (`M-l`)

Lowercase the current (or following) word. With a negative argument, lowercase the previous word, but do not move the cursor.

`capitalize-word` (`M-c`)

Capitalize the current (or following) word. With a negative argument, capitalize the previous word, but do not move the cursor.

`overwrite-mode` ()

Toggle overwrite mode. With an explicit positive numeric argument, switches to overwrite mode. With an explicit non-positive numeric argument, switches to insert mode. This command affects only emacs mode; vi mode does overwrite differently. Each call to readline() starts in insert mode.

In overwrite mode, characters bound to self-insert replace the text at point rather than pushing the text to the right. Characters bound to backward-delete-char replace the character before point with a space.

By default, this command is unbound.

### Killing And Yanking

`kill-line` (`C-k`)

Kill the text from point to the end of the line. With a negative numeric argument, kill backward from the cursor to the beginning of the current line.

`backward-kill-line` (`C-x Rubout`)

Kill backward from the cursor to the beginning of the current line. With a negative numeric argument, kill forward from the cursor to the end of the current line.

`unix-line-discard` (`C-u`)

Kill backward from the cursor to the beginning of the current line.

`kill-whole-line` ()

Kill all characters on the current line, no matter where point is. By default, this is unbound.

`kill-word` (`M-d`)

Kill from point to the end of the current word, or if between words, to the end of the next word. Word boundaries are the same as forward-word.

`backward-kill-word` (`M-DEL`)

Kill the word behind point. Word boundaries are the same as backward-word.

`shell-kill-word` (`M-C-d`)

Kill from point to the end of the current word, or if between words, to the end of the next word. Word boundaries are the same as shell-forward-word.

`shell-backward-kill-word` ()

Kill the word behind point. Word boundaries are the same as shell-backward-word.

`shell-transpose-words` (`M-C-t`)

Drag the word before point past the word after point, moving point past that word as well. If the insertion point is at the end of the line, this transposes the last two words on the line. Word boundaries are the same as shell-forward-word and shell-backward-word.

`unix-word-rubout` (`C-w`)

Kill the word behind point, using white space as a word boundary. The killed text is saved on the kill-ring.

`unix-filename-rubout` ()

Kill the word behind point, using white space and the slash character as the word boundaries. The killed text is saved on the kill-ring.

`delete-horizontal-space` ()

Delete all spaces and tabs around point. By default, this is unbound.

`kill-region` ()

Kill the text in the current region. By default, this command is unbound.

`copy-region-as-kill` ()

Copy the text in the region to the kill buffer, so it can be yanked right away. By default, this command is unbound.

`copy-backward-word` ()

Copy the word before point to the kill buffer. The word boundaries are the same as backward-word. By default, this command is unbound.

`copy-forward-word` ()

Copy the word following point to the kill buffer. The word boundaries are the same as forward-word. By default, this command is unbound.

`yank` (`C-y`)

Yank the top of the kill ring into the buffer at point.

`yank-pop` (`M-y`)

Rotate the kill-ring, and yank the new top. You can only do this if the prior command is yank or yank-pop.

### Specifying Numeric Arguments

`digit-argument` (`M-0`, `M-1`, … `M--`)

Add this digit to the argument already accumulating, or start a new argument. M-- starts a negative argument.

`universal-argument` ()

This is another way to specify an argument. If this command is followed by one or more digits, optionally with a leading minus sign, those digits define the argument. If the command is followed by digits, executing universal-argument again ends the numeric argument, but is otherwise ignored. As a special case, if this command is immediately followed by a character that is neither a digit nor minus sign, the argument count for the next command is multiplied by four. The argument count is initially one, so executing this function the first time makes the argument count four, a second time makes the argument count sixteen, and so on. By default, this is not bound to a key.

### Letting Readline Type For You

`complete` (`TAB`)
Attempt to perform completion on the text before point. The actual completion performed is application-specific. Bash attempts completion treating the text as a variable (if the text begins with ‘$’), username (if the text begins with ‘~’), hostname (if the text begins with ‘@’), or command (including aliases and functions) in turn. If none of these produces a match, filename completion is attempted.

`possible-completions` (`M-?`)

List the possible completions of the text before point. When displaying completions, Readline sets the number of columns used for display to the value of completion-display-width, the value of the environment variable COLUMNS, or the screen width, in that order.

`insert-completions` (`M-*`)

Insert all completions of the text before point that would have been generated by possible-completions.

`menu-complete` ()

Similar to complete, but replaces the word to be completed with a single match from the list of possible completions. Repeated execution of menu-complete steps through the list of possible completions, inserting each match in turn. At the end of the list of completions, the bell is rung (subject to the setting of bell-style) and the original text is restored. An argument of n moves n positions forward in the list of matches; a negative argument may be used to move backward through the list. This command is intended to be bound to TAB, but is unbound by default.

`menu-complete-backward` ()

Identical to menu-complete, but moves backward through the list of possible completions, as if menu-complete had been given a negative argument.

`delete-char-or-list` ()

Deletes the character under the cursor if not at the beginning or end of the line (like delete-char). If at the end of the line, behaves identically to possible-completions. This command is unbound by default.

`complete-filename` (`M-/`)

Attempt filename completion on the text before point.

`possible-filename-completions` (`C-x /`)

List the possible completions of the text before point, treating it as a filename.

`complete-username` (`M-~`)

Attempt completion on the text before point, treating it as a username.

`possible-username-completions` (`C-x ~`)

List the possible completions of the text before point, treating it as a username.

`complete-variable` (`M-$`)

Attempt completion on the text before point, treating it as a shell variable.

`possible-variable-completions` (`C-x $`)

List the possible completions of the text before point, treating it as a shell variable.

`complete-hostname` (`M-@`)

Attempt completion on the text before point, treating it as a hostname.

`possible-hostname-completions` (`C-x @`)

List the possible completions of the text before point, treating it as a hostname.

`complete-command` (`M-!`)

Attempt completion on the text before point, treating it as a command name. Command completion attempts to match the text against aliases, reserved words, shell functions, shell builtins, and finally executable filenames, in that order.

`possible-command-completions` (`C-x !`)

List the possible completions of the text before point, treating it as a command name.

`dynamic-complete-history` (`M-TAB`)

Attempt completion on the text before point, comparing the text against lines from the history list for possible completion matches.

`dabbrev-expand` ()

Attempt menu completion on the text before point, comparing the text against lines from the history list for possible completion matches.

`complete-into-braces` (`M-{`)

Perform filename completion and insert the list of possible completions enclosed within braces so the list is available to the shell (see Brace Expansion).

### Keyboard Macros

`start-kbd-macro` (`C-x (`)

Begin saving the characters typed into the current keyboard macro.

`end-kbd-macro` (`C-x )`)

Stop saving the characters typed into the current keyboard macro and save the definition.

`call-last-kbd-macro` (`C-x e`)

Re-execute the last keyboard macro defined, by making the characters in the macro appear as if typed at the keyboard.

`print-last-kbd-macro` ()

Print the last keyboard macro defined in a format suitable for the inputrc file.

### Some Miscellaneous Commands

`re-read-init-file` (`C-x C-r`)

Read in the contents of the inputrc file, and incorporate any bindings or variable assignments found there.

`abort` (`C-g`)

Abort the current editing command and ring the terminal’s bell (subject to the setting of bell-style).

`do-lowercase-version` (`M-A`, `M-B`, `M-x`, …)

If the metafied character x is upper case, run the command that is bound to the corresponding metafied lower case character. The behavior is undefined if x is already lower case.

`prefix-meta` (`ESC`)

Metafy the next character typed. This is for keyboards without a meta key. Typing ‘ESC f’ is equivalent to typing M-f.

`undo` (`C-_` or `C-x C-u`)

Incremental undo, separately remembered for each line.

`revert-line` (`M-r`)

Undo all changes made to this line. This is like executing the undo command enough times to get back to the beginning.

`tilde-expand` (`M-&`)

Perform tilde expansion on the current word.

`set-mark` (`C-@`)

Set the mark to the point. If a numeric argument is supplied, the mark is set to that position.

`exchange-point-and-mark` (`C-x C-x`)

Swap the point with the mark. The current cursor position is set to the saved position, and the old cursor position is saved as the mark.

`character-search` (`C-]`)

A character is read and point is moved to the next occurrence of that character. A negative argument searches for previous occurrences.

`character-search-backward` (`M-C-]`)

A character is read and point is moved to the previous occurrence of that character. A negative argument searches for subsequent occurrences.

`skip-csi-sequence` ()

Read enough characters to consume a multi-key sequence such as those defined for keys like Home and End. Such sequences begin with a Control Sequence Indicator (CSI), usually ESC-[. If this sequence is bound to "\e[", keys producing such sequences will have no effect unless explicitly bound to a Readline command, instead of inserting stray characters into the editing buffer. This is unbound by default, but usually bound to ESC-[.

`insert-comment` (`M-#`)

Without a numeric argument, the value of the comment-begin variable is inserted at the beginning of the current line. If a numeric argument is supplied, this command acts as a toggle: if the characters at the beginning of the line do not match the value of comment-begin, the value is inserted, otherwise the characters in comment-begin are deleted from the beginning of the line. In either case, the line is accepted as if a newline had been typed. The default value of comment-begin causes this command to make the current line a shell comment. If a numeric argument causes the comment character to be removed, the line will be executed by the shell.

`dump-functions` ()

Print all of the functions and their key bindings to the Readline output stream. If a numeric argument is supplied, the output is formatted in such a way that it can be made part of an inputrc file. This command is unbound by default.

`dump-variables` ()

Print all of the settable variables and their values to the Readline output stream. If a numeric argument is supplied, the output is formatted in such a way that it can be made part of an inputrc file. This command is unbound by default.

`dump-macros` ()

Print all of the Readline key sequences bound to macros and the strings they output. If a numeric argument is supplied, the output is formatted in such a way that it can be made part of an inputrc file. This command is unbound by default.

`spell-correct-word` (`C-x s`)

Perform spelling correction on the current word, treating it as a directory or filename, in the same way as the cdspell shell option. Word boundaries are the same as those used by shell-forward-word.

`glob-complete-word` (`M-g`)

The word before point is treated as a pattern for pathname expansion, with an asterisk implicitly appended. This pattern is used to generate a list of matching file names for possible completions.

`glob-expand-word` (`C-x *`)

The word before point is treated as a pattern for pathname expansion, and the list of matching file names is inserted, replacing the word. If a numeric argument is supplied, a ‘*’ is appended before pathname expansion.

`glob-list-expansions` (`C-x g`)

The list of expansions that would have been generated by glob-expand-word is displayed, and the line is redrawn. If a numeric argument is supplied, a ‘*’ is appended before pathname expansion.

`display-shell-version` (`C-x C-v`)

Display version information about the current instance of Bash.

`shell-expand-line` (`M-C-e`)

Expand the line as the shell does. This performs alias and history expansion as well as all of the shell word expansions (see Shell Expansions).

`history-expand-line` (`M-^`)

Perform history expansion on the current line.

`magic-space` ()

Perform history expansion on the current line and insert a space (see History Expansion).

`alias-expand-line` ()

Perform alias expansion on the current line (see Aliases).

`history-and-alias-expand-line` ()

Perform history and alias expansion on the current line.

`insert-last-argument` (`M-.` or `M-_`)

A synonym for yank-last-arg.

`edit-and-execute-command` (`C-x C-e`)

Invoke an editor on the current command line, and execute the result as shell commands. Bash attempts to invoke $VISUAL, $EDITOR, and emacs as the editor, in that order.

----

https://tutorialtactic.com/keyboard-shortcuts/bash-shortcuts/

https://github.com/fliptheweb/bash-shortcuts-cheat-sheet

https://www.gnu.org/software/bash/manual/bash.html#Readline-Init-File-Syntax-1
