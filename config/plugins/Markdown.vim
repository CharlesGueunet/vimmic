" plasticboy/vim-markdown
" Markdown coloration

let s:pluginName='vim-markdown'
if dein#util#_check_install(s:pluginName) == 0

    " Settings
    """"""""""
    let g:vim_markdown_folding_disabled = 1

    " Shortcut
    """"""""""
    " None

    " Theme
    """""""
    " None

else
    echom s:pluginName.' not found, try :Update'
endif
