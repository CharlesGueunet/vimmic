" scrooloose/nerdcommenter
" comment selection (filetype aware)

let s:pluginName='nerdcommenter'
if dein#util#_check_install(s:pluginName) == 0

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
    echom s:pluginName.' not found, try :Update'
endif
