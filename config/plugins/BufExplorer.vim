" corntrace/bufexplorer
" Fast travel opened buffers

if dein#util#_check_install('bufexplorer') == 0

    " Settings
    """"""""""
    let g:bufExplorerShowDirectories=1   " Show directories.
    let g:bufExplorerShowRelativePath=1  " Show relative paths.
    let g:bufExplorerSortBy='name'       " Sort by the buffer's name.
    let g:bufExplorerFindActive=1        " Go to active window.

    " Shortcut
    """"""""""
    map <leader><Up> :BufExplorer<CR>

    " Theme
    """""""
    " None

endif
