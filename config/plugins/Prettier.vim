" prettier/vim-prettier
" Clever format for javascript

let s:pluginName='vim-prettier'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " let g:prettier#exec_cmd_async = 1
    let g:prettier#quickfix_auto_focus = 0

    " Shortcut
    """"""""""
    augroup PrettierFormat
        autocmd FileType javascript nmap <c-f> <Plug>(Prettier)
        autocmd FileType json       nmap <c-f> <Plug>(Prettier)
        autocmd FileType css        nmap <c-f> <Plug>(Prettier)
        autocmd FileType scss       nmap <c-f> <Plug>(Prettier)
        autocmd FileType html       nmap <c-f> <Plug>(Prettier)
        autocmd FileType typescript nmap <c-f> <Plug>(Prettier)

        autocmd FileType javascript imap <c-f> <esc>:Prettier<CR>i
        autocmd FileType json       imap <c-f> <esc>:Prettier<CR>i
        autocmd FileType css        imap <c-f> <esc>:Prettier<CR>i
        autocmd FileType scss       imap <c-f> <esc>:Prettier<CR>i
        autocmd FileType html       imap <c-f> <esc>:Prettier<CR>i
        autocmd FileType typescript imap <c-f> <esc>:Prettier<CR>i

        autocmd FileType javascript vmap <c-f> :Prettier<CR>
        autocmd FileType json       vmap <c-f> :Prettier<CR>
        autocmd FileType css        vmap <c-f> :Prettier<CR>
        autocmd FileType scss       vmap <c-f> :Prettier<CR>
        autocmd FileType html       vmap <c-f> :Prettier<CR>
        autocmd FileType typescript vmap <c-f> :Prettier<CR>
    augroup end

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && executable('npm') && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
