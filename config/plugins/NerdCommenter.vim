" scrooloose/nerdcommenter
" comment selection (filetype aware)

let s:pluginName='nerdcommenter'
silent let loaded = dein#util#_check_install(s:pluginName)
if loaded

    " Settings
    """"""""""
    " None

    " Shortcut
    """"""""""
    " Toggle between block / line commenter
    autocmd FileType c,cpp map <leader>ct <Plug>NERDCommenterAltDelims
    " By default, {<leader> c <space>} to toggle comment

    " Theme
    """""""
    " None

else
    silent echom s:pluginName.' not found, try :Update'
endif
