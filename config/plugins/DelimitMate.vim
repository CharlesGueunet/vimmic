" Raimondi/delimitMate
"  insert mode auto-completion for quotes, parens, brackets, etc.

" Settings
""""""""""

" In XML. we don't want delimitMate to match <,> because
" the xml_autoclose deal with it.
" For other langages, < can be "less than"
let delimitMate_matchpairs = "(:),[:],{:}"
" For filetype confg :
"au FileType c*,perl let b:delimitMate_matchpairs = "(:),[:],{:}"

" when we have (|) and press space we want ( | )
"let delimitMate_expand_space = 1

" try to balance matchpair
let delimitMate_balance_matchpairs = 1

" Shortcut
""""""""""
" Go out of current delimitation (), [], {}...
imap <c-a> <Plug>delimitMateS-Tab

" Theme
"""""""
