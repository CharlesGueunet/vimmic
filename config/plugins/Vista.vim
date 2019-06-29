" liuchengxu/vista.vim
" Asynchronous tag bar

let s:pluginName='vista.vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

  " Settings
  """"""""""
  let g:vista_icon_indent = ["└ ", "├ "]
  let g:vista_fzf_preview = ['right:50%']

  let g:vista_executive_for = {
        \ 'cpp': 'coc',
        \ 'c': 'coc',
        \ }

  " Shortcut
  """"""""""
  nnoremap <leader>t :Vista!!<CR>

  " Theme
  """""""

else
  if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
    echom s:pluginName.' not found, try :Update'
  endif
endif
