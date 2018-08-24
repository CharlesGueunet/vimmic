" andymass/vim-matchup
" even better % navigate and highlight matching words modern matchit and matchparen replacement

let s:pluginName='vim-matchup'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:matchup_override_vimtex = 1

    " Shortcut
    """"""""""
    " None

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
