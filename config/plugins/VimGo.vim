" fatih/vim-go
" Suit of 

let s:pluginName='vim-go'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:go_list_type = "quickfix"

    " Shortcut
    """"""""""
    execute 'autocmd FileType go map <C-f> :GoFmt<CR>'

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
