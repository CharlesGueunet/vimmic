" tpope/vim-commentary
" operator to comment region / selection

let s:pluginName='vim-commentary'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " Use // comment for c/cpp in vim-commentary (instead of /* .. */)
    augroup vimmic_commentary_settings
       autocmd FileType c,cpp setlocal commentstring=//\ %s
       autocmd FileType cmake,gnuplot,diff setlocal commentstring=#\ %s
    augroup END

    " Shortcut
    """"""""""
    " toogle between block and line comment in c/cpp
    augroup vimmic_commentary_shortcuts
       autocmd FileType c,cpp map gct :call ToogleCommentaryCCPP()<CR>
    augroup END

    " Theme
    """""""
    " None

    " Function
    let s:commentaryBlock = 0
    function! ToogleCommentaryCCPP()
       if s:commentaryBlock
          setlocal commentstring=//\ %s
          let s:commentaryBlock = 0
          echo 'Comment now use //'
       else
          setlocal commentstring=/*\ %s\ */
          let s:commentaryBlock = 1
          echo 'Comment now use /* */'
       endif
    endfunction

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
