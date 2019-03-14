" prettier/vim-prettier
" Clever format for javascript

let s:pluginName='vim-prettier'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:prettier#exec_cmd_async = 1

    " Shortcut
    """"""""""
    augroup PrettierFormat
        autocmd FileType javascript nnoremap <c-f> <Plug>(Prettier)
        autocmd FileType json       nnoremap <c-f> <Plug>(Prettier)
        autocmd FileType css        nnoremap <c-f> <Plug>(Prettier)
        autocmd FileType scss       nnoremap <c-f> <Plug>(Prettier)
        autocmd FileType html       nnoremap <c-f> <Plug>(Prettier)
        autocmd FileType typescript nnoremap <c-f> <Plug>(Prettier)

        autocmd FileType javascript vnoremap <c-f> <Plug>(Prettier)
        autocmd FileType json       vnoremap <c-f> <Plug>(Prettier)
        autocmd FileType css        vnoremap <c-f> <Plug>(Prettier)
        autocmd FileType scss       vnoremap <c-f> <Plug>(Prettier)
        autocmd FileType html       vnoremap <c-f> <Plug>(Prettier)
        autocmd FileType typescript vnoremap <c-f> <Plug>(Prettier)
    augroup end

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
