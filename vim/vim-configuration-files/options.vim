"=========================================
"  Config File Setting Builtin Options
"=========================================

" see doc: http://vimdoc.sourceforge.net/htmldoc/options.html

set autowrite         " write modified file on { :next, :rewind, :last, :first, :previous, :!, ... }

set backspace=start   " allow backspacing over the start of insert

" backup file settings {{{
  " ~> enable backup files
  " ~> use safest method for creating file
  " ~> specify directory for backups
  " ~> which directories to skip when creating backups

  set backup
  set backupcopy=yes

  set backupdir=$ENV_PATH/tmp/vimbackups "TODO: directory
  set backupdir+=$HOME/my_tools/vimbackups
  set backupdir+=$HOME/tmp/.backups
  let &backupskip .= ',' . expand('$HOME') . '/tmp/*'. ',/var/*'

  augroup backup_extension
    autocmd!
    autocmd BufWritePre * let &backupext = "+" . strftime("%Y_%b%d_%H:%M") . "+"
  augroup END
" }}}

" buffer settings {{{
  " ~> wipe the buffer from memory
  " ~> list buffer in :ls (buffer specific option)
  " ~> buffers behave normally

  set bufhidden=wipe
  set buflisted
  set buftype=
" }}}

set cedit=<C-Y>       " remap command line window; select previous command
set nocindent         " disable c-style indenting
set cmdheight=2       " screen lines to use for the command-line
set cmdwinheight=5    " screen lines for use in command-line-window
set colorcolumn=0     " disable the coloring of columns
set nocompatible      " enforce a set of options for compatibility with vi
set nocursorcolumn    " do not highlight column cursor is on
set nocursorline      " do not highlight line cursor is on

set debug=msg         " give a message rather than a beep for an error
set nodigraph 		    " do not allow for BS entered glyphs
set directory=.,~/tmp " heirarchy of directories swap files are created in
set display=lastline,uhex      " display flags { lastline : do not print @ for lines, uhex : show hex code }

set noerrorbells      " turn off beeps
set noesckeys 		  " no <Esc>-keys in Insert mode; cursor keys are disabled by default for easier <Esc>

" list of autocommand events to ignore {{{
  set eventignore=WinEnter
  set eventignore+=WinLeave
" }}}

set expandtab         " tabs expanded to spaces; use <c-v><Tab> to insert a real tab
set noexrc            " disallow local rc config reading

" fold options {{{
  set foldclose=        " do not automatically close folds
  set foldcolumn=1      " display column to detail folds
  set foldenable
  set foldexpr=0        " default expression to get foldline level
  set foldignore=#      " lines prefixed by chars in foldignore get fold level from surrounding lines
  set foldlevel=0       " close all foldlines on startup; higher numbers close fewer ﬀolds
  set foldlevelstart=0  " sets foldlevel to 0 at specific time in bootup
  set foldmarker={{{,}}}
  set foldmethod=marker
  set foldminlines=1    " minimum number of lines needed to close a fold
  set foldnestmax=5
  set foldtext=foldtext() " what text is display in folds

  set foldopen=block,mark,percent,search,tag,undo
      " specifies type of commands that folds are opened by
      " ~> applies to when a command moves the cursor into a closed fold
      " ~> not used when a movement command is used for an operator
" }}}

set formatoptions=crql1 " some options chosen from list at: options.html#'formatoptions'

set nogdefault        " no defaults for :subsitute
set grepprg=grep\ -n\ $*\ /dev/null

set history=50	      " 50 entries of history in each command line table
set nohidden          " a buffer is unloaded when it is |abandon|ed
set hlsearch	      " highlighting of search matches

set icon              " the icon text of the window will be set to the filename, if iconstring is empty
set iconstring=
set noincsearch
set noinsertmode      " normal vim mode configuration

set key=              " useless as in-vim encryption shouldn't be done
set keymap=           " default keyboard mapping
set keymodel=         " enable special functions of certain keys
set keywordprg=man    " program for 'K' command

