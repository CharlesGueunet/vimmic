" myusuf3/numbers.vim
" Better line numbers

let s:pluginName='numbers.vim'
if dein#util#_check_install(s:pluginName) == 0

    " Settings
    """"""""""
    let g:numbers_exclude = ['undotree', 'tagbar', 'startify', 'nerdtree']

    " Shortcut
    """"""""""
    " None

    " Theme
    """""""
    " None

else
    echom s:pluginName.' not found, try :Update'
endif
