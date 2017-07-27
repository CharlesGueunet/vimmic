" godlygeek/tabular
" Fast align things

let s:pluginName='tabular'
silent let loaded = dein#util#_check_install(s:pluginName)
if loaded

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
    silent echom s:pluginName.' not found, try :Update'
endif
