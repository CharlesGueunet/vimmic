" This file contain basics configurations for the editor:
"  - Option for files and buffers / history ...
"  - What to display (including search)
"  - Vim completions settings
"
" NO PLUGINS HERE

" Global
"""""""""""""""""""""""""""""""""""""""
"no beep
set noerrorbells
set visualbell
augroup NoBell
   autocmd VimEnter * set t_vb=""
augroup end

" Files & Buffers
"""""""""""""""""""""""""""""""""""""""
set hidden                      " Do not close the buffers, hide them
set history=1000                " Remember more commands and search history
set undolevels=1000             " Remember more levels of undo
set autoread                    " Reload the file if changed from the outside
"set timeout                    " Enable timeout on mapping and key codes
"set timeoutlen=400             " Maximum wait time for command sequence
"set ttimeoutlen=400            " Same as above
set switchbuf=useopen           " if opening a file from :ls, :buffers, :files, etc. jump to open version
                                " of the file, if one exists
set confirm                     " dialog foor unsaved changes
set splitright                  " got to right pane by default (Needed for quickmenu)
set noequalalways               " do not resize when a window is closed
set notagrelative               " absolute path for catgs (usefull when .git/tags)
set tags+=.git/tags

" Terminal/GUI setup
scriptencoding utf-8              " Fix encoding
set fillchars+=vert:•             " Prefere a dot over a pipe
set fillchars+=fold:.             " avoid ugly dashes
set signcolumn=yes                " do not hide signcolum for consistency
set mouse=a                       " Use mouse when using vim (tip: maj during
                                  " selection to use ctrl-maj-c to copy text)

" smooth redraw
set lazyredraw

" Show keys in status
set showcmd

" Option to make clean session with mksession (usefull when changing vimrc)
set sessionoptions=buffers,curdir,tabpages,winpos,winsize

" Turn backup off ; be careful with this !
"set nobackup
"set nowb
"set noswapfile

" Persistent undo
if has('persistent_undo')
   set undofile
   let &undodir=g:Vimmic_BASE.'.undodir'
   set undolevels=1000         " How many undos
   set undoreload=10000        " number of lines to save for undo
endif

" Time before swap update
" also used by plugons like GitGutter
set updatetime=1000

" Indentation
"""""""""""""""""""""""""""""""""""""""
" Global configuration
set expandtab                     " Transform kitten killer tabs to spaces
set backspace=indent,eol,start    " Allow backspacing over everything in
                                  " insert mode
set autoindent                    " Always set autoindent on
set copyindent                    " Copy the previous indentation on autoindent
set shiftround                    " Use n shiftwidth when indenting with <>
set smarttab                      " Use smart removal when using tabs
set nojoinspaces                  " one space after joining lines with poncutation

" Trailing / tabs
set list
set listchars=tab:╎\ ,extends:❰,nbsp:⇏,trail:•

" Conceal special char
set conceallevel=0
set concealcursor=nc

" Join lines
set formatoptions+=j

" Display and search configuration
"""""""""""""""""""""""""""""""""""""""
set shortmess=a                   " Deal with messages
set nowrap                        " No new line when the line is too long
set showmatch                     " Show matching parenthesis
set ignorecase                    " Basically, ignore case when searching...
set smartcase                     " ...but be smart on the case when searching
set wildignorecase                " also in command mode
set hlsearch                      " Highlight search matches as you type
set incsearch                     " Show search matches as you type
set ruler                         " Display the current cursor position

set guioptions-=m                 "remove menu bar
set guioptions-=T                 "remove toolbar
set guioptions-=r                 "remove right-hand scroll bar
set guioptions-=L                 "remove left-hand scroll bar


