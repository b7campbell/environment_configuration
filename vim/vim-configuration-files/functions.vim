
"===========================================
"            General Utilities
"===========================================

function! ConfigureiTermVim(...)
  if 'iTerm.app' == $TERM_PROGRAM
    for cmd in a:000
      execute 'call ' . cmd
    endfor
  endif
endfunction

function! ConfigureBaseVim(...)
  if 'iTerm.app' != $TERM_PROGRAM
    for cmd in a:000
      execute 'call ' . cmd
    endfor
  endif
endfunction

function! SourcePluginConfigFile(file)
  execute 'source ' . g:plugin_directory . '/' . a:file . '.vim'
endfunction

function! SourcePluginConfigFiles(...)
  for filename in a:000
    call SourcePluginConfigFile(filename)
  endfor
endfunction

function! EnablePlugin(...)
  for plugin_name in a:000
    execute 'call pathogen#interpose("bundle/' . plugin_name . '")'
  endfor
endfunction

"===========================================
"             Edit Special Files
"===========================================

function! EditVimRunCommand()
  if expand('%:t') ==? ""
    edit $MYVIMRC
  else
    tabedit $MYVIMRC
  endif
endfunction

function! EditVimConfigFile(file_name)
  let l:path = g:main_directory . '/' . a:file_name . ".vim"
  if expand('%:t') ==? ""
    execute 'edit' l:path
  else
    execute 'tabedit' l:path
  endif
endfunction

"===========================================
"               Option Formatting
"===========================================

function! ConfigureTabstop(scheme)
  function! s:set_options(val)
    execute 'setlocal shiftwidth=' . a:val
    execute 'setlocal tabstop='    . a:val
  endfunction

  " ruby, vim, shell
  if a:scheme == 1
    call s:set_options(2)
  " c, cpp
  elseif a:scheme == 2
    call s:set_options(4)
  endif
endfunction

"===========================================
"             Option Toggles
"===========================================

function! ShortOptionToggle(option_name)
  execute ':set ' . a:option_name . '!'
  execute ':set ' . a:option_name . '?'
endfunction

function! s:long_option_toggle(option, opt_val, setting1, setting2)
  if a:opt_val == a:setting1
    execute ':setlocal ' . a:option . '=' . a:setting2
  elseif a:opt_val == a:setting2
    execute ':setlocal ' . a:option . '=' . a:setting1
  else
    echom 'Warning: [' . a:option . '] not set to either ' . a:setting1 . ' or ' . a:setting2
  endif
endfunction

  "=========
  " Specific
  "=========

function! ToggleBackgroundColor()
  call s:long_option_toggle('background', &background, 'dark', 'light')
endfunction
