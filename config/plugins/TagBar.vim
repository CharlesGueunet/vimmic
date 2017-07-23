" majutsushi/tagbar
" Fast travel functions, label, class...
" Need ctags, take a look at universal ctags for C++ 11 and later
" Tagbar (http://blog.stwrt.ca/2012/10/31/vim-ctags)

if dein#util#_check_install('tagbar') == 0

    " Settings
    """"""""""
    " NONE

    " Shortcut
    """"""""""
    nnoremap <silent> <Leader>b :TagbarToggle<CR>

    " Theme
    """""""
    " None

endif
