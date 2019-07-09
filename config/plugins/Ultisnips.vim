" honza/ultisnips
" Snippet engine

let s:pluginName='ultisnips'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

  " Settings
  """"""""""
  let g:UltiSnipsExpandTrigger='<c-space>'
  let g:UltiSnipsJumpForwardTrigger='<tab>'
  let g:UltiSnipsJumpBackwardTrigger='<s-tab>'

  " If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit='vertical'

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
