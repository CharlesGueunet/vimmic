" simeji/winresizer
" Resize windows on the fly

let s:pluginName='winresizer'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

  " Settings
  """"""""""
  let g:winresizer_start_key = '<leader>wr'

  " Shortcut
  """"""""""
  nnoremap <leader>wr :WinResizerStartResize<CR>

  " Theme
  """""""
  " None

else
  if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
    echom s:pluginName.' not found, try :Update'
  endif
endif
