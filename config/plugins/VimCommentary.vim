" tpope/vim-commentary
" operator to comment region / selection

if dein#util#_check_install('vim-commentary') == 0

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

endif
