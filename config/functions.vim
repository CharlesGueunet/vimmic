" This file contain some usefull function, to Update plugins, debug, fold ...

" Tools
"""""""""""""""""""""""""""""""""""""""

function! s:CopyFiles(targ, dest)
    if g:isWin
        execute '!copy' a:targ a:dest
    else
        execute '!cp' a:targ a:dest
    endif
endfunction

" Update help files
function! BuildHelp()
    " Copy file onto the good location for dein
    let deindoc = dein#util#_get_runtime_path().'/doc'
    for file in globpath(g:Vimmic_BASE.'doc', '*', 0, 1)
        silent call s:CopyFiles(file, deindoc)
    endfor
    redraw!
    execute 'helptags' deindoc
endfunction
command! BuildHelp call BuildHelp()

" Update the vim configuration
function! Update()
    call dein#clear_state()
    call dein#update()
    call dein#recache_runtimepath()
    call BuildHelp()
endfunction
command! Update call Update()

" Ask vim-clang to compile the project to debug the autocompletion
function! DebugVimClang()
    let g:clang_diagsopt = 'rightbelow:6'
endfunction
command! DebugVimClang call DebugVimClang()

" Clever fold all using language specific syntax
function! FoldAll()
    set foldmethod=syntax
    redraw!
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
        execute printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
    else
        execute 'match IncSearch /\V\<\>/'
    endif
endfunction

if !exists("g:disable_highlightWordUnderCursor")
    autocmd CursorMoved * call s:HighlightWordUnderCursor()
endif

" Plugins
"""""""""""""""""""""""""""""""""""""""

" for commentary, toggle the comment type (c/cpp)
let s:commentaryBlock = 0
function! ToogleCommentaryCCPP()
    if s:commentaryBlock
        setlocal commentstring=//\ %s
        let s:commentaryBlock = 0
        echo "Comment now use //"
    else
        setlocal commentstring=/*\ %s\ */
        let s:commentaryBlock = 1
        echo "Comment now use /* */"
    endif
endfunction
