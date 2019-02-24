" maksimr/vim-jsbeautify
" Javascript & JSON formatting

let s:pluginName='vim-jsbeautify'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " None

    " Shortcut
    """"""""""
    augroup JSFormat
        autocmd FileType javascript noremap  <buffer> <c-f> :call JsBeautify()<cr>
        autocmd FileType json       noremap  <buffer> <c-f> :call JsonBeautify()<cr>
        autocmd FileType jsx        noremap  <buffer> <c-f> :call JsxBeautify()<cr>
        autocmd FileType html       noremap  <buffer> <c-f> :call HtmlBeautify()<cr>
        autocmd FileType css        noremap  <buffer> <c-f> :call CSSBeautify()<cr>
        " Selection
        autocmd FileType javascript vnoremap <buffer> <c-f> :call RangeJsBeautify()<cr>
        autocmd FileType json       vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
        autocmd FileType jsx        vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
        autocmd FileType html       vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
        autocmd FileType css        vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
    augroup end


    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
