" Lokaltog/vim-easymotion
" easyly move everywhere with leader-leader motion

let s:pluginName='vim-easymotion'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

  " Settings
  "'''''''''
  " None

  " Shortcut
  "'''''''''
  " None

  " Theme
  "''''''
  " None

else
  if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
    echom s:pluginName.' not found, try :Update'
  endif
endif
