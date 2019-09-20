" cmake4vim
" CMake intergration in vim (use dispatch if present)

let s:pluginName='cmake4vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

  " Settings
  """"""""""
  let g:cmake_reload_after_save=0
  let g:cmake_compile_commands =1

  " Shortcut
  """"""""""

  " Command CMake and Save to set install target
  nnoremap <leader>mi :CMakeSelectTarget install<CR>
  nnoremap <leader>mI :CMakeSelectTarget all<CR>
  nnoremap <leader>mc :CMake<CR>
  nnoremap <leader>mp :let g:make_arguments="-j4"<CR>
  nnoremap <leader>mP :let g:make_arguments="-j1"<CR>

  " Theme
  """""""
  " None

else
  if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
    echom s:pluginName.' not found, try :Update'
  endif
endif
