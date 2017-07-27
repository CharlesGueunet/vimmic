" ctrlpvim/ctrlp.vim
" Visualize vim undo-tree to easily recover past states

let s:pluginName='ctrlp.vim'
silent let loaded = dein#util#_check_install(s:pluginName)
if loaded

    " Settings
    """"""""""
    " None

    " Shortcut
    """"""""""
    nnoremap <leader>bf :CtrlP<CR>
    nnoremap <leader>bb :CtrlPBuffer<CR>
    nnoremap <leader>bm :CtrlPMixed<CR>
    nnoremap <leader>bl :CtrlPLine<CR>
    nnoremap <leader>bt :CtrlPBufTag<CR>

    " Theme
    """""""
    " None

else
    silent echom s:pluginName.' not found, try :Update'
endif
