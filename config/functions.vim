" This file contain somne usefull function, to Update plugins, debug, fold ...

" Update the vim configuration
function! Update()
    call dein#clear_state()
    call dein#update()
    call dein#recache_runtimepath()
endfunc
command! Update call Update()

" Ask vim-clang to compile the project to debug the autocompletion
function! DebugVimClang()
    let g:clang_diagsopt = 'rightbelow:6'
endfunction
command! DebugVimClang call DebugVimClang()

" Clever fold all using language specific syntax
function! FoldAll()
    set foldmethod=syntax
    redraw
    sleep 100m
    set foldmethod=manual
endfunction
command! FoldAll call FoldAll()


" Highlight
"""""""""""""""""""""""""""""""""""""""

" Highlight the current word under the cursor, except some groups
" http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
let g:no_highlight_group_for_current_word=["Statement", "Comment", "Type", "PreProc"]
function! s:HighlightWordUnderCursor()
    let l:syntaxgroup = synIDattr(synIDtrans(synID(line("."), stridx(getline("."), expand('<cword>')) + 1, 1)), "name")

    if (index(g:no_highlight_group_for_current_word, l:syntaxgroup) == -1)
        exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
    else
        exe 'match IncSearch /\V\<\>/'
    endif
endfunction

if !exists("g:disable_highlightWordUnderCursor")
    autocmd CursorMoved * call s:HighlightWordUnderCursor()
endif
