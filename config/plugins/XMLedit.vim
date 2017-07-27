" sukima/xmledit
" XML edition facilities (fold, completion...)

let s:pluginName='xmledit'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:xmledit_enable_html=1
    let g:xml_syntax_folding=1

    " Fix for this plugins to works with rainbow
    let g:xml_tag_syntax_prefixes = 'html\|xml\|dockb\|vtu\|vti\|rainbow'

    " Shortcut
    """"""""""
    " None

    " Theme
    """""""
    " None

else
    if index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
