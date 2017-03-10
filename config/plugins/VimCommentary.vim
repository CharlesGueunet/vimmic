" tpope/vim-commentary
" operator to comment region / selection

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
