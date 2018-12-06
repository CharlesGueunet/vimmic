" tpope/vim-dispatch
" Asynchronous commands in quickfix / tmux pane

let s:pluginName='vim-dispatch'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " No default mapping
    let g:nremap = {"m": "", "`":"","'":"", "g":""}

    " From TPope vimrc
    augroup DispatchFT
       autocmd!
       autocmd FileType cucumber let b:dispatch = 'cucumber %' | imap <buffer><expr> <Tab> pumvisible() ? "\<C-N>" : (CucumberComplete(1,'') >= 0 ? "\<C-X>\<C-O>" : (getline('.') =~ '\S' ? ' ' : "\<C-I>"))
       autocmd FileType html setlocal iskeyword+=~ | let b:dispatch = ':OpenURL %'
       autocmd FileType java let b:dispatch = 'javac %'
       autocmd FileType perl let b:dispatch = 'perl -Wc %'
       autocmd FileType ruby
                \ let b:start = executable('pry') ? 'pry -r "%:p"' : 'irb -r "%:p"' |
                \ if expand('%') =~# '_test\.rb$' |
                \   let b:dispatch = 'testrb %' |
                \ elseif expand('%') =~# '_spec\.rb$' |
                \   let b:dispatch = 'rspec %' |
                \ elseif !exists('b:dispatch') |
                \   let b:dispatch = 'ruby -wc %' |
                \ endif
       autocmd FileType tex let b:dispatch = 'latex -interaction=nonstopmode %' | setlocal formatoptions+=l
                \ | let b:surround_{char2nr('x')} = "\\texttt{\r}"
                \ | let b:surround_{char2nr('l')} = "\\\1identifier\1{\r}"
                \ | let b:surround_{char2nr('e')} = "\\begin{\1environment\1}\n\r\n\\end{\1\1}"
                \ | let b:surround_{char2nr('v')} = "\\verb|\r|"
                \ | let b:surround_{char2nr('V')} = "\\begin{verbatim}\n\r\n\\end{verbatim}"
       autocmd FileType vim  setlocal keywordprg=:help |
                \ if exists(':Runtime') |
                \   let b:dispatch = ':Runtime' |
                \   let b:start = ':Runtime|PP' |
                \ else |
                \   let b:dispatch = ":unlet! g:loaded_{expand('%:t:r')}|source %" |
                \ endif
       autocmd FileType timl let b:dispatch = ':w|source %' | let b:start = b:dispatch . '|TLrepl' | command! -bar -bang Console Wepl
    augroup END

    " Shortcut
    """"""""""
    command! WW up|Make
    command! WWW up|Make!
    nnoremap <leader>mm :Make<CR>
    nnoremap <leader>mM :Make!<CR>
    nnoremap <leader>mC :Make clean<CR>

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
