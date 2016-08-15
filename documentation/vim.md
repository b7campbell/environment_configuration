# Vim

The vim configuration is one of this repo's most substantial parts. This guide gives an idea of layout of the resources in `vim/`.

The entry point into `vim/` is `runcoms/vimrc`, which itself is likely the target of `~/.vimrc@`.

vim  
 |━ `vim-configuration-files `  
 | &nbsp;&nbsp; |━ bootstrap.vim  
 | &nbsp;&nbsp; |━ constants.vim  
 | &nbsp;&nbsp; |━ functions.vim  
 | &nbsp;&nbsp; |━ mappings.vim  
 | &nbsp;&nbsp; |━ options.vim  
 | &nbsp;&nbsp; |━ statusline.vim  
 |━ `plugin-configuration-files`  
 | &nbsp;&nbsp; |━ gruvbox.vim  
 | &nbsp;&nbsp; |━ hardtime.vim  
 | &nbsp;&nbsp; |━ lightline.vim

### Vim Config Files
----

#### bootstrap

Holds a number of functions and constants that other basic functions rely on.

#### constants

Set constants used in other vim configuration files.

#### functions

Define functions used throughout vim configuration suite.

#### mappings

Configure mappings, in particular commands prefixed by the leader key.

#### options

Set all of vim's many options. Each option has an accompanying comment.

#### statusline

In the event lightline is unavaiable, the statusline can be configured using this file. While the customization in this file is not nearly as expressive as lightline's, it is more descriptive than the base statusline.

### Vim Plugin Config
----

#### gruvbox

Loads the grubox colorscheme with some further additions (e.g. italic comments).

#### hardtime

Fine tunes the hardtime plugin, which is designed to prevent key repetition.

#### lightline

Alter the appearance of lightline status bar plugin.


