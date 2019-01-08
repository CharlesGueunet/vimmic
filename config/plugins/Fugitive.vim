" w0rp/ale
" Asynchronous Lint Engine: error / warning check

let s:pluginName='ale'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " None

    " Shortcut
    """"""""""
    " None

    " Theme
    """""""
    " None

    " GUI
    set statusline+=%{FugitiveStatusline()}


else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
