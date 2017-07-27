" scrooloose/nerdtree
" File navigator

let s:pluginName='nerdtree'
silent let loaded = dein#util#_check_install(s:pluginName)
if loaded

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
    silent echom s:pluginName.' not found, try :Update'
endif
