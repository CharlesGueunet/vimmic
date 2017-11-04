" majutsushi/tagbar
" Fast travel functions, label, class...
" Need ctags, take a look at universal ctags for C++ 11 and later
" Tagbar (http://blog.stwrt.ca/2012/10/31/vim-ctags)

let s:pluginName='tagbar'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

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
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
