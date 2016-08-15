let mapleader="\<space>"
let maplocalleader = '\'

" ==============
" Config Editing
" ==============

nnoremap <leader>ev  :call EditVimRunCommand()<cr>
nnoremap <leader>sv  :source $MYVIMRC<cr>

nnoremap <leader>eb  :call EditVimConfigFile('bootstrap')<cr>
nnoremap <leader>ec  :call EditVimConfigFile('constants')<cr>
nnoremap <leader>em  :call EditVimConfigFile('mappings')<cr>
nnoremap <leader>ef  :call EditVimConfigFile('functions')<cr>
nnoremap <leader>eo  :call EditVimConfigFile('options')<cr>
nnoremap <leader>es  :call EditVimConfigFile('statusline')<cr>

nnoremap <leader>eph :call EditVimConfigFile('../plugin_configuration_files/hardtime')<cr>
nnoremap <leader>epl :call EditVimConfigFile('../plugin_configuration_files/lightline')<cr>
nnoremap <leader>epg :call EditVimConfigFile('../plugin_configuration_files/gruvbox')<cr>

" =============
" Training Maps
" =============

augroup training_maps
  autocmd!
  " none
augroup END

" =======
" Disable
" =======

nnoremap <Left>   <nop>
nnoremap <Right>  <nop>
nnoremap <Up>     <nop>
nnoremap <Down>   <nop>

inoremap <silent> <ESC>OA <nop>
inoremap <silent> <ESC>OB <nop>
inoremap <silent> <ESC>OC <nop>
inoremap <silent> <Esc>OD <nop>

" =========
" Utilities
" =========

nnoremap <space><space> :

inoremap jk <esc>

" ========
" Commands
" ========

command! W w
command! Q q

" Change inside the next and previous parenthesis
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>

onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi}<cr>

onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap il] :<c-u>normal! F]vi]<cr>

" ============
" autocommands
" ============

" =======
" Toggles
" =======

nnoremap <leader>A  :call ShortOptionToggle('cursorline') <bar> call ShortOptionToggle('cursorcolumn')<cr>
nnoremap <leader>B  :call ToggleBackgroundColor()<cr>
nnoremap <leader>HO :execute ":noh"<cr>
nnoremap <leader>HI :call ShortOptionToggle('incsearch')<cr>
nnoremap <leader>L  :call ShortOptionToggle('list')<cr>
nnoremap <leader>N  :call ShortOptionToggle('number')<cr>
nnoremap <leader>P  :call ShortOptionToggle('paste')<cr>

" ========
" Readline
" ========

"https://github.com/houtsnip/vim-emacscommandline/blob/master/plugin/emacscommandline.vim

" Commandline
cnoremap        <C-A> <Home>
cnoremap        <C-E> <End>
cnoremap        <C-B> <Left>
cnoremap        <C-F> <Right>

cnoremap        <S-Tab>   <C-d>
cnoremap <expr> <C-D> (getcmdpos() - 1)==strlen(getcmdline())?"":"<Del>"
cnoremap        <C-K> <C-\>e strpart(getcmdline(), 0, getcmdpos() - 1)<CR>
                        " ^ set the command line to the string to the right, which is an interpreted function

noremap! <expr>   <SID>transposition getcmdpos()>strlen(getcmdline())?"<Left>":getcmdpos()>1?'':"<Right>"
noremap! <expr>   <SID>transpose     "<BS><Right>".matchstr(getcmdline()[0 : getcmdpos()-2], '.$')
cmap     <script> <C-T>              <SID>transposition<SID>transpose

" <C-x><C-a>    get builtin C-a
" ex_mode/history-scrollers.vim
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

augroup bmd_cmds
  autocmd!
  autocmd BufReadPre,BufnewFile *.bmd   noremap <leader>r :w<CR>:silent !./render.sh<cr>
augroup END

function! MapHiraganaCharacters()
  inoremap  a<bs>q あ
  inoremap  i<bs>q い
  inoremap  u<bs>q う
  inoremap  e<bs>q え
  inoremap  o<bs>q お
  inoremap  k<bs>a か
  inoremap  k<bs>i き
  inoremap  k<bs>u く
  inoremap  k<bs>e け
  inoremap  k<bs>o こ
  inoremap  k<bs>ya きゃ
  inoremap  k<bs>yu きゅ
  inoremap  k<bs>yo きょ
  inoremap  s<bs>a さ
  inoremap  s<bs>hi し
  inoremap  s<bs>u す
  inoremap  s<bs>e せ
  inoremap  s<bs>o そ
  inoremap  s<bs>ha しゃ
  inoremap  s<bs>hu しゅ
  inoremap  s<bs>ho しょ
  inoremap  t<bs>a た
  inoremap  c<bs>hi ち
  inoremap  t<bs>su つ
  inoremap  t<bs>e て
  inoremap  t<bs>o と
  inoremap  c<bs>ha ちゃ
  inoremap  c<bs>hu ちゅ
  inoremap  c<bs>ho ちょ
  inoremap  n<bs>a な
  inoremap  n<bs>i に
  inoremap  n<bs>u ぬ
  inoremap  n<bs>e ね
  inoremap  n<bs>o の
  inoremap  n<bs>ya にゃ
  inoremap  n<bs>yu にゅ
  inoremap  n<bs>yo にょ
  inoremap  h<bs>a は
  inoremap  h<bs>i ひ
  inoremap  h<bs>u ふ
  inoremap  f<bs>u ふ
  inoremap  h<bs>e へ
  inoremap  h<bs>o ほ
  inoremap  h<bs>ya ひゃ
  inoremap  h<bs>yu ひゅ
  inoremap  h<bs>yo ひょ
  inoremap  m<bs>a ま
  inoremap  m<bs>i み
  inoremap  m<bs>u む
  inoremap  m<bs>e め
  inoremap  m<bs>o も
  inoremap  m<bs>ya みゃ
  inoremap  m<bs>yu みゅ
  inoremap  m<bs>yo みょ
  inoremap  y<bs>a や
  inoremap  y<bs>u ゆ
  inoremap  y<bs>o よ
  inoremap  r<bs>a ら
  inoremap  r<bs>i り
  inoremap  r<bs>u る
  inoremap  r<bs>e れ
  inoremap  r<bs>o ろ
  inoremap  r<bs>ya りゃ
  inoremap  r<bs>yu りゅ
  inoremap  r<bs>yo りょ
  inoremap  w<bs>a わ
  inoremap  w<bs>o を
  inoremap  n<bs>5 ん
  inoremap  t<bs>t っ
endfunction

autocmd FileType txt,jp call MapHiraganaCharacters()

