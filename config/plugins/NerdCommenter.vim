" scrooloose/nerdcommenter
" comment selection (filetype aware)

if dein#util#_check_install('nerdcommenter') == 0

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

endif
