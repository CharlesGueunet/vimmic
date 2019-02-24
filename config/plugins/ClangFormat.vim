" clang-format python script
" Re-indent current line / selection wrt .clang-format file
" Need the command clang format and vim with python support
" It's a script call, not a dein managed plugin

" Settings
""""""""""
" None

" Shortcut
""""""""""
" Re-format the code, based on the LLVM style guide
" http://llvm.org/docs/CodingStandards.html
if(has('python'))
    if(executable('clang-format'))
        execute 'autocmd FileType c,cpp map <buffer> <C-F> :pyf '.g:Vimmic_BASE.'extra'.g:file_sep.'clang-format.py<CR>'
        execute 'autocmd Filetype c,cpp inoremap <buffer> <C-F> <c-o>:pyf '.g:Vimmic_BASE.'extra'.g:file_sep.'clang-format.py<CR>'
    else
        execute 'autocmd FileType c,cpp map <buffer> <C-F> :echom "please, install clang-format"<CR>'
        execute 'autocmd Filetype c,cpp inoremap <buffer> <C-F> :echom "please, install clang-format"<CR>'
    endif
endif


" Theme
"""""""
" None
