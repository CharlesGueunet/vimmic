" godlygeek/tabular
" Fast align things

if dein#util#_check_install('tabular') == 0

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

endif
