" wellle/context.vim
" Shows the context of the current line at the top

let s:pluginName='context.vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

  " Settings
  """"""""""
  let g:context_ellipsis_char = '──────────────────────────────────────────────────────────────────────────────────────────────────────────'
  let g:context_enabled = 0

  " Shortcut
  """"""""""
  nmap <leader>ph :ContextToggle<CR>

  " Theme
  """""""
  " None

else
  if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
    echom s:pluginName.' not found, try :Update'
  endif
endif
