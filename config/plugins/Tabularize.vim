" godlygeek/tabular
" align command: Tabularize

let s:pluginName='tabular'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " None

    " Shortcut
    """"""""""
    " fast align wrt = or : with leader a {:,=}
    nmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    nmap <Leader>a& :Tabularize /&<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a. :Tabularize /\.<CR>

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
