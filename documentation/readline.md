# Readline

`runcoms/inputrc` contains both settings and custom mappings for the readline terminal interface. By default, readline attempts to source `~/.inputrc`. Likely, this file does not exist, so it is easiest to create a `~/.inputrc` that is a symlink to `runcoms/inputrc`. All future interactive bash shells will, therefore, initialize using the commands in `runcoms/inputrc`.

For more information, see readline's [official documentation](https://cnswww.cns.cwru.edu/php/chet/readline/readline.html).

#### Readline Interaction

First, there are a number of specially named keys that stand for escape sequences. Some can be triggered by ordinary key combinations but others are restricted to named keys. Not all of those named keys will be avaiable on a modern keyboard.

| Key  | Key Name  | Escape Code  |  Keyboard  |
|---|---|---|---|
| DEL  | delete |   |   |
| ESC  | escape | <1b> |   |
| LFD | linefeed  |  <00> |  *crtl-j*  |
| SPC | space |     |
| RET | return | <0d> | *crtl-m*, *return*
| TAB | tab    | <09> |
| ENT | enter  |  <0d> |

```
### Convention ###
Control keys operate on charaters while meta keys operate on words.
```

The commands introduced further down may ocassionally break the command line. Or, some changes may be unwanted. The following table of commands is used for undo-ing any number of operations:

| Keys      | Function                      |
|  -------  | ----------------------------- |
| Crtl-l    | clear screen and reprint line |
| Crtl-x l  | redraw the current line       |
| Ctrl- \_  | undo                          |
| Ctrl-g    | abort current line operation  |
| Meta-r    | revert-line                   |

#### Readline Arguments

 All readline commands accept arguments, sometimes as the number of times to repeat, and othertimes as an option. A negative argument flips the direction of a command. Pass numeric arguments to a command by typing meta digits before the command. And this number can be modified by a negative sign. The general syntax:
 ```
 Meta-[-][0-9]* [command]
 ```

| Keys      | Function                      |
|  -------  | ----------------------------- |
| Meta-_n_ M-C-y | yank the nth argument of the last command |
| Meta-.    | recall the last argument of previous commands |


#### Miscellaneous

 Meta gives control over Bash's tab completion:

| Keys      | Function                      |
|  -------  | ----------------------------- |
| Meta-?    | list possible completions for the current command line |
| Meta-\*   | insert all completions onto the command line |

#### Integrating changes to readline config file

After saving changes to the `inputrc` file used for configuring a shell, either open a new terminal or enter the key sequence `C-xC-r`, which will reread the init file.




------------




## Movement Keys

Below are the most basic readline movement keys. They will work regardless of terminal configuration. In addition, these keysequences will work in most modern gui applications.

| Keys      | Function               |
|-----------|------------------------|
| Ctrl-a    |  move to start of line |
| Crtl-e    |  move to end of line   |
| Crtl-b    |  move back one char    |
| Crtl-f    |  move forward one char |

Use *Meta* prefixed key sequences or key sequences that take an argument to move with more precision. Keyboards that do not have a *Meta* key can still make use of these sequences by instead prefixing commands with *Esc*.

| Keys      | Function               |
|-----------|------------------------|
| Meta-b    |  move back one word    |
| Meta-f    | move forward one word  |
| Crtl-] {} | move forward to character |
| Meta-Crtl-{} | move backward to character |

## Text Manipulation Commands

"kill"-ing is what is known as "cut"-ing today. In practice, when a command "kills text," it deletes the text from the current line and saves it in a session-local data structure known as the *kill ring*. The kill ring may be accessed holds numerous entries just like a multi-stage clipboard on modern operating systems.

###Charwise operations:

| Keys       | function                                  |
|------------|-------------------------------------------|
| Ctrl-d     | delete the current char or return an EOF  |
| Ctrl-h     | delete one backward char |
| Ctrl-t     | transpose characters |
| Ctrl-v     | quote the next character verbatim |


####Wordwise operations:

| Keys       | function                                  |
|------------|-------------------------------------------|
| Meta-d     | kill cursor to the end of the current word, or in lower priority, next word
| Meta-h   | kill cursor to the start of current word, or in lower priority, previous word
| Ctrl-w     | kill from cursor to the previous whitespace
| Meta-t     | transpose words |

####Linewise operations:

| Keys       | function                                  |
|------------|-------------------------------------------|
| Ctrl-k     | kill text from cursor position to end of the line
| Meta-- C-K | kill text from cursor position to the start of the line |
| Ctrl-u     | kill entire line |

#### Yank operations:

| Keys       | function                                  |
|------------|-------------------------------------------|
| Ctrl-y     | yank most recently killed text back into the buffer at the cursor
| Meta-y     | rotate the kill-ring and yank the new top (must preceed Meta-y)


## Command History

