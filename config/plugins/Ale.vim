" w0rp/ale
" Asynchronous Lint Engine: error / warning check

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
        autocmd FileType cpp let g:ale_linters           = {'cpp':['clang', 'clang-tidy', 'cppcheck', 'cpplint', 'g++']}
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
    function! LinterStatusWarn() abort
       let l:counts = ale#statusline#Count(bufnr(''))
       let l:all_errors = l:counts.error + l:counts.style_error
       let l:all_non_errors = l:counts.total - l:all_errors

       if l:all_non_errors != 0
          return printf('%d Warn ', l:all_non_errors)
       endif

       return ''
    endfunction

    function! LinterStatusErr() abort
       let l:counts = ale#statusline#Count(bufnr(''))
       let l:all_errors = l:counts.error + l:counts.style_error

       if l:all_errors != 0
          return printf('%d Err ', l:all_errors)
       endif

       return ''
    endfunction

    function! InsertStatuslineALEColor()
       if &termguicolors
          execute 'highlight StatusLineWarn guifg=#ff6600 cterm=bold guibg='.g:StatusBG
          execute 'highlight StatusLineErr  guifg=#cc0000 cterm=bold guibg='.g:StatusBG
       else
          execute 'highlight StatusLineWarn ctermfg=DarkYellow cterm=bold ctermbg='.g:StatusBG
          execute 'highlight StatusLineErr  ctermfg=Red    cterm=bold ctermbg='.g:StatusBG
       endif
    endfunction

    augroup vimmic_ale_status_color
       autocmd VimEnter  * call InsertStatuslineALEColor()
    augroup END

    set statusline+=%#StatusLineWarn#
    set statusline+=%{LinterStatusWarn()}
    set statusline+=%*

    set statusline+=%#StatusLineErr#
    set statusline+=%{LinterStatusErr()}
    set statusline+=%*

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
