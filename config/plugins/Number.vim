" myusuf3/numbers.vim
" Better line numbers

let s:pluginName='numbers.vim'
silent let loaded = dein#util#_check_install(s:pluginName)
if loaded == 0

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
    silent echom s:pluginName.' not found, try :Update'
endif
