" scrooloose/nerdtree
" File navigator

let s:pluginName='nerdtree'
if dein#util#_check_install(s:pluginName) == 0

    " Settings
    """"""""""
    let g:NERDTreeDirArrows=0
    " leave if only nerdTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") ) | q | endif

    " Shortcut
    """"""""""
    map <leader>n :NERDTreeToggle<cr>
    map <leader>f :NERDTreeFind<cr>

    " Theme
    """""""
    " None

else
    echom s:pluginName.' not found, try :Update'
endif
