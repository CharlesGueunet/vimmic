" justmao945/vim-clang
" C / C++ clever completion (can aslo report error but -> syntastic)

let s:pluginName='vim-clang'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:clang_auto = 0 " no complete after . (ctrl-x x does)
    "let g:clang_dotfile = '.clang'
    let g:clang_c_options = '-std=gnu11'
    let g:clang_cpp_options = '-std=c++11 -stdlib=libstdc++'
    let g:clang_include_sysheaders_from_gcc = 1
    let g:clang_compilation_database = '.'.g:file_sep.'build'
    " non intrusive completion
    let g:clang_diagsopt = ''
    " default 'longest' can not work with neocomplete
    let g:clang_c_completeopt = 'menuone,longest'
    let g:clang_cpp_completeopt = 'menuone,longest'
    let g:clang_dotfile = '.vimmic_config'

    " Shortcut
    """"""""""
    " Ctrl-x-o (omni) or Ctrl-x-x (vimmic redefined omni) call this completion
    autocmd FileType c,cpp nmap <leader>sq :ClangCheck<cr>

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
