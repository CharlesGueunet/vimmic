" scrooloose/nerdtree
" File navigator

let s:pluginName='nerdtree'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:NERDTreeDirArrows=0
    " leave if only nerdTree
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") ) | q | endif

    " Shortcut
    """"""""""
    map <leader>nt :NERDTreeToggle<cr>
    map <leader>nf :NERDTreeFind<cr>

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
