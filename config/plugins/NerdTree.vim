" scrooloose/nerdtree
" File navigator

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
