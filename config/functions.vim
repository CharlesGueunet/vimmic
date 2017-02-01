" This file contain somne usefull function, to Update plugins, debug, fold ...

" Update the vim configuration
function! Update()
    call dein#update()
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
