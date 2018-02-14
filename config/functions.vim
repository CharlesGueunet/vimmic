" This file contain some usefull function, to Update plugins, debug, fold ...

" Tools
"""""""""""""""""""""""""""""""""""""""

" Update the vim configuration
function! Update()
    call dein#clear_state() | call dein#update() | call dein#recache_runtimepath()
endfunction
command! Update call Update()

" Ask vim-clang to compile the project to debug the autocompletion
function! ClangCheck()
    let g:clang_diagsopt = 'rightbelow:6'
    ClangSyntaxCheck
endfunction
augroup vimmic_cpp_clangCheck
    autocmd FileType c,cpp command! ClangCheck call ClangCheck()
augroup END

" Clever fold all using language specific syntax
function! FoldAll()
    set foldmethod=indent
    redraw!
    set foldmethod=manual
endfunction
command! FoldAll call FoldAll()

" Trailling space removal
function! TrimSpaces() range
    " http://vim.wikia.com/wiki/Remove_unwanted_spaces
    let l:last_search=@/
    execute a:firstline.','.a:lastline.'substitute/\s\+$//e'
    let @/=l:last_search
    nohl
endfunction

" Execute macro on each line
" From: https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim?_utm_source=1-2-2
function! ExecuteMacroOverVisualRange()
    echo '@'.getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Dein plugin management

" This list allows to keep in mind which plungins have been disabled
" and so we will not ask the user to install it.
let g:Vimmic_DISABLED = []

function! DisablePlugins(filename, update_dein)
    " Need dein in this function
    " parse toml file here
    let l:toml = dein#toml#parse_file(dein#util#_expand(a:filename))
    if type(l:toml) != type({})
        call dein#util#_error('Invalid toml file: ' . a:filename)
        return 1
    endif

    let l:pattern = '.*/'

    if has_key(l:toml, 'plugins')
        for l:plugin in l:toml.plugins
            if !has_key(l:plugin, 'repo')
                call dein#util#_error('No repository plugin data: ' . a:filename)
                return 1
            endif

            let l:disable_plugin = substitute(l:plugin.repo, l:pattern, '', 'g')
            " keep a list of disabled plugins
            call insert(g:Vimmic_DISABLED,l:disable_plugin)
            if a:update_dein == 1
                " disable in dein
                call dein#disable(l:disable_plugin)
            endif
        endfor
    endif
endfunction

" Highlight
"""""""""""""""""""""""""""""""""""""""

" Highlight the current word under the cursor, except some groups
" http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
let g:no_highlight_group_for_current_word=['Statement', 'Comment', 'Type', 'PreProc']
function! s:HighlightWordUnderCursor()
    let l:syntaxgroup = synIDattr(synIDtrans(synID(line('.'), stridx(getline('.'), expand('<cword>')) + 1, 1)), 'name')

    if (index(g:no_highlight_group_for_current_word, l:syntaxgroup) == -1)
        execute printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
    else
        execute 'match IncSearch /\V\<\>/'
    endif
endfunction

if !exists('g:disable_highlightWordUnderCursor') && !exists('g:disable_defaultColors')
    augroup vimmic_highlight_word_cursor
        autocmd CursorMoved * call s:HighlightWordUnderCursor()
    augroup END
endif

