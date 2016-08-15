
" Non-iTerm Config

" activate gruxbox colorscheme {{{
colorscheme gruvbox
set background=dark
" }}}

" iTerm Config

syntax on

" highlight config {{{
let g:gruvbox_italic = 1
highlight Comment         cterm=italic

highlight TrailingWhitespace cterm=underline ctermbg=red
match TrailingWhitespace /\s\+$/
autocmd BufWinEnter * match TrailingWhitespace /\s\+$/
autocmd InsertEnter * match TrailingWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingWhitespace /\s\+$/
autocmd BufWinLeave * call  clearmatches()

"http://alvinalexander.com/linux/vi-vim-editor-color-scheme-syntax
" au WinEnter * match ExtraWhitespace /\s\+\%#\@<!$/

highlight LineNr ctermfg=grey

" }}}
