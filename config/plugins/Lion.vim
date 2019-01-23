" tommcdo/vim-lion
" align operator using ga + the symbol to use

let s:pluginName='vim-lion'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:lion_squeeze_spaces=1
    let g:lion_map_right='ga'
    let g:lion_map_left ='gA'

    " Shortcut
    """"""""""
    nmap <leader>a: gaip:
    nmap <leader>a& gaip&
    nmap <leader>a. gaip.
    nmap <leader>a, gaip,
    nmap <leader>a= gaip=

    " Theme
    """""""
    " None

    " GUI
    """""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
