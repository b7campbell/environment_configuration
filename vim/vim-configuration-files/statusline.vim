function! StlFilename()

  "==================
  " Helper Functions
  "==================

  " abbreviate filepath prefix to `~'
  function! s:abbrev_filepath_prefix()
    return ['~'] + split( expand('%:p:h'), '/')[2:]
  endfunction

  function! s:get_filename_width()
    return str2float( strlen(expand('%@')) )
  endfunction

  " set limit for silename size
  function! s:space_for_filename()
    return &columns * 0.45
  endfunction

  " cut each directory in a filepath down to its first three letters
  function! s:truncate_head()

    let l:untruncated_filepath_elements = s:abbrev_filepath_prefix()
    let l:result_list = []  

    for element in l:untruncated_filepath_elements
      call add(l:result_list, element[0:2])
    endfor

    let l:truncated_filepath = join(l:result_list, "/")

    return l:truncated_filepath 
  endfunction

  "===========
  " Execution
  "===========

  if s:space_for_filename() < s:get_filename_width()
    return s:truncate_head() . '/' . expand('%:t')
  else
    return '~/' . join(split( expand('%:p'), '/')[2:], '/')
  endif
endfunction

function! ConstructStatusline()

  " Doc: http://vimdoc.sourceforge.net/htmldoc/options.html#'statusline'
  " %-{minwid}.{maxwid}{item}

  function! s:reset()
    set statusline=
  endfunction

  function! s:space()
    set statusline+=\ " delimiter: single space character
  endfunction

  function! s:add_element(element)
    execute ':set statusline+=' . a:element
    call s:space() 
  endfunction

  function! s:right_align()
    set statusline+=%=
  endfunction

  "===========
  " Execution
  "===========

  call s:reset()
  call s:add_element('%{StlFilename()}')

  call s:right_align()
  call s:add_element('[char:%3.b]')

  call s:add_element( '%y' )
  call s:add_element('[col:%2.0c]')
  call s:add_element('[row:%3.l/%3.L]')
  call s:add_element('[buffer:%n]')
  call s:add_element('%h')
  call s:add_element('%m')
  call s:add_element('%r')

  " show current mode as message on last line
  set showmode
endfunction

call ConstructStatusline()