set langmap=          " exchange commands or change keys to a new language (implicit or explicit)
set langmenu=         " tells what file is loaded from 'lang' directory for
set nolazyredraw      " normal behavior during macro execution
set nolist            " show unprinted characters specified by listchars
set listchars=tab:>-,eol:$,nbsp:%
set loadplugins       " enables plugins

set magic             " enables special meaning of escape characters in search patterns
set makeef=           " name of errorfile for make command  :make_makeprg
set makeprg=make      " make program used by :make command
set matchpairs=(:),{:},[:] " for % command
set matchtime=1       " 1/10 of a second spent by showmatch
set maxfuncdepth=1000 " number of recursive function calls allowed
set maxmapdepth=100   " will not catch Right-Recursion
set menuitems=25      " max number of items allowed in menus
set modeline          " local to buffer
set modelines=5       " if modline is on, give # of lines that are checked for set commands
set more 			        " page a buffer when necessary
set mouse=
set mousemodel=       " no need for setting since mouse never used

set nrformats=        " only consider decimals <c-A> and <c-X>
set number            " line numbers
set numberwidth=2     " minimal columns for numberline column
set operatorfunc=     " function to be called by |g@|

set nopreserveindent  " wipe the current indent with all spaces (because expandtab is enabled)
set previewheight=0   " zeroed because option is disbled
set nopreviewwindow
set prompt            " a : prompt is ex mode
set pumheight=5       " size of popup menu for Insert mode completion
set redrawtime=2000   " time in milliseconds for redrawing the display
set norelativenumber  " absolute numbers in numberline
set remap             " for plugins - all maps locally have 'no' specified
set report=2          " number of lines changed to be worth reporting
set norevins
set norightleft       " left to right mode
set rightleftcmd=     " unset due to norightleft
set noruler

set scroll=0          " <c-U> and <c-D> travel half the window
set noscrollbind      " separator buffers scroll separately
set scrolljump=1      " number of vertical jumps made when cursor reaches the edge of a buffer
set scrolloff=1       " minіmal number of screen lines to keep above and below the cursor
set nosecure          " shell and write commands are allowed in .{vim,ex}rc" in the current directory
set selectmode=       " do not allow overrides of visual mode

" shell interface config {{{
set shell=/bin/bash   " name of shell to use
set shellcmdflag=-c
set shellpipe=&>\|tee " command to put the output of the :make in the make error file
set shelltemp         " use temp files for shell commands
set shellxquote=      " options.html#'shellxquote'
" }}}

" shift config {{{
set shiftwidth=4
set shiftround		              " shift moves lines to multiples of &shiftwidth
" }}}

" http://vimdoc.sourceforge.net/htmldoc/options.html#'shortmess'
set shortmess=IsToO
set noshortname        " disable (archaic) abbreviation of filenames
let &showbreak ='░ ' " characters to prefix a wrapped line
set showcmd
set showmatch          " inserting closing brace/bracket/paren jumps to last open brace/backet/paren
set noshowmode
set showtabline=2      " always show tabline
set sidescroll=0       " although, only used when nowrap
set sidescrolloff=0
set nosmartcase
set nosmartindent		" no auto indentation (triggered by certain symbols)
set nosmarttab			" insert blanks according to tabstop
set softtabstop=0		" tabs are always tabstop positions
set splitright
set startofline         " many linewise movement commands jump to the first nonblank of a line

            " <HIGHER> -> <LOWER> priority for opening with *
set suffixes=.bak,~,.h,.swp,.info
set swapfile
set switchbuf=newtab
set synmaxcol=1000

set tabpagemax=10      " used when vim invoked with -p or buffers opened with :tab all
set tabstop=4
set notermbidi         " terminal is not involved in directionality of text
" let &termencoding = &encoding

set noterse
set textauto           " set only for compatibility
set notextmode         " set only for compatibility; Yes: dos ff and No: unix ff
set textwidth=0        " disables line breaking for crossing the textwidth boundary
set notildeop			     " tilde is not an operator
set timeout            " refers to onoremaps
set timeoutlen=2000    " milliseconds to wait before timeout
set nottimeout			   " no terminal timeout
set ttybuiltin         " the builtin termcaps are searched before the external ones.

