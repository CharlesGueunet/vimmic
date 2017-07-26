" ctrlpvim/ctrlp.vim
" Visualize vim undo-tree to easily recover past states

let s:pluginName='ctrlp.vim'
if dein#util#_check_install(s:pluginName) == 0

    " Settings
    """"""""""
    " None

    " Shortcut
    """"""""""
    nnoremap <leader>bf :CtrlP<CR>
    nnoremap <leader>bb :CtrlPBuffer<CR>
    nnoremap <leader>bm :CtrlPMixed<CR>
    nnoremap <leader>bl :CtrlPLine<CR>

    " Theme
    """""""
    " None

else
    echom s:pluginName.' not found, try :Update'
endif
