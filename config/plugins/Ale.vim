" corntrace/bufexplorer
" Fast travel opened buffers

let s:pluginName='ale'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    autocmd FileType c,cpp let g:ale_cpp_clang_options = Filify#process(".vimmic_config")
    autocmd FileType c,cpp let g:ale_cpp_clangcheck_options = g:ale_cpp_clang_options
    let g:ale_completion_enabled = 1

    let g:ale_statusline_format = ["| %d errors", "| %d warnings", ""]

    " Shortcut
    """"""""""
    " TODO

    " Theme
    """""""
    " None

    " GUI
    set statusline+=%{ALEGetStatusLine()}

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
