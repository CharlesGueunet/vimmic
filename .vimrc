" pathogen
execute pathogen#infect()
syntax on
"filetype plugin indent on

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
colorscheme delek

" http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
:autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))


" highlight unwanted(trailing) whitespace
" + have this highlighting not appear whilst you are typing in insert mode
" + have the highlighting of whitespace apply when you open new buffers
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
:highlight ExtraWhitespace ctermbg=darkgray guibg=darkgray
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgray guibg=darkgray
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
set fillchars+=vert:.

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

" tab
map <leader>t :tabnew<CR>
map <leader>v :vs<CR>
map <leader>h :split<CR>
map <leader>> :tabn<CR>
map <leader>< :tabp<CR>

" Buffers - explore/next/previous: leader-u, Alt-F12, leader-p.
map <leader><Up> :BufExplorer<CR>
map <leader><Down> :ls<CR>
map <leader><Right> :bn<CR>
map <leader><Left> :bp<CR>
" keep buffer
set hidden

"clipboard
map <leader>p :reg<CR>

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
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" NerdTree
map <leader>n :NERDTreeToggle<cr>
map <leader>f :NERDTreeFind<cr>
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

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 1

" Prefere zsh over bash if installed
if filereadable("/bin/zsh")
  let g:syntastic_shell = '/bin/zsh'
else
  let g:syntastic_shell = '/bin/bash'
endif

map <leader>s :SyntasticToggleMode<cr>


" Replace word under cursor in line
nnoremap <Leader>r :s/\<<C-r><C-w>\>/

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

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/vtk
" build tags of your own project
map <leader>z :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" Rainbow parentheses
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle"
let g:rainbow_conf = {
      \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \   'operators': '_,\|;\|==\|!=\|>=\|<=\|=\|->\|\.\|+\|-\|*\|&\|||\|>\|<\|!_',
      \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \   'separately': {
      \       '*': {},
      \       'tex': {
      \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
      \       },
      \       'lisp': {
      \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
      \       },
      \       'vim': {
      \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
      \       },
      \       'html': {
      \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \       },
      \       'css': 0,
      \   }
      \}

" langage color
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

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

" colorcolumn / print margin
function s:SetMargin()
  let &colorcolumn=join(range(120,999),",")
  :hi ColorColumn cterm=NONE ctermbg=233
endfunction

autocmd VimEnter * call s:SetMargin()

if filereadable("$HOME/.vimrc.local")
  source $HOME/.vimrc.local
endif