" Readability
"""""""""""""""""""""""""""""""""""""""
syntax on
set number                        " Always show line number
set cursorline                    " Change the current line background
set scrolloff=8                   " Keep 8 line above and under the current one

" Autocompletion
"""""""""""""""""""""""""""""""""""""""
" Wildmenu completion : exclude some files
set wildmenu
set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn                         " Version Controls
set wildignore+=*.aux,*.out,*.toc                     " Latex Indermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg,*.pdf  " Binary Imgs
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.so " Compiled Object files
set wildignore+=*.spl                                 " Compiled speolling world list
set wildignore+=*.sw?                                 " Vim swap files
set wildignore+=*.DS_Store                            " OSX SHIT
set wildignore+=*.luac                                " Lua byte code
set wildignore+=migrations                            " Django migrations
set wildignore+=*.pyc                                 " Python Object codes
set wildignore+=*.orig                                " Merge resolution files
set wildignore+=*.class                               " java/scala class files
set wildignore+=*.bbl                                 " temporary latex file
set wildignore+=*.blg                                 " temporary latex file
set wildignore+=*.fdb_latexmk                         " temporary latex file
set wildignore+=*.fls                                 " temporary latex file
set wildignore+=*.synctex.gz                          " temporary latex file
set wildignore+=*/target/*                            " sbt target dires `,`.

set completeopt=menuone,preview,noinsert
" Use vim existing clever completion by default
set omnifunc=syntaxcomplete#Complete
" automatically open and close the popup menu / preview window
augroup vimmic_popup_menu
   autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
augroup end

set belloff+=ctrlg " Avoid Vim beeps during completion

" Cursor
"""""""""""""""""""""""""""""""""""""""
" Show cursorline only for active window
augroup cline
   autocmd!
   autocmd WinLeave,InsertEnter * set nocursorline
   autocmd WinEnter,InsertLeave * set cursorline
augroup end

" http://vim.wikia.com/wiki/Change_cursor_shape_in_different_modes
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
   autocmd!
   autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \ execute 'normal! g`"zvzz' |
            \ endif
augroup end

" Filetype specific
"""""""""""""""""""""""""""""""""""""""

" detection

augroup Vimmic_ft
   autocmd!
   autocmd BufReadPre,BufNewFile *.plt set filetype=gnuplot
   autocmd BufReadPre,BufNewFile *.txx set filetype=cpp
   autocmd BufReadPre,BufNewFile *.toml set filetype=toml
   autocmd BufReadPre,BufNewFile *.mcss set filetype=css
augroup end

augroup vimmic_cmake_filetype
   autocmd BufNewFile,BufRead CMakeLists.txt set filetype=cmake
augroup end

augroup vimmic_xml_matchpair
   autocmd FileType xml,html set matchpairs+=<:>
augroup end

" C/CPP improved indentation
augroup vimmic_cpp_indent
   autocmd FileType c,cpp  set cindent
augroup end

" From TPope vimrc
augroup FTCheck
   autocmd!
   autocmd BufNewFile,BufRead *named.conf*       set ft=named
   autocmd BufNewFile,BufRead *.txt,README,INSTALL,NEWS,TODO if &ft == ""|set ft=text|endif
augroup end

augroup FTOptions
   autocmd!
   autocmd FileType c,cpp,cs,java           setlocal commentstring=//\ %s
   autocmd Syntax   javascript              setlocal isk+=$
   autocmd FileType xml,xsd,xslt,javascript setlocal ts=2
   autocmd FileType text,txt,mail           setlocal ai com=fb:*,fb:-,n:>
   autocmd FileType sh,zsh,csh,tcsh         inoremap <silent> <buffer> <C-X>! #!/bin/<C-R>=&ft<CR>
   autocmd FileType sh,zsh,csh,tcsh         let &l:path = substitute($PATH, ':', ',', 'g')
   autocmd FileType perl,python,ruby        inoremap <silent> <buffer> <C-X>! #!/usr/bin/env<Space><C-R>=&ft<CR>
   autocmd FileType apache                  setlocal commentstring=#\ %s
   autocmd FileType git,gitcommit           setlocal foldmethod=syntax foldlevel=1
   autocmd FileType gitcommit               setlocal spell
   autocmd FileType gitcommit               :0
   autocmd FileType gitrebase               nnoremap <buffer> S :Cycle<CR>
   autocmd FileType gnuplot                 set makeprg=gnuplot\ %
   autocmd FileType rust                    set makeprg=rustc\ %
   autocmd FileType help                    setlocal ai fo+=2n | silent! setlocal nospell
   autocmd FileType help                    nnoremap <silent><buffer> q :q<CR>
   autocmd FileType lua                     setlocal includeexpr=substitute(v:fname,'\\.','/','g').'.lua'
   autocmd FileType ruby                    setlocal tw=79 comments=:#\  isfname+=:
   autocmd FileType liquid,markdown,text,txt setlocal tw=78 linebreak nolist
   autocmd FileType python                  set makeprg=python\ %
   autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
   autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif
augroup end

let g:tex_flavor = 'latex'

