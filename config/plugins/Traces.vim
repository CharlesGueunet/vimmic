" markonm/traces.vim
" Search and replace with preview

let s:pluginName='traces.vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

  " Settings
  """"""""""
  let g:traces_num_range_preview=1

  " Shortcut
  """"""""""
  " Replace word under cursor in line
  nnoremap <Leader>pr :%s/\<<C-r><C-w>\>/
  nnoremap <Leader>ps :%s/
  " in visual mode, mapping a simple letter can conflict with snippets
  vnoremap <C-r> <Esc>:'<,'>s/

  " Theme
  """""""
  " None

else
  if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
    echom s:pluginName.' not found, try :Update'
  endif
endif
