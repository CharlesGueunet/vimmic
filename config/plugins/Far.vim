" brooth/far.vim
" Search and replace with nice panes

let s:pluginName='far.vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " None

    " Shortcut
    """"""""""
    " Replace word under cursor in line
    nnoremap <Leader>p/ :F <C-r><C-w> %<CR>
    nnoremap <Leader>pf :Far <C-r><C-w> 

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
