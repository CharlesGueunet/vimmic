" tpope/vim-dispatch
" Asynchronous commands in quickfix / tmux pane

let s:pluginName='vim-dispatch'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " No default mapping
    let g:nremap = {"m": "", "`":"","'":"", "g":""}

    " Shortcut
    """"""""""
    command! WW up|Make
    command! WWW up|Make!

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
