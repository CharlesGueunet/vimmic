" MattesGroeger/vim-bookmarks
" Mark lines and save annotations on it

let s:pluginName='vim-bookmarks'
if dein#util#_check_install(s:pluginName) == 0

    " Settings
    """"""""""
    let g:bookmark_sign = '♥'
    let g:bookmark_highlight_lines = 1

    " Shortcut
    """"""""""
    let g:bookmark_no_default_key_mappings = 1
    nmap <Leader>mm :BookmarkToggle<CR>
    nmap <Leader>mi :BookmarkAnnotate<CR>
    nmap <Leader>ma :BookmarkShowAll<CR>
    nmap <Leader>mj :BookmarkNext<CR>
    nmap <Leader>mk :BookmarkPrev<CR>
    nmap <Leader>mc :BookmarkClear<CR>
    nmap <Leader>mx :BookmarkClearAll<CR>
    nmap <Leader>mkk :BookmarkMoveUp<CR>
    nmap <Leader>mjj :BookmarkMoveDown<CR>

    " Theme
    """""""
    function! s:BookmarksColors()
        highlight BookmarkSign ctermfg=160
        highlight BookmarkLine ctermbg=233
        highlight BookmarkAnnotationLine ctermbg=234
    endfunction

    if !exists("g:disable_defaultColors")
        autocmd VimEnter * call s:BookmarksColors()
    endif

else
    echom s:pluginName.' not found, try :Update'
endif
