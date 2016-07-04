"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @file vimrc
" @author Charles Gueunet, Axel Martin
" @brief Vim main configuration file
" @version 0.6
" @date 04-01-2016
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pre-configuration : used to disable module of this conf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load the ~/.vimrc.prconf if exist
if filereadable(expand("\~/.vimrc.preconf"))
  source \~/.vimrc.preconf
endif

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin import                                                             {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on         " Enable syntax and auto indentation

if !exists("g:pathogenCommon")
    let g:pathogenCommon='bundle/{}'
endif
if !exists("g:pathogenCustom")
    let g:pathogenCustom='ctbundle/{}'
endif

" can't do that, FileType is loaded later...
if !exists("g:pathogenFiletype")
    " By default, load nothing
    let g:pathogenFiletype='ftbundle/Void/{}'
    " Only loads plugins for the current filetype
    autocmd FileType c,h,cpp,cxx,hpp,hxx let g:pathogenFiletype='ftbundle/C_CPP/{}'
    autocmd FileType xml,xhtml,html      let g:pathogenFiletype='ftbundle/X_HTML/{}'
    autocmd FileType python              let g:pathogenFiletype='ftbundle/Python/{}'
    autocmd FileType markdown,md         let g:pathogenFiletype='ftbundle/Markdown/{}'
    autocmd FileType latex               let g:pathogenFiletype='ftbundle/Latex/{}'
endif

let g:pathogenFiletypeAll='ftbundle/*/{}'
execute pathogen#infect(g:pathogenCommon, g:pathogenFiletypeAll, g:pathogenCustom)

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global configuration                                                      {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim behaviour
"""""""""""""""""""""""""""""""""""""""
set nocompatible                " Use all new vim functionalities
set hidden                      " Do not close the buffers, hide them
set history=1000                " Remember more commands and search history
set undolevels=1000             " Remember more levels of undo
"set timeout                     " Enable timeout on mapping and key codes
"set timeoutlen=400              " Maximum wait time for command sequence
"set ttimeoutlen=400             " Same as above
set noerrorbells                " No buzz on error
set novisualbell                " No 'visual buzz' on error
set t_vb=                       " Same as above
set autoread                    " Reload the file if changed from the outside

"autocmd BufEnter * silent! lcd %:p:h " change working directory at file opening

" Option to make clean session with mksession (usefull when changing vimrc)
set ssop=buffers,curdir,tabpages,winpos,winsize

" Turn backup off ; be careful with this !
"set nobackup
"set nowb
"set noswapfile

" Persistent undo
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
    set undolevels=1000         " How many undos
    set undoreload=10000        " number of lines to save for undo
endif


" Wildmenu completion : exclude some files
"set wildmenu
"set wildmode=list:longest
"set wildignore+=.hg,.git,.svn " Version Controls
"set wildignore+=*.aux,*.out,*.toc " Latex Indermediate files
"set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " Binary Imgs
"set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " Compiled Object files
"set wildignore+=*.spl " Compiled speolling world list
"set wildignore+=*.sw? " Vim swap files
"set wildignore+=*.DS_Store " OSX SHIT
"set wildignore+=*.luac " Lua byte code
"set wildignore+=migrations " Django migrations
"set wildignore+=*.pyc " Python Object codes
"set wildignore+=*.orig " Merge resolution files
"set wildignore+=*.class " java/scala class files
"set wildignore+=*/target/* " sbt target dires `,`. You can use space
                                       "" in your local
" Display and search configuration
"""""""""""""""""""""""""""""""""""""""
set nowrap                        " No new line when the line is too long
set showmatch                     " Show matching parenthesis
set ignorecase                    " Basically, ignore case when searching...
set smartcase                     " ...but be smart on the case when searching
set hlsearch                      " Highlight search matches as you type
set incsearch                     " Show search matches as you type
set ruler                         " Display the current cursor position
au FileType xml,html set matchpairs+=<:>                   " For tags and template
au BufNewFile,BufRead CMakeLists.txt set filetype=cmake    " for cmake


" Readability
"""""""""""""""""""""""""""""""""""""""
syntax on
set number                        " Always show line number
set cursorline                    " Change the current line background
set scrolloff=8                   " Keep 8 line above and under the current one

" Highlight the current word under the cursor
" http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
let g:no_highlight_group_for_current_word=["Statement", "Comment", "Type", "PreProc"]
function s:HighlightWordUnderCursor()
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


" Show cursorline only for active window
augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END

" Coloration and highlighting
""""""""""""""""""""""""""""""""""""""""

" Colorscheme used
colorscheme delek                 " Theme used
set background=dark               " Load dark color scheme


" Coloscheme and highlight are defined in a function
" because they need to be called at vimEnter
function s:DefaultColors()

  " EDITOR
  """"""""""""""""""""""""""""""""""""""""

  " Print a margin from 120 and above
  if !exists("g:disable_margin")
      let &colorcolumn=join(range(120,999),",")
      highlight ColorColumn cterm=NONE ctermbg=233
  endif

  " Window separator for split and vsplit (filled with fillchar)
  highlight VertSplit ctermfg=233 ctermbg=242

  " Background of the current line : same thant the margin
  highlight CursorLine  cterm=NONE ctermbg=233

  " clear coloration of the signColumn
  " for GitGutter, bookmarks, ...
  highlight clear SignColumn

  " Folded lines background
  highlight Folded ctermbg=233

  " Word under cursor is IncSearch (green), searched word is Yellow underline (Search)
  highlight Search ctermfg=Yellow ctermbg=NONE cterm=bold,underline
  highlight IncSearch ctermfg=Green ctermbg=NONE cterm=bold

  " Completion menu
  highlight Pmenu        cterm=none ctermfg=White     ctermbg=233
  highlight PmenuSel     cterm=none ctermfg=Black     ctermbg=DarkGreen
  highlight PmenuSbar    cterm=none ctermfg=none      ctermbg=Green
  highlight PmenuThumb   cterm=none ctermfg=DarkGreen ctermbg=DarkGreen

  " PLUGINS
  """"""""""""""""""""""""""""""""""""""""""

  " Bookmarks
  highlight BookmarkSign ctermfg=160
  highlight BookmarkLine ctermbg=233
  highlight BookmarkAnnotationLine ctermbg=234

  "GitGutter colors for line in highlight mode
  highlight GitGutterAddLine ctermbg=22
  highlight GitGutterChangeLine ctermbg=94
  highlight GitGutterDeleteLine ctermbg=88
endfunction

" call DefaultColors
if !exists("g:disable_defaultColors")
    autocmd VimEnter * call s:DefaultColors()
else
    autocmd VimEnter * highlight CursorLine cterm=NONE
endif

" highlight unwanted(trailing) whitespace
" + have this highlighting not appear whilst you are typing in insert mode
" + have the highlighting of whitespace apply when you open new buffers
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=237 guibg=darkgray
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=237 guibg=darkgray
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Indentation
"""""""""""""""""""""""""""""""""""""""

" Global configuration
set expandtab                     " Transform kitten killer tabs to spaces
set tabstop=4                     " Number of visual spaces per tab
set shiftwidth=4                  " Number of spaces to use for autoindent
set backspace=indent,eol,start    " Allow backspacing over everything in
                                  " insert mode
set autoindent                    " Always set autoindent on
set copyindent                    " Copy the previous indentation on autoindent
set shiftround                    " Use n shiftwidth when indenting with <>
set smarttab                      " Use smart removal when using tabs


" Global Filetype configuration
"""""""""""""""""""""""""""""""""""""""

autocmd FileType c,h,cpp,hpp,hxx  set smartindent " For c file, automatically inserts
                                                  " one extra level of indentation in some cases

let g:tex_flavor = 'latex'                        " empty tex still are tex files


"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Module and environment configuration                                      {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim configuration
"""""""""""""""""""""""""""""""""""""""

" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \ execute 'normal! g`"zvzz' |
                \ endif
augroup END

" Terminal setup
set encoding=utf-8                " Fix encoding shit...
set guifont=inconsolata           " For people prefering the GVim...
set fillchars+=vert:•             " Prefere a dot instead of a pipe
set mouse=a                       " Use mouse when using vim (tip: maj during
                                  " selection to use ctrl-maj-c to copy text)

" configure tags, you can add more in the postconf
" Build :
" ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f cpp cpp_src
" look at here : http://vim.wikia.com/wiki/C%2B%2B_code_completion
set tags+=~/.vim/tags/cpp

" Complete XML code
let g:xml_syntax_folding=1

" See tabs...
set list
set listchars=tab:▸\ ,extends:❰,nbsp:⇏,trail:•

" Bookmarks
"""""""""""""""""""""""""""""""""""""""
let g:bookmark_sign = '♥'
let g:bookmark_highlight_lines = 1

" BufExplorer
"""""""""""""""""""""""""""""""""""""""
let g:bufExplorerShowDirectories=1   " Show directories.
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerSortBy='name'       " Sort by the buffer's name.
let g:bufExplorerFindActive=1        " Go to active window.

" Closetag
"""""""""""""""""""""""""""""""""""""""

" Auto close tags (<a> -> </a>) for *.xml like files
let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.vti,*.vtu"

"DelimitMate
"""""""""""""""""""""""""""""""""""""""

" In XML. we don't want delimitMate to match <,> because
" the xml_autoclose deal with it.
" For other langages, < can be "less than"
let delimitMate_matchpairs = "(:),[:],{:}"
" For filetype confg :
"au FileType c*,perl let b:delimitMate_matchpairs = "(:),[:],{:}"

" when we have (|) and press space we want ( | )
"let delimitMate_expand_space = 1

" try to balance matchpair
let delimitMate_balance_matchpairs = 1

" Expand region
"""""""""""""""""""""""""""""""""""""""

call expand_region#custom_text_objects({
\ 'a]' :1,
\ 'ab' :1,
\ 'aB' :1,
\ 'ii' :1,
\ 'ap' :1
\ })

" GitGutter
"""""""""""""""""""""""""""""""""""""""
let g:gitgutter_override_sign_column_highlight = 0

" Jedi-vim
"""""""""""""""""""""""""""""""""""""""

" Jedi can be a little bit intrusive when you are used to code in Python (too
" much popups, too much screen used...). The following configuration reduce
" the module verbosity.
" See the jedi-vim setting page for more informations :
"     https://github.com/davidhalter/jedi-vim#settings
"
" Mapping are defined in the Shortcuts section.

" Don't popup on dot
let g:jedi#popup_on_dot=0

" Don't show the docstring in popup during completion
autocmd FileType python setlocal completeopt-=preview

" IMPORTANT NOTE : if you feel completion is really slow on common used
" library (such as pandas or os), please see the relevant following issue :
"     https://github.com/davidhalter/jedi-vim/issues/163
" However, note that completion is slow the first time (because it loads all
" the module structure) and is cached for future use in the same vim instance.

" NERDTree
"""""""""""""""""""""""""""""""""""""""
let g:NERDTreeDirArrows=0

" number.vim
let g:numbers_exclude = ['undotree', 'tagbar', 'startify', 'nerdtree']

" OmniCppComplete
"""""""""""""""""""""""""""""""""""""""
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
set completeopt=longest,menu
"set completeopt=menuone,menu,longest,preview

" Note for author : protodef is a plugin that allow creating function in cpp
" form protoype in header

" Rainbow parentheses
"""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle"
let g:rainbow_conf = {
      \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightgreen', 'lightmagenta', 'lightgray', 'lightred'],
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

" SnipMate
"""""""""""""""""""""""""""""""""""""""
let g:snipMate = { 'override' : 1 }        " in case of extended snipate, choose last automatically
let g:snipMate.snippet_version=1


" Startify
"""""""""""""""""""""""""""""""""""""""
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

" Switch
""""""""""""""""""""""""""""""""""""""
let b:switch_custom_definitions = [
            \   ['true', 'false'],
            \   {
            \     '\<[a-z0-9]\+_\k\+\>': {
            \       '_\(.\)': '\U\1'
            \     },
            \     '\<[a-z0-9]\+[A-Z]\k\+\>': {
            \       '\([A-Z]\)': '_\l\1'
            \     },
            \   }
            \ ]

autocmd FileType c,cpp let b:switch_custom_definitions = [
            \  {
            \     '\(\k\+\)\.': '\1->',
            \     '\(\k\+\)->': '\1.',
            \  },{
            \     '\.': '->',
            \     '->': '.',
            \  },
            \ ]


" Syntastic
"""""""""""""""""""""""""""""""""""""""

" Important note : if you want to work on c++>11, it is recommanded to create
" a $HOME/.syntastic_cpp_check containing the configuration of clang / gcc for
" syntastic. Mine contains "-std=c++14"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0  " we don't want the error windows at startup
let g:syntastic_auto_loc_list = 2             " close error window when done
let g:syntastic_check_on_open = 1             " check file at startup
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_balloons = 1           " for gvim, popup with mouse
let g:syntastic_c_check_header  = 1           " check header file
let g:syntastic_cpp_check_header  = 1

" Do not run syntastic on Python files ; we have other tools for that.
let g:syntastic_python_checkers = []

" Prefere zsh over bash if installed
if !exists("g:syntastic_shell")
    if filereadable("/bin/zsh")
        let g:syntastic_shell = '/bin/zsh'
    else
        let g:syntastic_shell = '/bin/bash'
    endif
endif

" Vim-airline configuration
"""""""""""""""""""""""""""""""""""""""

set laststatus=2                                                        " appear on first tab
let g:Powerline_symbols                          = 'fancy'              " theme setting
let g:airline#extensions#tabline#enabled         = 1                    " tab bar at the top
let g:airline#extensions#tabline#buffer_idx_mode = 1                    " tabs navigation enabled
let g:airline#extensions#tabline#fnamemod        = ':t'
let g:airline#extensions#tabline#show_tab_nr     = 1
let g:airline#extensions#tabline#formatter       = 'unique_tail'        " tab display only name
let g:airline#extensions#tagbar#enabled          = 1                    " link with tagbar
let g:airline#extensions#syntastic#enabled       = 1                    " link with syntastic
let g:airline#extensions#undotree#enabled        = 1                    " link with undotree


" Vim-cpp enhanced highlight
"""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" Vim-markdown
"""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1

" Vim-UndoTree
""""""""""""""""""""""""""""""""""""""""
let g:undotree_TreeNodeShape = '●'

let g:undotree_HighlightChangedText = 0    " remove annoying highlight
let g:undotree_WindowLayout = 2            " undo-tree left, diff below.
let g:undotree_DiffAutoOpen = 0            " diff on demand

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts                                                                 {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !exists("mapleader")
    let mapleader=","                      " Leader key is `,`.
endif

" Miscellaneous vim shortcuts
"""""""""""""""""""""""""""""""""""""""

" For qwerty it is easier tu use ; than :
map ; :

" Remap VIM 0 to first non-blank character
map 0 ^

" F 1-12

" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Copy pasting from the system
set pastetoggle=<F2>

" Stop checking for whitespace
map <F3> :AirlineToggleWhitespace<cr>

" Toogle syntastic with F4
map <F4> :SyntasticToggleMode<cr>

" Note, Maj F6 and Maj F7 are used by jedi

"""""

" Get rid of that stupid windows
map q: :q

" Build tags of your own project
map <leader>z :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" See the clipboards for pasting
map <leader>p :reg<CR>

" Folding
" fold between { }
map <leader>- [{zf%<CR>
" space toggle fold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Indent
vmap < <gv
vmap > >gv

" https://github.com/thirtythreeforty/dotfiles/blob/cb464b7ef00534aa06247e67f4e55c701022571f/vim/config/mappings.vim#L20-31
" Disable Ex mode, replace it with Execute Lines in Vimscript
function! ExecRange(line1, line2)
    exec substitute(join(getline(a:line1, a:line2), "\n"), '\n\s*\\', ' ', 'g')
    echom string(a:line2 - a:line1 + 1) . "L executed"
endfunction
command! -range ExecRange call ExecRange(<line1>, <line2>)

nnoremap Q :ExecRange<CR>
vnoremap Q :ExecRange<CR>

" Make Y yank to end of line (as suggested by Vim help)
noremap Y y$

" Hide highlight on search with <leader><space>
nnoremap <leader><space> :nohlsearch<cr>

" Hide the right margin (unify All background)
map <leader>a :hi clear ColorColumn<cr>

" Code oriented shortcuts
"""""""""""""""""""""""""""""""""""""""

" Code completion
"inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
"inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
inoremap <C-Space> <C-n>
inoremap <Nul> <C-n>

" Code corrections
au FileType c,cpp,h,hpp,hxx inoremap -. ->
au FileType c,cpp,h,hpp,hxx inoremap ,, <<
au FileType c,cpp,h,hpp,hxx inoremap <, <<

" Remove unwanted whitespaces
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
nnoremap <silent> <Leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Replace word under cursor in line
nnoremap <Leader>r :OverCommandLine<CR>%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>s :OverCommandLine<CR>%s///g<Left><Left><Left>
" in visual mode, mapping a simple letter can conflict with snippets
vnoremap <C-r> <Esc>:OverCommandLine<CR>'<,'>s/

"  DelimitMate
" Go out of current delimitation
imap <c-x> <Plug>delimitMateS-Tab

" Manpage for word under cursor via 'K' in command moderuntime
runtime ftplugin/man.vim
noremap <buffer> <silent> K :exe "Man" expand('<cword>') <CR>

" Syntastic shortcuts : silent check and error summary
map <leader>c :SyntasticCheck<CR>
map <leader>e :Errors<CR>

" Tabularize ( align assignation ...)
nmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>

" Re-format the code, based on the LLVM style guide
" http://llvm.org/docs/CodingStandards.html
map <C-D> :pyf ~/.vim/clang-format.py<CR>
imap <C-D> <c-o>:pyf ~/.vim/clang-format.py<CR>

" Navigation
"""""""""""""""""""""""""""""""""""""""

" Current tab : use C and standard move (keys or hjkl) to move inside the tab
map <C-Left> <C-w>h
map <C-Up> <C-w>k
map <C-Down> <C-w>j
map <C-Right> <C-w>l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h             " Issue in neovim
map <C-l> <C-W>l
nmap <Leader>v :vsplit<CR>
nmap <Leader>h :split<CR>

" Size of window
" Note : can use ctrl-maj on neovim only
" For the moment, can't map ctrl-h on neovim : issue
map <C-s>h :vertical res -5<cr>
map <C-s>j :res -5<cr>
map <C-s>k :res +5<cr>
map <C-s>l :vertical res +5<cr>

" Zoom the current focused split

" Confict with neovim, use :only to show only current
" Loose toogle effect
if has("nvim")
    " unmap the plugin maximize (neovim already
    " use this mapping for :only natively)
    autocmd VimEnter * unmap <c-w>o

    " teminal navigation
    tnoremap <Esc> <C-\><C-n>
else
    " we are on vim, leader o is great too
    map <Leader>o <c-w>o
endif

" Tabs navigation
map <Leader>> :tabnext<CR>
map <Leader>< :tabprevious<CR>
map <Leader>t :tabnew<CR>

" Toggle recent buffer with <Leader>-Tab
nnoremap <silent> <Leader><Tab> :b#<CR>

" Buffers
map <leader><Up> :BufExplorer<CR>
map <leader><Down> :ls<CR>
map <leader><Right> :bn<CR>
map <leader><Left> :bp<CR>

" Vim-airline
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Module shortcuts
"""""""""""""""""""""""""""""""""""""""

" GitGutter

" diff from git
map <leader>gd <leader>hp
" highlight different lines
map <leader>gh :GitGutterLineHighlightsToggle<cr>
" Revert this section from git
map <leader>gr :GitGutterUndoHunk<cr>

" Jedi-vim
" Note: The following Jedi-vim shortcuts are based on the JetBrains shortcuts
" logic.
" Note: to properly use the rename command, go to the function/class
" definition or the variable assignation through <C-b> and use <S-F6>
" shortcut.

let g:jedi#goto_command = "<C-b>"
let g:jedi#goto_assignments_command = ""
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "<leader>K"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<S-F6>"
let g:jedi#usages_command = "<S-F7>"

" NerdTree
map <leader>n :NERDTreeToggle<cr>
map <leader>f :NERDTreeFind<cr>
" leave if only nerdTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") ) | q | endif

" Tagbar (http://blog.stwrt.ca/2012/10/31/vim-ctags)
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" Switch : Inverse
map <leader>i :Switch<cr>

" Vim-undo tree
nnoremap <leader>u :UndotreeToggle<cr>


"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Post-configuration : used for plugins configuration and colors / themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load the ~/.vimrc.postconf if exist
if filereadable(expand("\~/.vimrc.postconf"))
  source \~/.vimrc.postconf
endif


"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Todo section                                                              {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Make a script to add help of all plugins
"
" Change to neobundle : dynamic load filetype plugins
"
" Improve completion : the longuest option implies bug when select the first
" entry too fast
"
"}}}

