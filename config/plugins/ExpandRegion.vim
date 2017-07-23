" terryma/vim-expand-region
" Clever selection with + / -

let s:pluginName='vim-expand-region'
if dein#util#_check_install(s:pluginName) == 0

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
    echom s:pluginName.' not found, try :Update'
endif
