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

    " Command
    if exists(':CMake')
       command! CMakeDebug let g:cmake_build_type="Debug" | let g:cmake_build_target="install" | CMake
       command! CMakeRelease let g:cmake_build_type="Release" | let g:cmake_build_target="install" | CMake
    endif

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