set noundofile
set updatecount=200

set verbose=0
set verbosefile=""
set viewoptions=folds,options,cursor
set visualbell

set warn
set noweirdinvert
set whichwrap=
set whichwrap="b,s"		" left-right movements don't wrap, although these will
set wildchar=<Tab>		" only when the current value is <Tab>; use CTRL-E for cmdline completion
set wildignore=*.o,*.obj
set wildignorecase
set nowildmenu        " works with full
set wildmode=list:longest

set wrap
set wrapmargin=0
set wrapscan          " searches wrap around EOF
set nowriteany
set writebackup

" settings configured elsewhere {{{
  " set columns
  " set filetype
  " set helpfile          " name of the main help file
  " set helpheight        " configured to work with equalalways
  " set highlight         " highlights groups
  " set noignorecase      " in search in search patters
  " set indentexpr        " vim has a builtin function
  " set lines
  " set paste
  " set pastetoggle       " function setup in functions.vim with toggle
  " set quoteescape       " no reason to override and there maybe be escape issues
  " set readonly
  " set rulerformat
  " set runtimepath
  " set shelldir          " easier to leave as is
  " set statusline
  " set syntax
  " set tabline
  " set term
  " set viminfo
  "set fileformat=unix       " newline is given by <NL> char
  "set fileformats=unix,dos  " choose what format a new buffer should use; Note: unix is given preference

" }}}

" builtin c-options {{{
  augroup c_related_options
    autocmd!
    autocmd BufNewFile,BufReadPre *.c setlocal indentexpr=  " C code indentation
    autocmd BufNewFile,BufReadPre *.c setlocal cindent 			" C code indentation
  augroup END

  " ~> pressing these keys in insert reindents
  " ~> <vim-docs> indent.html#cinoptions-values
  " ~> start an extra indent

  " set cinkeys=0{,0},:,0#,!^F,o,O,e,=end,=else,=cat,=fina,=END,0\
  " set cinoptions=
  " set cinwords=if,else,while,do,for,switch
" }}}

" builtin lisp-options {{{
  set nolisp            " do not active lisp mode -- like ever
  " lispwords
" }}}

" Cscope options {{{
  " set cscopepathcomp
  " set cscopeprg
  " set cscopequickfix
  " set cscopetag
  " set scopetagorder
  " set cscopeverbose
" }}}

" vimdiff options {{{
  " diff
  " diffexpr
  " diffopt
  " set patchexpr
  " set patchmode
" }}}

" text editing config {{{

  function! SetTextEditorOptions()
    setlocal joinspaces
    setlocal linebreak
    setlocal spell
    setlocal spellfile=~/.vim/spell/en.utf-8.add
    " spellcapcheck: easier to let terminal handle
    " spelllang: \" \"
    setlocal spellsuggest=best
  endfunction

  set nojoinspaces
  set nolinebreak
  set nospell
  set spellfile=

  augroup editor_opt
    autocmd!
    autocmd BufReadPre,BufnewFile *.txt,*.bmd call SetTextEditorOptions()
  augroup END

" }}}

