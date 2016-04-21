"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" @file vimrc
" @author Charles Gueunet, Axel Martin
" @brief Vim main configuration file
" @version 0.6
" @date 04-01-2016
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin import                                                             {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

execute pathogen#infect('bundle/{}','ftbundle/*/{}', 'ctbundle/{}')

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

" Option to make clean session with mksession (usefull when changing vimrc)
set ssop=buffers,curdir,tabpages,winpos,winsize

" Turn backup off ; be careful with this !
"set nobackup
"set nowb
"set noswapfile

" Wildmenu completion : exclude some files
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn " Version Controls
set wildignore+=*.aux,*.out,*.toc " Latex Indermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " Binary Imgs
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " Compiled Object files
set wildignore+=*.spl " Compiled speolling world list
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.DS_Store " OSX SHIT
set wildignore+=*.luac " Lua byte code
set wildignore+=migrations " Django migrations
set wildignore+=*.pyc " Python Object codes
set wildignore+=*.orig " Merge resolution files
set wildignore+=*.class " java/scala class files
set wildignore+=*/target/* " sbt target dires `,`. You can use space
                                       " in your local
" Display and search configuration
"""""""""""""""""""""""""""""""""""""""
set nowrap                        " No new line when the line is too long
set showmatch                     " Show matching parenthesis
set ignorecase                    " Basically, ignore case when searching...
set smartcase                     " ...but be smart on the case when searching
set hlsearch                      " Highlight search matches as you type
set incsearch                     " Show search matches as you type
set ruler                         " Display the current cursor position
set matchpairs+=<:>               " For tags and template


" Readability
"""""""""""""""""""""""""""""""""""""""
filetype plugin indent on         " Enable syntax and auto indentation
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

autocmd CursorMoved * call s:HighlightWordUnderCursor()


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
function s:MakeColorscheme()

  " EDITOR
  """"""""""""""""""""""""""""""""""""""""

  " Print a margin from 120 and above
  let &colorcolumn=join(range(120,999),",")
  highlight ColorColumn cterm=NONE ctermbg=233

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

  " PLUGINS
  """"""""""""""""""""""""""""""""""""""""""

  " Omni cpp
  highlight Pmenu        cterm=none ctermfg=White     ctermbg=233
  highlight PmenuSel     cterm=none ctermfg=Black     ctermbg=DarkGreen
  highlight PmenuSbar    cterm=none ctermfg=none      ctermbg=Green
  highlight PmenuThumb   cterm=none ctermfg=DarkGreen ctermbg=DarkGreen

  " Bookmarks
  highlight BookmarkSign ctermbg=NONE ctermfg=160
  highlight BookmarkLine ctermbg=233
  highlight BookmarkAnnotationLine ctermbg=234
endfunction

" call MakeColorscheme
autocmd VimEnter * call s:MakeColorscheme()
call s:MakeColorscheme()

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
autocmd FileType c,h,cpp,hpp,hxx  set smartindent " For c file, automatically inserts
                                                  " one extra level of indentation in some cases


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

" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp

" Complete XML code
let g:xml_syntax_folding=1
au FileType xml  setlocal foldmethod=indent
au FileType html setlocal foldmethod=indent

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

" Indent Guidee
"""""""""""""""""""""""""""""""""""""""
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size  = 3
let g:indent_guides_color_change_percent  = 10
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar', 'startify', 'undotree']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=232

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
set completeopt=menuone,menu,longest
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
if filereadable("/bin/zsh")
  let g:syntastic_shell = '/bin/zsh'
else
  let g:syntastic_shell = '/bin/bash'
endif

" Vim-airline configuration
"""""""""""""""""""""""""""""""""""""""

set laststatus=2                                                        " appear on first tab
let g:Powerline_symbols                          = 'fancy'              " theme setting
let g:airline#extensions#tabline#enabled         = 1                    " tab bar at the top
let g:airline#extensions#tabline#buffer_idx_mode = 1                    " tabs navigation enabled
let g:airline#extensions#tabline#formatter       = 'unique_tail'        " tab display only name
let g:airline#extensions#tagbar#enabled          = 1                    " link with tagbar
let g:airline#extensions#syntastic#enabled       = 1                    " link with syntastic
let g:airline#extensions#undotree#enabled        = 1                    " link with undotree


" Vim-cpp enhanced highlight
"""""""""""""""""""""""""""""""""""""""
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" Vim-UndoTree
""""""""""""""""""""""""""""""""""""""""
let g:undotree_HighlightChangedText = 0    " remove annoying highlight
let g:undotree_WindowLayout = 2            " undo-tree left, diff below.
let g:undotree_DiffAutoOpen = 0            " diff on demand

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts                                                                 {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=","                      " Leader key is `,`.
"let mapleader=" "                      " Alternatively, space is good !

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

" Note, Maj F6 and Maj F7 are used by jedi

"""""

" Get rid of that stupid windows
map q: :q

" Build tags of your own project
" ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ -f cpp cpp_src
map <leader>z :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" See the clipboards for pasting
map <leader>p :reg<CR>

" Folding
map <leader>- [{zf%<CR>

" Hide highlight on search with <leader><space>
nnoremap <leader><space> :nohlsearch<cr>

" Hide the right margin (unify All background)
map <leader>a :hi clear ColorColumn<cr>

" Code oriented shortcuts
"""""""""""""""""""""""""""""""""""""""

" Code completion
inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
inoremap <C-Space> <C-n>
inoremap <Nul> <C-n>

" Remove unwanted whitespaces
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
nnoremap <silent> <Leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Replace word under cursor in line
nnoremap <Leader>r :OverCommandLine<CR>%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <Leader>s :OverCommandLine<CR>%s///g<Left><Left><Left>

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
map <C-h> <C-W>h
map <C-l> <C-W>l
map <Leader>v :vsplit<CR>
map <Leader>h :split<CR>

" Zoom the current focused split

" Confict with neovim, use :only to show only current
" Loose toogle effect
if has("nvim")
    " unmap the plugin vercion (neovim already
    " use this mapping for :only natively)
    autocmd VimEnter * unmap <c-w>o
else
    " we are on vim, leader o is great too
    map <Leader>o <c-w>o
endif

" Tabs navigation
map <Leader>> :tabnext<CR>
map <Leader>< :tabprevious<CR>
map <Leader>t :tabnew<CR>

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
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") ) | q | endif

" Tagbar (http://blog.stwrt.ca/2012/10/31/vim-ctags)
nnoremap <silent> <Leader>b :TagbarToggle<CR>

" Vim-undo tree
nnoremap <leader>u :UndotreeToggle<cr>


" Interesting but not enable right now
"""""""""""""""""""""""""""""""""""""""

" Indentation : got to opening bracket and indent
"nmap <leader>ip [{=%

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scripts and macros                                                        {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Detect current highlight group
function! SyntaxItem()
    return synIDattr(synIDtrans(synID(line("."), stridx(getline("."), expand('<cword>')) + 1, 1)), "name")
endfunction

" add curent highlight group in the x section of airline
" when there is only one widows
function! AirlineInit()
    if winnr('$') == 1
        call airline#parts#define_raw('hiGroup', '%{SyntaxItem()}')
        let g:airline_section_x = airline#section#create([ 'hiGroup', ' < ', 'tagbar' , ' < ','%{airline#util#wrap(airline#parts#filetype(),0)}'])
    else
        let g:airline_section_x = airline#section#create([ 'tagbar' , ' < ','%{airline#util#wrap(airline#parts#filetype(),0)}'])
    endif
    call airline#update_statusline()
endfunction

" uncoment this in your ~/.vimrc.local if you want to enable
" this feacture
"autocmd VimEnter,WinEnter * call AirlineInit()
" Note : you can change * py *.py for example to allow this
" only for python files


"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User defined config                                                       {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load the ~/.vimrc.local if exist
if filereadable(expand("\~/.vimrc.local"))
  source \~/.vimrc.local
endif


"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Todo section                                                              {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" remove indent guides ?
" remove fugitive ?
"
" add vim-undo tree and a shortcut to have all panes (Ctrl H)
"
" fix syntax highlighting
"
" Add vim-refactor in a separate folder
"
" Make branch for language (and maybe ftplugin)
"
" Make a script to add help of all plugins
"
"}}}

