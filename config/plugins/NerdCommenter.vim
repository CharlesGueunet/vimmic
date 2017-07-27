" scrooloose/nerdcommenter
" comment selection (filetype aware)

let s:pluginName='nerdcommenter'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

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
    if index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
