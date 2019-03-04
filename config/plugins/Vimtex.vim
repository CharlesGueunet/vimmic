" lervag/vimtex
" Tools for latex editing

let s:pluginName='vimtex'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:vimtex_quickfix_mode=0

    " Shortcut
    """"""""""
    nnoremap <leader>ml :VimtexCompile<CR>

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
