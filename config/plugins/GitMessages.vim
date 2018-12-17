" airblade/vim-gitgutter
" Git changes indicators and diff

let s:pluginName='git-messenger.vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " NONE


    " Shortcut
    """"""""""
    nnoremap <Leader>gc :call gitmessenger#echo()<CR>


else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
