" ctrlpvim/ctrlp.vim
" Visualize vim undo-tree to easily recover past states

let s:pluginName='place.vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

  " Settings
  """"""""""
  " None

  " Shortcut
  """"""""""
  nmap gi <Plug>(place-insert)
  nmap gm <Plug>(place-insert-multiple)

  " Theme
  """""""
  " None

else
  if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
    echom s:pluginName.' not found, try :Update'
  endif
endif
