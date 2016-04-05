" pathogen
execute pathogen#infect()
syntax on

set nocompatible
filetype plugin indent on

" leader key
let mapleader = ','

" LOOK AND COLORS
" =====================================================================================================================

" line numbers
set number

" do not underline current bar
set cursorline

" colorscheme (For indent guide)
" Other highlighting are at the end in a function
colorscheme delek

" http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" highlight unwanted(trailing) whitespace
" + have this highlighting not appear whilst you are typing in insert mode
" + have the highlighting of whitespace apply when you open new buffers
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=darkgray guibg=darkgray
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgray guibg=darkgray
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

" No ugly vert separator
set fillchars+=vert:.


" BEHAVIOUR
" =====================================================================================================================

" For qwerty it is easier tu use ; than :
map ; :

" searching
set ignorecase smartcase incsearch hlsearch

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

" Option to make clean session with mksession (usefull when changing vimrc)
set ssop=buffers,curdir,options,tabpages,winsize

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Remap VIM 0 to first non-blank character
map 0 ^

" pastetoggle http://stackoverflow.com/questions/2861627/paste-in-insert-mode
" set paste
set pastetoggle=<F2>

" When the page starts to scroll, keep the cursor 8 lines from the top and 8 lines from the bottom
set scrolloff=8

" Use mouse when using vim
set mouse=a "tips, maj during selection to use ctrl-maj-c to copy text

" ctrl space to complete
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
inoremap <C-Space> <C-n>
inoremap <Nul> <C-n>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Tab
map <leader>t :tabnew<CR>
map <leader>v :vs<CR>
map <leader>h :split<CR>
map <leader>> :tabn<CR>
map <leader>< :tabp<CR>

" Buffers - explore/next/previous: leader-u, Alt-F12, leader-p
map <leader><Up> :BufExplorer<CR>
map <leader><Down> :ls<CR>
map <leader><Right> :bn<CR>
map <leader><Left> :bp<CR>

" ZoomWin
nmap <leader>o <c-w>o

" keep buffer
set hidden

" keep folding GRAPHICAL GLITCH on changing buffer
"au BufWinLeave *.* mkview!
"au BufWinEnter *.* silent loadview
"set viewoptions-=options

" folding
map <leader>- [{zf%<CR>
map <leader>i :set foldmethod=indent<CR>

"clipboard for pasting
map <leader>p :reg<CR>


" remove whitespace http://vim.wikia.com/wiki/Remove_unwanted_spaces
" called by leader-m
nnoremap <silent> <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" indentation : got to opening bracket and indent
"nmap <leader>ip [{=%

" Replace word under cursor in line
nnoremap <Leader>r :OverCommandLine<CR>%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>s :OverCommandLine<CR>%s///g<Left><Left><Left>

" hide highlight on search with <leader><space>
nnoremap <leader><space> :noh<cr>

" Complete XML code
let g:xml_syntax_folding=1
au FileType xml  setlocal foldmethod=syntax
au FileType html setlocal foldmethod=syntax
au FileType vtu  setlocal foldmethod=syntax

" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ execute 'normal! g`"zvzz' |
                \ endif
augroup END

" PLUGINS CONF
" =====================================================================================================================

" Bookmaks
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=19
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

" BufExplorer
let g:bufExplorerShowDirectories=1   " Show directories.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='name'       " Sort by the buffer's name.
let g:bufExplorerFindActive=1        " Go to active window.

" Startify
let g:startify_session_dir = '~/.vim/sessions/'
let g:startify_list_order = ['sessions', 'files', 'dir', 'bookmarks']

let g:startify_list_order = [
      \ ['   Saved sessions:'],
      \ 'sessions',
      \ ['   Most recently used files:'],
      \ 'files',
      \ ['   Most recently used files in the current directory:'],
      \ 'dir',
      \ ['   These are my bookmarks:'],
      \ 'bookmarks',
      \ ]

" Tagbar (http://blog.stwrt.ca/2012/10/31/vim-ctags)
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" Fugitive resolve
noremap <leader>ev :execute 'e ' . resolve(expand($MYVIMRC))<CR>

" Manpage for word under cursor via 'K' in command moderuntime
runtime ftplugin/man.vim
noremap <buffer> <silent> K :exe "Man" expand('<cword>') <CR>

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
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size  = 1
let g:indent_guides_color_change_percent  = 10
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=232

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 1
let g:syntastic_c_check_header  = 1
let g:syntastic_cpp_check_header  = 1

" prefere zsh over bash if installed
if filereadable("/bin/zsh")
  let g:syntastic_shell = '/bin/zsh'
else
  let g:syntastic_shell = '/bin/bash'
endif
" silent check
map <leader>c :SyntasticCheck<CR>
" open windows
map <leader>e :Errors<CR>

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
" ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f cpp cpp_src
set tags+=~/.vim/tags/cpp
set tags+=~/.vim/tags/vtk
" build tags of your own project
map <leader>z :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch     = 1
let OmniCpp_GlobalScopeSearch   = 1
let OmniCpp_ShowAccess          = 1
let OmniCpp_DisplayMode         = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_SelectFirstItem     = 1
let OmniCpp_MayCompleteDot      = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow    = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope    = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces   = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest
"set completeopt=menuone,menu,longest,preview

" Note for author : protodef is a plugin that allow creating function in cpp
" form protoype in header

" Autoclose XML tags
" filenames like *.xml, *.html, *.xhtml, ...
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.vti,*.vtu"

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

" Tabularize ( align assignation ...)
nmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>

map <C-d> :pyf ~/.vim/clang-format.py<cr>
imap <C-d> <c-o>:pyf ~/.vim/clang-format.py<cr>

"  UGLY FIX FOR SYNTAX HIGHLIGHT (cause of this, changing colorscheme is  broken)
" =====================================================================================================================

" colorcolumn / print margin
function s:SetMargin()
  " zone post 120 cols change color
  let &colorcolumn=join(range(120,999),",")
  highlight ColorColumn cterm=NONE ctermbg=233
  " current line
  highlight CursorLine  cterm=NONE ctermbg=233
  " git / bookmar vertical line
  highlight SignColumn  ctermbg=black
  " fold zone
  highlight Folded      ctermbg=233
  " search and word under cursor
  highlight Search ctermfg=Yellow ctermbg=NONE cterm=bold,underline
  highlight IncSearch ctermfg=Green ctermbg=NONE cterm=bold
  "split separators
  highlight VertSplit    ctermfg=233 ctermbg=235
  " Omni cpp
  highlight Pmenu        cterm=none ctermfg=White     ctermbg=233
  highlight PmenuSel     cterm=none ctermfg=Black     ctermbg=DarkGreen
  highlight PmenuSbar    cterm=none ctermfg=none      ctermbg=Green
  highlight PmenuThumb   cterm=none ctermfg=DarkGreen ctermbg=DarkGreen
endfunction

autocmd VimEnter * call s:SetMargin()

" USER DEFINED CONFIG
" =====================================================================================================================

if filereadable(expand("\~/.vimrc.local"))
  source \~/.vimrc.local
endif

