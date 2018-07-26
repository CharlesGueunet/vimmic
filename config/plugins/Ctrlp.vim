" ctrlpvim/ctrlp.vim
" Visualize vim undo-tree to easily recover past states

let s:pluginName='ctrlp.vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:ctrlp_switch_buffer = 0         " don't jump to window
    let g:ctrlp_map = ""                  " deactivate ctrl-p shortcut, conflict with yankring
    let g:ctrlp_bufpath_mod = 0

    " Shortcut
    """"""""""
    nnoremap <leader>bf :CtrlP<CR>
    nnoremap <leader>bb :CtrlPBuffer<CR>
    nnoremap <leader>bm :CtrlPMixed<CR>
    nnoremap <leader>bl :CtrlPLine<CR>
    nnoremap <leader>bt :CtrlPBufTag<CR>
    nnoremap <leader>bq :CtrlPQuickfix<CR>

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
