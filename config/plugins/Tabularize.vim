" godlygeek/tabular
" Fast align things

let s:pluginName='tabular'
if dein#util#_check_install(s:pluginName) == 0

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
    echom s:pluginName.' not found, try :Update'
endif
