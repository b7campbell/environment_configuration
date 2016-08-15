let s:left_separator     = "\ue0b0"   " >
let s:right_separator    = "\ue0b2"   " <
let s:left_subseparator  = "\ue0b1"   " _
let s:right_subseparator = "\ue0b3"   " _
let s:git_symbol         = "\ue0a0"   " [¥]
let s:read_only_symbol   = "\ue0a2"   " [®]

function! LightLineBufferNumber()
  return 'buf:' . expand( bufnr('%') )
endfunction

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return s:read_only_symbol
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  let l:branch_name = exists('*fugitive#head') ? fugitive#head() : ''
   return empty(l:branch_name) ? '' : s:git_symbol . ' ' . l:branch_name
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

 " /////////////
 "   Execution
 " \\\\\\\\\\\\\

" https://github.com/itchyny/lightline.vim/blob/master/doc/lightline.txt at line 96
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left':  [ [ 'mode', 'paste' ],
      \              [ 'fugitive', 'filename' ] ],
      \   'right': [ [ 'line', 'bufnumber' ],
      \              [  'filetype', 'fileformat', 'fileencoding' ] ]
      \ },
      \ 'component_function': {
      \   'bufnumber'  : 'LightLineBufferNumber',
      \   'fugitive'   : 'LightLineFugitive',
      \   'readonly'   : 'LightLineReadonly',
      \   'modified'   : 'LightLineModified',
      \   'filename'   : 'LightLineFilename'
      \ },
      \ 'separator'    : { 'left': s:left_separator,     'right': s:right_separator     },
      \ 'subseparator' : { 'left': s:right_subseparator, 'right': s:right_subseparator  }
      \ }

