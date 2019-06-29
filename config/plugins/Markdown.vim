" plasticboy/vim-markdown
" Markdown coloration

let s:pluginName='vim-markdown'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

  " Settings
  """"""""""
  let g:vim_markdown_folding_disabled = 1

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
