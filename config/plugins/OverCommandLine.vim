" osyo-manga/vim-over
" Search and replace with preview

if dein#util#_check_install('vim-over') == 0

    " Settings
    """"""""""
    " Nonde

    " Shortcut
    """"""""""
    " Replace word under cursor in line
    nnoremap <Leader>r :OverCommandLine<CR>%s/\<<C-r><C-w>\>//g<Left><Left>
    nnoremap <Leader>s :OverCommandLine<CR>%s///g<Left><Left><Left>
    " in visual mode, mapping a simple letter can conflict with snippets
    vnoremap <C-r> <Esc>:OverCommandLine<CR>'<,'>s/

    " Theme
    """""""
    " None

endif