" options enabled by default with explanation {{{
  " set background                          " tells Vim what background color looks like, and not to change it
                                            "    => ':highlight' commands should come after
  " set breakat=\ ^I!@*-+;:,./?             " which characters to break at if linebreak is on
  " set casemap=internal,keepascii          " useful for when a file is in unicode mode
  " set cdpath=,,                           " tab completion should look in current dir
  " set charconvert=                        " used in encoding conversions
  " set comments=sO:" -,mO:"  ,eO:"",:"     " change.html#format-comments
  " set commentstring="%s                   " set string prefixing a comment
  " set complete=.,w,b,u,t,i                " how keyword completion works  ref: options.html#'complete'
  " set completefunc=                       "  ^
  " set completeopt=menu,preview            "  ^
  " set concealcursor=                      " which modes should conceal characters
  " set conceallevel=0                      " how to conceal syntax attributes, default text is shown normally
  " set noconfirm                           " confirm prints extra prompts for commands like :q and :e
  " set nocopyindent                        " do not copy the structure of indent when autoindenting a new line
  " set cpoptions="aABceFs"                 " for more: options.html#'cpoptions'
  " set cryptmethod=                        " method disabled
  " set nocursorbind                        " cursors in other windows follow movements - great for diff!
  " set define=^\s*#\s*define               " searched pattern used for macro definition; used in [i, [d
  " set dict=                               " files <c-x><c-k>completion looks-up
  " set eadirection=both                    " says when should the equalsalways apply
  " set noedcompatible                      " enables 'g' and 'c' flags of the the subsitute command
  " set endofline                           " automatically append <EOL> to the end of file
  " set equalalways                         " all windows are equally sized after splitting or closing a window
  " set equalprg=                           " use builtin indent scheme
  " set errorfile=errors.err                " name of the errorfile for the QuickFix mode
  " set errorformat=<.......>               " Scanf-like description of the format for error file lines
  " set fillchars=vert:|,fold:-             " formatting for statusline
  " set formatlistpat=^\s*\d\+[\]:.)}\t ]\s*" not in use; used by formatoptions setting
  " set formatprg=                          " no external program used to format lines selected with gg operator
  " set formatexpr=                         " expression used to format a range of lines for the |gq|
  " set fsync                               " flush file to hard disk to ensure file is safely written
  " set grepfmrmat=%f:%l:%m,%f:%l%m,%f  %l%m  " format to recognize for the grep command output.
  " set helplang=en                         " vim uses firstlanguage in list to display help
  " set iminsert=0                          " unused
  " set imsearch=0
  " set include=^\s*#\s*include             " unused
  " set includeexpr=                        " unused
  " set noinfercase                         " for use in insert-mode completion
  " set isfname
  " set isident
  " set iskeyword
  " set isprint
  " set maxcombine                          " default of 2 combine characters is generally sufficient
  " set omnifunc=                           " function to be used in <c-X><c-O>
  " set maxmem*           " set by system
  " set maxmkspellmem     " see above
  " set modifiable
  " set modified
  " set paragraphs
  " set path=.,/usr/include,,
  " set scrollopt
  " set sections
  " set selection=inclusive                  "  the last character of a selection is included in an operation
  " set sessionoptions
  " set shellquote
  " set noshowfulltag                        " tags...
  " set swapsync                             " configured by fsync()
  "
  " set tagbsearch
  " set taglength
  " set tags
  " set tagstack
  " thesaurus                                " , delimited filenames used to lookup words in |i_CTRL-X_CTRL-T|
  " title
  " titlelen
  " titleold
  " titlestring
  " write
" }}}

augroup tabstop_config
  autocmd!
  autocmd BufReadPre,BufnewFile *.c,*.cpp           call ConfigureTabstop(2)
  autocmd BufReadPre,BufnewFile *.rb,Gemfile,*.erb  call ConfigureTabstop(1)
  autocmd BufReadPre,BufnewFile *.scala             call ConfigureTabstop(1)
  autocmd BufReadPre,BufnewFile *.sh,*.*rc          call ConfigureTabstop(1)
  autocmd BufReadPre,BufnewFile *.vim,*.vimrc       call ConfigureTabstop(1)
augroup END

augroup scala
  autocmd!
  autocmd BufReadPre,BufnewFile *.scala             setlocal filetype=scala
  let g:scala_scaladoc_indent = 1
augroup END

augroup coq
  autocmd!
  autocmd BufReadPre,BufnewFile *.v                 set filetype=coq
augroup END

augroup bmd
  autocmd!
  autocmd BufReadPre,BufnewFile *.bmd         setlocal linebreak
  autocmd BufReadPre,BufnewFile *.bmd         colorscheme solarized
augroup END

" Non-iTerm config {{{
call ConfigureBaseVim(
      \    'SourceConfigFile("statusline")'
      \ )
" }}}

" secondary visualbell disable commands {{{
set t_vb=
autocmd GUIEnter * set visualbell t_vb=
" }}}

set laststatus=2      " show statusline
