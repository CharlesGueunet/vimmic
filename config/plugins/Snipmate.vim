" garbas/vim-snipmate
" replace keyword with parametrable block of code for fast typing

let s:pluginName='vim-snipmate'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:snipMate = { 'override' : 1 }        " in case of extended snipate, choose last automatically
    let g:snipMate.snippet_version=1

    " Shortcut
    """"""""""
    " None

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
