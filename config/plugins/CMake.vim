" cmake4vim
" CMake intergration in vim (use dispatch if present)

let s:pluginName='cmake4vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:cmake_reload_after_save=0

    " Shortcut
    """"""""""

    " Command CMake and Save to set install target
    nnoremap <leader>mi :let g:cmake_build_target="install"<CR>
    nnoremap <leader>mI :let g:cmake_build_target="build"<CR>
    nnoremap <leader>mc :CMake<CR>

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
