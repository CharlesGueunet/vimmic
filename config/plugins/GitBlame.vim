" zivyangll/git-blame.vim
" Git blame current line

let s:pluginName='git-blame.vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " NONE


    " Shortcut
    """"""""""
    nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>


else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
