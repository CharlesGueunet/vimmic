" osyo-manga/vim-over
" Search and replace with preview

let s:pluginName='vim-over'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " Nonde

    " Shortcut
    """"""""""
    " Replace word under cursor in line
    nnoremap <Leader>pr :OverCommandLine<CR>%s/\<<C-r><C-w>\>//g<Left><Left>
    nnoremap <Leader>ps :OverCommandLine<CR>%s///g<Left><Left><Left>
    " in visual mode, mapping a simple letter can conflict with snippets
    vnoremap <C-r> <Esc>:OverCommandLine<CR>'<,'>s/

    " Theme
    """""""
    " None

else
    if index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
