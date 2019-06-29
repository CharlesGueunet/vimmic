" tommcdo/vim-exchange
" exchange two regions

let s:pluginName='vim-exchange'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

  " Settings
  """"""""""
  nmap <leader>pc cxccxi,f,wcxi,
  nmap <leader>pC cxccxi,F,gecxi,


  " Shortcut
  """"""""""
  " None

  " Theme
  """""""
  " None

else
  if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
    echom s:pluginName.' not found, try :Update'
  endif
endif

