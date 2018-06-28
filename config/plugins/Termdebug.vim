" packadd Termdebug
" This is a special plugin not managed by dein:
" This is a native vim plugin to add with packadd termdebug

silent let s:loaded = exists(":Run")
if s:loaded == 0

    " Settings
    """"""""""
    " Vertical termdebug (help termdebug_wide)
    let g:termdebug_wide=163

    " Shortcut
    """"""""""
    " cgdb like
    nnoremap <F5> :Run<CR>
    nnoremap <F6> :Continue<CR>
    nnoremap <F7> :Finish<CR>
    nnoremap <F8> :Over<CR>
    nnoremap <F10> :Step<CR>

    nnoremap <leader>dr :Run<CR>
    nnoremap <leader>dc :Continue<CR>
    nnoremap <leader>ds :Step<CR>
    nnoremap <leader>dn :Over<CR>
    nnoremap <leader>df :Finish<CR>
    nnoremap <leader>db :Break<CR>
    nnoremap <leader>dd :Clear<CR>


    " Theme
    """""""
    " change the >> sign
    autocmd BufEnter * sign define debugBreakpoint text=<> texthl=debugBreakpoint
endif
