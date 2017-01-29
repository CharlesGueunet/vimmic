" This file contain basics configurations for the editor:
"  - Option for files and buffers / history ...
"  - What to display (including search)
"  - Vim completions settings
"
" NO PLUGINS HERE

" Files & Buffers
"""""""""""""""""""""""""""""""""""""""
set nocompatible                " Use all new vim functionalities
set hidden                      " Do not close the buffers, hide them
set history=1000                " Remember more commands and search history
set undolevels=1000             " Remember more levels of undo
set noerrorbells                " No buzz on error
set novisualbell                " No 'visual buzz' on error
set t_vb=                       " Same as above
set autoread                    " Reload the file if changed from the outside
"set timeout                     " Enable timeout on mapping and key codes
"set timeoutlen=400              " Maximum wait time for command sequence
"set ttimeoutlen=400             " Same as above

"autocmd BufEnter * silent! lcd %:p:h " change working directory at file opening

" Option to make clean session with mksession (usefull when changing vimrc)
set ssop=buffers,curdir,tabpages,winpos,winsize

" Turn backup off ; be careful with this !
"set nobackup
"set nowb
"set noswapfile

" Persistent undo
if has("persistent_undo")
    set undofile
    execute 'set undodir='.g:Vimmic_HOME.".undodir"
    set undolevels=1000         " How many undos
    set undoreload=10000        " number of lines to save for undo
endif

" Display and search configuration
"""""""""""""""""""""""""""""""""""""""
set shortmess=a                 " Deal with messages
set nowrap                        " No new line when the line is too long
set showmatch                     " Show matching parenthesis
set ignorecase                    " Basically, ignore case when searching...
set smartcase                     " ...but be smart on the case when searching
set hlsearch                      " Highlight search matches as you type
set incsearch                     " Show search matches as you type
set ruler                         " Display the current cursor position


" Readability
"""""""""""""""""""""""""""""""""""""""
syntax on
set number                        " Always show line number
set cursorline                    " Change the current line background
set scrolloff=8                   " Keep 8 line above and under the current one
au BufNewFile,BufRead CMakeLists.txt set filetype=cmake    " for cmake

" Autocompletion
"""""""""""""""""""""""""""""""""""""""
" Wildmenu completion : exclude some files
set wildmenu
set wildmode=list:longest,full
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
set completeopt=menu,longest
au FileType xml,html set matchpairs+=<:> " For tags and template
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Highlight
"""""""""""""""""""""""""""""""""""""""

" Highlight the current word under the cursor, except some groups
" http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
let g:no_highlight_group_for_current_word=["Statement", "Comment", "Type", "PreProc"]
function! s:HighlightWordUnderCursor()
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

