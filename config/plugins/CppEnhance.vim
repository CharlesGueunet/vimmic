" octol/vim-cpp-enhanced-highlight
" Improve c++ coloration

let s:pluginName='vim-cpp-enhanced-highlight'
if dein#util#_check_install(s:pluginName) == 0

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
    echom s:pluginName.' not found, try :Update'
endif
