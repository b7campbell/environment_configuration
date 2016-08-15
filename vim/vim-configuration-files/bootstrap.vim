" Constants
let g:config_path = $ENV_PATH . "/vim"

" Functions
function! SourceConfigFile(file)
  execute 'source ' . g:config_path . '/vim-configuration-files/' . a:file . '.vim'
endfunction

function! SourceConfigFiles(...)
  for filename in a:000
    call SourceConfigFile(filename)
  endfor
endfunction

" Vimscript file settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

