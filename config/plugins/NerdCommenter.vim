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
    augroup vimmic_nerd_delims
        autocmd FileType c,cpp map <leader>ct <Plug>NERDCommenterAltDelims
    augroup END
    "By default, {<leader> c <space>} to toggle comment

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
