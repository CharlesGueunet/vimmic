" justmao945/vim-clang
" C / C++ clever completion (can aslo report error but -> syntastic)

let s:pluginName='vim-mucomplete'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:mucomplete#no_mappings            = 1
    let g:mucomplete#auto_select            = 0
    let g:mucomplete#always_use_completeopt = 1
    if exists('g:Vimmic_AlwaysComplete')
       let g:mucomplete#enable_auto_at_startup = 1
       let g:mucomplete#trigger_auto_pattern   = { 'default' : '\k\k\k\k$' }
       let g:mucomplete#delayed_completion     = 100
    else
       let g:mucomplete#enable_auto_at_startup = 0
    endif

    " Shortcut
    """"""""""
    " imap <expr> <C-x><C-x> pumvisible() ? "\<plug>(MUcompleteExtendFwd)" : "\<C-x>\<C-x>"
    imap <silent> <expr> <plug>(MUcomplete) mucomplete#tab_complete(1)
    imap <C-x><C-x> <Plug>(MUcomplete)
    imap <C-@>  <Plug>(MUcomplete)
    imap <S-Tab> <Plug>(MUcompleteBwd)

    " Theme
    """""""
    " None

else
    if has('python') && g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
