" scrooloose/syntastic
" Syntax checker for C/CPP and other languages

let s:pluginName='syntastic'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:syntastic_always_populate_loc_list = 1  " allows to travel btwn errors
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
    let g:syntastic_cpp_config_file='.vimmic_config'
    let g:syntastic_c_config_file='.vimmic_config'

    " python : error checking is done by other tools
    let g:syntastic_python_checkers = []

    " go
    let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'gometalinter']
    let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']

    " Prefere zsh over bash if installed
    if !exists("g:syntastic_shell") && !g:isWin
        if filereadable("/bin/zsh")
            let g:syntastic_shell = '/bin/zsh'
        else
            let g:syntastic_shell = '/bin/bash'
        endif
    endif

    " Important note : if you want to work on c++>11, it is recommanded to create
    " a $HOME/.vimmic_config containing the configuration of clang / gcc for
    " syntastic. Mine contains "-std=c++14"
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    " Shortcut
    """"""""""
    " Toogle
    map <F4> :SyntasticToggleMode<cr>
    map <leader>st :SyntasticToggleMode<cr>

    " Silent check and error summary
    map <leader>sc :SyntasticCheck<CR>
    " Show the window
    map <leader>se :Errors<CR>

    " Theme
    """""""
    " None

else
    if index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
