" t9md/vim-choosewin
" Move between windows easily

let s:pluginName='vim-choosewin'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Setting
    """"""""""
    " if you want to use overlay feature
    let g:choosewin_overlay_enable = 1
    let g:choosewin_label = 'FJDKSLA:'

    " Shortcut
    """"""""""
    nmap <Leader>ww :ChooseWin<CR>
    nmap <Leader>ws :ChooseWinSwap<CR>

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
