" This file contains global shortcuts
" NO PLUGINS


" Editor
""""""""

" For qwerty it is easier tu use ; than :
map ; :
" still keep ability to repeat a go-to
noremap ;; ;

" Prefere to quit insertion with ctrl-d than Esc
" PS: Ctrl-C is hard interrupt
imap <C-d> <Esc>
map <C-d> <Esc>

" Function keys
""""""""""""""""

" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Copy pasting from the system
set pastetoggle=<F2>

nmap <F6> :set spell!<CR>

" Utility
""""""""""

" get rid of uppercase trouble
command W w
command Q q
command WQ wq
command Wq wq
command QA qa
command Qa qa
command WQA wqa
command WQa wqa
command Wqa wqa

" Remap VIM 0 to first non-blank character
map 0 ^

" Make Y yank to end of line (as suggested by Vim help)
noremap Y y$

" Inspect clipboard (peekaboo do the job)
" map <leader>p :reg<CR>

" Folding
" fold between { }
map <leader>- [{zf%<CR>

" space toggle fold
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Indent, keep selected text
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

" Insert new line above current one
imap <C-o> <Esc>O

" Operators
" Next brace
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap an{ :<c-u>normal! f{va{V<cr>
vnoremap in{ :<c-u>normal! f{vi{<cr>
vnoremap an{ :<c-u>normal! f{va{V<cr>
" Current line
onoremap iL  :<c-u>normal! 0v$<cr>
onoremap aL  :<c-u>normal! V<cr>
vnoremap iL  :<c-u>normal! 0v$<cr>
vnoremap aL  :<c-u>normal! V<cr>


" Highlight
""""""""""""

" Hide highlight on search with <leader><space>
nnoremap <leader><space> :nohlsearch<cr>

" Hide the right margin (unify All background)
map <leader>a :hi clear ColorColumn<cr>

" Completion & code
"""""""""""""""""""

" Simple completion via ctrl-space
inoremap <C-Space> <C-n>
inoremap <Nul> <C-n>

" Cleaver (omni) completion via Ctrl-x x
inoremap <C-x><C-x> <C-x><C-o>

" remove unwanted trailling spaces, global or in selection
nnoremap <silent> <Leader>pt :0,$call TrimSpaces()<CR>
vnoremap <silent> <Leader>pt :call TrimSpaces()<CR>

" Avoid the non-completing enter key by making it behave like ctrl-y
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" The below mappings will make <C-N> work the way it normally
" does; however, when the menu appears, the <Down> key will be simulated. What
" this accomplishes is it keeps a menu item always highlighted. This way you can
" keep typing characters to narrow the matches, and the nearest match will be
" selected so that you can hit Enter at any time to insert it.

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" Execute a macro for each line of a visual block
" Explain: https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" Window navigation
"""""""""""""""""""

map <C-Left> <C-w>h
map <C-Up> <C-w>k
map <C-Down> <C-w>j
map <C-Right> <C-w>l
nmap <Leader>wv :vsplit<CR>
nmap <Leader>wh :split<CR>
nmap <Leader>wt :tabnew<CR>

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

" Tabs navigation (Discouraged)
map <Leader>> :tabnext<CR>
map <Leader>< :tabprevious<CR>

" Buffers
"""""""""

map <leader><Down> :ls<CR>
map <leader><Right> :bn<CR>
map <leader><Left> :bp<CR>

" Toggle recent buffer with <Leader>-Tab
nnoremap <silent> <Leader><Tab> :b#<CR>

" Text
""""""

" Errors checking
map <leader>ss :ll<CR>
map <leader>sn :lnext<CR>
map <leader>sp :lprevious<CR>

" Line manipulation: inspired from : "FtZzy/vim-conf"
" Drag lines with Ctrl+j/k
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" File Specific
"""""""""""""""

" Latex use ellipsis :
autocmd Filetype tex inoremap ... \ldots

" C / CPP fast -> and <<
au FileType c,cpp inoremap -. ->
au FileType cpp inoremap ,, <<
au FileType cpp inoremap <, <<

