" Raimondi/delimitMate
"  insert mode auto-completion for quotes, parens, brackets, etc.

let s:pluginName='delimitMate'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " In XML. we don't want delimitMate to match <,> because
    " the xml_autoclose deal with it.
    " For other langages, < can be "less than"
    let g:delimitMate_matchpairs = '(:),[:],{:}'
    " For filetype confg :
    "au FileType c*,perl let b:delimitMate_matchpairs = "(:),[:],{:}"

    " when we have (|) and press space we want ( | )
    "let delimitMate_expand_space = 1

    " try to balance matchpair
    let g:delimitMate_balance_matchpairs = 1

    " Shortcut
    """"""""""
    " Go out of current delimitation (), [], {}...
    imap <c-a> <Plug>delimitMateS-Tab

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
