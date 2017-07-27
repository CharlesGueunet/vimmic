" octol/vim-cpp-enhanced-highlight
" Improve c++ coloration

let s:pluginName='vim-cpp-enhanced-highlight'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:cpp_class_scope_highlight = 1
    let g:cpp_experimental_template_highlight = 1

    " Shortcut
    """"""""""
    " None

    " Theme
    """""""
    " None

else
    if index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
