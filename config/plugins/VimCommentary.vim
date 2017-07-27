" tpope/vim-commentary
" operator to comment region / selection

let s:pluginName='vim-commentary'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " Use // comment for c/cpp in vim-commentary (instead of /* .. */)
    autocmd FileType c,cpp setlocal commentstring=//\ %s

    " Shortcut
    """"""""""
    " toogle between block and line comment in c/cpp
    autocmd FileType c,cpp map gct :call ToogleCommentaryCCPP()<CR>

    " Theme
    """""""
    " None

else
    if index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
