" mhinz/vim-startify
" Startup screen

if dein#util#_check_install('vim-startify') == 0

    " Settings
    """"""""""
    let g:startify_session_dir = g:Vimmic_BASE.'sessions'.g:file_sep
    let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks']
    let g:startify_list_order = [
                \ ['   Saved sessions:'],
                \ 'sessions',
                \ ['   Most recently used files:'],
                \ 'files',
                \ ['   Most recently used files in the current directory:'],
                \ 'dir',
                \ ['   Bookmarks:'],
                \ 'bookmarks',
                \ ]

    " Shortcut
    """"""""""
    " None

    " Theme
    """""""
    " None

endif
