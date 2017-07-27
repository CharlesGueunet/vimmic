" terryma/vim-expand-region
" Clever selection with + / -

let s:pluginName='vim-expand-region'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    call expand_region#custom_text_objects({
                \ 'a]' :1,
                \ 'a)' :1,
                \ 'ab' :1,
                \ 'aB' :1,
                \ 'aL' :1,
                \ 'ii' :1,
                \ 'ap' :1
                \ })

    " Shortcut
    """"""""""
    " + and - in normal / visual

    " Theme
    """""""
    " None

else
    if index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
