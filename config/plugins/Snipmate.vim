" garbas/vim-snipmate
" replace keyword with parametrable block of code for fast typing

let s:pluginName='vim-snipmate'
silent let loaded = dein#util#_check_install(s:pluginName)
if loaded

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
    silent echom s:pluginName.' not found, try :Update'
endif
