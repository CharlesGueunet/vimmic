" tpope/vim-commentary
" operator to comment region / selection

let s:pluginName='vim-commentary'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

  "" Settings
  """""""""""
  " None

  " Shortcut
  """"""""""

  " Function
  let s:commentaryBlock = 0
  function! ToogleCommentaryCCPP()
    if s:commentaryBlock
      setlocal commentstring=//\ %s
      let s:commentaryBlock = 0
      echo 'Comment now use //'
    else
      setlocal commentstring=/*\ %s\ */
      let s:commentaryBlock = 1
      echo 'Comment now use /* */'
      " Still command the whole line even if the selected part is smaller
    endif
  endfunction

  " toogle between block and line comment in c/cpp
  augroup vimmic_commentary_shortcuts
    autocmd FileType c,cpp command! ToogleCommentaryCCPP call ToogleCommentaryCCPP()
    autocmd FileType c,cpp map <leader>ct :call ToogleCommentaryCCPP()<CR>
  augroup END

  nmap <leader>cc gcc

  " Theme
  """""""
  " None

else
  if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
    echom s:pluginName.' not found, try :Update'
  endif
endif
