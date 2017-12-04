" corntrace/bufexplorer
" Fast travel opened buffers

let s:pluginName='ale'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:ale_completion_enabled = 1
    let g:ale_statusline_format = ['| %d errors', '| %d warnings', '']

    augroup vimmic_c_ale_config
        autocmd FileType c let g:ale_linters         = {'c':['clang', 'cpplint', 'gcc']}
        autocmd FileType c let g:vimmic_c_options    = Filify#process('.vimmic_config', {'default_return':'-std=c11 -Wall'})
        autocmd FileType c let g:ale_c_clang_options = g:vimmic_c_options
        autocmd FileType c let g:ale_c_gcc_options   = g:vimmic_c_options
    augroup END

    augroup vimmic_cpp_ale_config
        " clang-check need compile_command.json to work on header files
        autocmd FileType cpp let g:ale_linters           = {'cpp':['clang', 'cppcheck', 'cpplint', 'g++']}
        autocmd FileType cpp let g:vimmic_cpp_options    = Filify#process('.vimmic_config', {'default_return':'-std=c++14 -Wall'})
        autocmd FileType cpp let g:ale_cpp_clang_options = g:vimmic_cpp_options
        autocmd FileType cpp let g:ale_cpp_gcc_options   = g:vimmic_cpp_options
    augroup END

    " Shortcut
    """"""""""
    map <leader>st :ALEToggle<CR>
    map <F4> :ALEToggle<CR>
    map <leader>sc :ALELint<CR>
    map <leader>se :lopen<CR>

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
