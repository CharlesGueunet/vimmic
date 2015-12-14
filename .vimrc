" set shell=/bin/sh

" pathogen
execute pathogen#infect()
syntax on
"filetype plugin indent on

" ctags
set tags=tags;/

" line numbers
set number
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE


" eclim
set nocompatible
filetype plugin indent on


" let g:EclimLogLevel = 10
" eclim color
hi Pmenu ctermbg=darkgray ctermfg=gray guibg=darkgray guifg=#bebebe
hi PmenuSel ctermbg=gray ctermfg=black guibg=#bebebe guifg=black
hi PmenuSbar ctermbg=gray guibg=#bebebe
hi PmenuThumb cterm=reverse gui=reverse

" colorscheme (For indent guide)
colorscheme default

" http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
:autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" highlight unwanted(trailing) whitespace
" + have this highlighting not appear whilst you are typing in insert mode
" + have the highlighting of whitespace apply when you open new buffers
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
:highlight ExtraWhitespace ctermbg=red guibg=red
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Solarized
set background=dark
let g:solarized_termcolors = 256

" Fonts
"set guifont=ubuntu
set guifont=inconsolata

" leader key
let mapleader = ','

" searching
set ignorecase smartcase incsearch hlsearch

" No ugly vert separator
set fillchars+=vert:\ 

" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changed from the outside
set autoread

"Always show current position
set ruler

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Turn backup off
"set nobackup
"set nowb
"set noswapfile
"
" Option to make clean session with mksession (usefull when changing vimrc)
set ssop=buffers,curdir,folds,options,tabpages,winsize

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Remap VIM 0 to first non-blank character
map 0 ^

" Treat long lines as break lines (useful when moving around in them)
" CONFLICT with snipmate
"map j gj
"map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

"Fugitive resolve
noremap <leader>ev :execute 'e ' . resolve(expand($MYVIMRC))<CR>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>t :tabnew<CR>
map <leader>v :vs<CR>
map <leader>h :split<CR>
map <leader><Right> :tabn<CR>
map <leader><Left> :tabp<CR>

" Format scala code
let g:scala_sort_across_groups=1
au BufEnter *.scala setl formatprg=java\ -jar\ /Users/stefanb/Exec/scalariform.jar\ -f\ -q\ +alignParameters\ +alignSingleLineCaseStatements\ +doubleIndentClassDeclaration\ +preserveDanglingCloseParenthesis\ +rewriteArrowSymbols\ +preserveSpaceBeforeArguments\ --stdin\ --stdout
nmap <leader>m :SortScalaImports<CR>gggqG<C-o><C-o><leader><w>

" Complete XML code
let g:xml_syntax_folding=1
au FileType xml  setlocal foldmethod=syntax
au FileType html setlocal foldmethod=syntax
au FileType vtu  setlocal foldmethod=syntax

" Tagbar (http://blog.stwrt.ca/2012/10/31/vim-ctags)
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" PowerBar
let g:Powerline_symbols = 'fancy'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#tabline#fnamemod = 1

" NerdTree
map <leader>n :NERDTreeToggle<cr>
map <leader>r :NERDTreeFind<cr>
let g:NERDTreeDirArrows=0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Indent Guidee
let g:indent_guides_auto_colors = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_shell = '/bin/zsh'
map <leader>c :SyntasticToggleMode<cr>

" Buffers - explore/next/previous: leader-u, Alt-F12, leader-p.
nnoremap <silent> <leader>u :BufExplorer<CR>
nnoremap <silent> <M-F12> :bn<CR>
nnoremap <silent> <leader>p :bp<CR>

" Replace word under cursor globally
nnoremap <Leader>a :%s/\<<C-r><C-w>\>/

" Replace word under cursor in line
nnoremap <Leader>s :s/\<<C-r><C-w>\>/

" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" remove whitespace http://vim.wikia.com/wiki/Remove_unwanted_spaces
" called by leader-m
:nnoremap <silent> <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" ignoring/enabling tests
nmap <leader>in :%s/it("/ignore("/<CR>
nmap <leader>it :%s/ignore(/it(/<CR>

" pastetoggle http://stackoverflow.com/questions/2861627/paste-in-insert-mode
" set paste
set pastetoggle=<F2>

" Wildmenu completion: use for file exclusions"
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls"
set wildignore+=*.aux,*.out,*.toc "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl "Compiled speolling world list"
set wildignore+=*.sw? "Vim swap files"
set wildignore+=*.DS_Store "OSX SHIT"
set wildignore+=*.luac "Lua byte code"
set wildignore+=migrations "Django migrations"
set wildignore+=*.pyc "Python Object codes"
set wildignore+=*.orig "Merge resolution files"
set wildignore+=*.class "java/scala class files"
set wildignore+=*/target/* "sbt target directory"

" Omni completion STILL ON TESTING
set omnifunc=syntaxcomplete#Complete

" Rainbow parantheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" DoxygenToolKit
let g:DoxygenToolkit_briefTag_funcName = "yes"
let g:DoxygenToolkit_briefTag_pre="\\synopsis  "
let g:DoxygenToolkit_paramTag_pre="\\param "
let g:DoxygenToolkit_returnTag="\\returns   "
let g:DoxygenToolkit_fileTag="\\file "
let g:DoxygenToolkit_licenseTag="\\lic copyleft"
let g:DoxygenToolkit_authorTag="\\author "
let g:DoxygenToolkit_dateTag="\\date "
let g:DoxygenToolkit_versionTag="\\version "
let g:DoxygenToolkit_blockTag="\\name "
let g:DoxygenToolkit_classTag="\\class "
let g:DoxygenToolkit_authorName="Charles Gueunet <charles.gueunet+feedback@gmail.com>"
map <leader>d :Dox<CR>
map <leader>a gg:DoxAuthor<CR>

" colorcolumn / print margin
 :set colorcolumn=120

" http://robots.thoughtbot.com/faster-grepping-in-vim/
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" http://stackoverflow.com/questions/16743112/open-item-from-quickfix-window-in-vertical-split
autocmd! FileType qf nnoremap <buffer> <leader><Enter> <C-w><Enter><C-w>L

" When the page starts to scroll, keep the cursor 8 lines from the top and 8 lines from the bottom
set scrolloff=8

" Use mouse when using vim
set mouse=a "tips, maj during selection to use ctrl-maj-c to copy text

" ZoomWin
nmap <leader>o <c-w>o

" Convenient ;<->:
map ; :
