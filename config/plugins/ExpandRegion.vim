" terryma/vim-expand-region
" Clever selection with + / -

" Settings
""""""""""
call expand_region#custom_text_objects({
\ 'a]' :1,
\ 'a)' :1,
\ 'ab' :1,
\ 'aB' :1,
\ 'ii' :1,
\ 'ap' :1
\ })

" Shortcut
""""""""""
" + and - in normal / visual

" Theme
"""""""
" None
