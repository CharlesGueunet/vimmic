" godlygeek/tabular
" Fast align things

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
    silent echom s:pluginName.' not found, try :Update'
endif
