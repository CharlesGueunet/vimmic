" scrooloose/syntastic
" Syntax checker for C/CPP and other languages

let s:pluginName='syntastic'
if dein#util#_check_install(s:pluginName) == 0

    " Settings
    """"""""""
    let g:syntastic_always_populate_loc_list = 0  " we don't want the error windows at startup
    let g:syntastic_auto_loc_list = 2             " close error window when done
    let g:syntastic_check_on_open = 1             " check file at startup
    let g:syntastic_check_on_wq = 0
    let g:syntastic_enable_balloons = 1           " for gvim, popup with mouse
    " c / cpp
    let g:syntastic_c_check_header  = 1           " check header file
    let g:syntastic_cpp_check_header  = 1

    let g:syntastic_cpp_compiler_options = '-std=c++11'

    " Compatible with vim-clang file:
    " Caution, buggy
    "let g:syntastic_cpp_config_file='.vimconf'
    "let g:syntastic_c_config_file='.vimconf'

    " Do not run syntastic on Python files ; we have other tools for that.
    let g:syntastic_python_checkers = []

    " Prefere zsh over bash if installed
    if !exists("g:syntastic_shell") && !g:isWin
        if filereadable("/bin/zsh")
            let g:syntastic_shell = '/bin/zsh'
        else
            let g:syntastic_shell = '/bin/bash'
        endif
    endif

    " Important note : if you want to work on c++>11, it is recommanded to create
    " a $HOME/.syntastic_cpp_check containing the configuration of clang / gcc for
    " syntastic. Mine contains "-std=c++14"
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    " Shortcut
    """"""""""
    " Toogle
    map <F4> :SyntasticToggleMode<cr>
    "
    " Silent check and error summary
    map <leader>c :SyntasticCheck<CR>
    map <leader>e :Errors<CR>

    " Theme
    """""""
    " None

else
    echom s:pluginName.' not found, try :Update'
endif