| Keys       | function                                  |
|------------|-------------------------------------------|
| Ctrl-p     | cycle "upwards" through command line history
| Ctrl-o     | cycle "downwards" through command line history
| Meta-<     | jump to the first line in command line history file
| Meta->     | jump to the last line in command line history file
| Ctrl-r     | incrementally search backwards through history
| Ctrl-s     | incrementally search forward through history
| Meta-p     | non incremental backwards history search
| Meta-o     | non incremental forwards history search
| !?_cmd_?   | search for cmd as a substring backwards through history file

 Activate incremental history search with `Crtl-s`. Reverse search is activated by `Crtl-r`. Following either, use `Crtl-s` and `Crtl-r` to search backward or forward in the history for the next entry matching the search string typed so far. Any other key sequence bound to a Readline command will terminate the search and execute that command. For instance, a RET will terminate the search and accept the line, thereby executing the command from the history list. A movement command will terminate the search, make the last line found the current line, and begin editing. If two C-rs are typed without any intervening characters defining a new search string, any remembered search string is used. Non-incremental searches read the entire search string before starting to search for matching history lines. The search string may be typed by the user or be part of the contents of the current line.

 Note: To enable `Crtl-s`, run `stty stop ''`, as explained [here](http://vaab.blog.kal.fr/2010/11/11/enabling-ctrl-s-for-forward-history-search-in-bash/).

## Keyboard Macros

| Keys       | function                                  |
|------------|-------------------------------------------|
| Ctrl-x (   |  begin saving the characters typed into the current keyboard macro
| Ctrl-x )   |  stop saving the characters typed into the current keyboard macro
| Ctrl-x e   |  execute the last keyboard macro defined
| Ctrl-x Meta-e | print the last keboard macro defined in a format for inputrc
| C-x C-d    | print all macro's defined in inputrc

## Custom Mappings

These mappings are defined in the readline init file.

| Keys       | function                                  |
|------------|-------------------------------------------|
| Ctrl-x "   | prepare to quote a word with double quotes
| Ctrl-x '   | prepare to quote a word with single quotes
| Ctrl-x q   | quote the current or previous word
| Ctrl-x p   | edit the current session's $PATH

## Settings in Init File

Readline (and libedit to a lesser extent) reads `runcoms/inputrc` with a terminal emulator opens a new session. The first table of variables are set by booleans. The second table of variables take arguments fitting a certain convention.

| Setting                  | Value     | Behavior                              |
|--------------------------|-----------|---------------------------------------|
| bind-tty-special-chars   | on        | bind the control characters treated specially by the kernel's terminal driver to their Readline equivalent
| colored-stats (no mac)   | on        | LS_COLORS for bash tab completion
| completion-ignore-case   | on        | case-insensitive filename matching and completion
| completion-map-case      | on        | _ and - are equivalent when performing case-insensitive filename matching and completion.
| completion-prefix-display-length (no mac) | 2 | character legnth of common prefix
| convert-meta             | off       | convert the eighth bit of characters to ASCII by stripping the eighth bit and prefixing an ESC character
| disable-completion       | off       | readline will not inhibit word completion
| echo-control-characters  (no mac) | on        | for some operating systems, a control key that stands for a signal will be echoed
| enable-keypad           | off       | disable the application keypad (arrow keys on numpad)
| enable-meta-key          | on        | enable any meta modifier key the terminal claims to support when it is called
| expand-tilde             | off       | tilde expansion is not performed when Readline attempts word completion
| history-preserve-point   | on        | history code will not place the current cursor position at the same location on each history line
| horizontal-scroll-mode   | off       | lines larger than the terminal width will wrap onto the next line
| input-meta               | on        | enable eight-bit input
| mark-directories         | on        | directory names have a slash appended
| mark-modified-lines      | on        | display an aserisk at the start of history lines that have been modified
| mark-symlinked-directories | on      | directory names in tab completion have an @ symbol appended to them
| match-hidden-files (no mac) | on     | completion matches hidden files without having to prefix the name with a '.'
| menu-complete-display-prefix (no mac) | off   | displays the common prefix of the list of possible completions before cycling through the list
| output-meta              | on        | display characters with the eighth bit set directly
| page-completions         | on        | display a screenful of possible completions using an internal more-like pager
| print-completions-horizontally (no mac) | off | display completions with matches sorted horizontally in alphabetical order
| revert-all-at-newline    | off       | history lines may be modified and retain individual undo lists across calls to readline
| show-all-if-ambiguous    | on        | words with more than one possible completion cause the matches to be listed immediately
| show-all-if-unmodified   | on        | words with more than one possible completion without any partial completions are listed immediately
| show-mode-in-prompt (no mac) | off   | prefix prompt with character: emacs (`@`), vi command (`:`), or vi insertion (`+`)
| skip-completed-text (no mac) | on    | when performing completion in the middle of a word, Readline will not duplicated parts of the word
| visible-stats            | on        | a character denoting a file's type is appended to the filename when listing possible completions

| Setting                  | Value     | Behavior                              |
|--------------------------|-----------|---------------------------------------|
| bell-style               | visible   | Readline uses a visible bell if one is available
| comment-begin            | "#"       | string to insert at the beginning of the line when the insert-comment command is executed
| completion-display-width | -1        | number of screen columns used to display possible matches when performing completion
| completion-query-items   | 75        | number of possible completions before readline asks whether to list options or not
| editing-mode             | emacs     | commands are emacs based rather than vi based
| keymap                   | emacs     | sets Readline's idea of the current keymap for key binding commands

No action will be taken with options: `history-size`, `isearch-terminators`, and `keyseq-timeout`.

