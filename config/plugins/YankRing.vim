" vim-scripts/YankRing.vim
" Ring buffer for past mode

let s:pluginName='YankRing.vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:yankring_history_dir=g:Vimmic_BASE
    let g:yankring_history_file='.yankring'
    let g:yankring_paste_using_g=0

    " Shortcut
    """"""""""
    nmap ": :YRShow<CR>


    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
