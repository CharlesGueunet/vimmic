" clang-format python script
" Re-indent current line / selection wrt .clang-format file
" Need the command clang format and vim with python support

" Settings
""""""""""
" None

" Shortcut
""""""""""
" Re-format the code, based on the LLVM style guide
" http://llvm.org/docs/CodingStandards.html
if(has('python'))
    execute 'autocmd FileType c,cpp map <C-F> :pyf '.g:Vimmic_BASE.'extra'.g:file_sep.'clang-format.py<CR>'
    execute 'autocmd Filetype c,cpp imap <C-F> <c-o>:pyf '.g:Vimmic_BASE.'extra'.g:file_sep.'clang-format.py<CR>'
endif


" Theme
"""""""
" None
