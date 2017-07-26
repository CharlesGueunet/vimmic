" majutsushi/tagbar
" Fast travel functions, label, class...
" Need ctags, take a look at universal ctags for C++ 11 and later
" Tagbar (http://blog.stwrt.ca/2012/10/31/vim-ctags)

let s:pluginName='tagbar'
if dein#util#_check_install(s:pluginName) == 0

    " Settings
    """"""""""
    " NONE

    " Shortcut
    """"""""""
    nnoremap <silent> <Leader>t :TagbarToggle<CR>

    " Theme
    """""""
    " None

else
    echom s:pluginName.' not found, try :Update'
endif
