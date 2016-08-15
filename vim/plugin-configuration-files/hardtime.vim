
" https://github.com/takac/vim-hardtime
" http://vimcasts.org/blog/2013/02/habit-breaking-habit-making/
" http://vimgolf.com/

let g:hardtime_default_on = 1

let g:list_of_normal_keys   = ["h", "j", "k", "l", "-", "+"]
let g:list_of_visual_keys   = ["h", "j", "k", "l", "-", "+"]
let g:list_of_insert_keys   = []

" Note: added to all modes
let g:list_of_disabled_keys = []

  " /////////
  "  Timeout
  " \\\\\\\\\

let g:hardtime_timeout = 500 " in milliseconds

  " //////////////
  "  Notifications
  " \\\\\\\\\\\\\\

let g:hardtime_showmsg = 1

  " /////////////
  "  Keys Configs
  " \\\\\\\\\\\\\

let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount            = 2

" [[ Other Options ]]
" let g:hardtime_ignore_buffer_patterns = [ "CustomPatt[ae]rn", "NERD.*" ]
" let g:hardtime_ignore_quickfix = 1

