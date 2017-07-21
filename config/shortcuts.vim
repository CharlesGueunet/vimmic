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

" Inspect clipboard
map <leader>p :reg<CR>

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
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap an{ :<c-u>normal! f{va{V<cr>


" Highlight
""""""""""""

" Hide highlight on search with <leader><space>
nnoremap <leader><space> :nohlsearch<cr>

" Hide the right margin (unify All background)
map <leader>a :hi clear ColorColumn<cr>

" Completion & code
"""""""""""""""""""

" Code completion via ctrl-space
"inoremap <expr> j ((pumvisible())?("\<C-n>"):("j"))
"inoremap <expr> k ((pumvisible())?("\<C-p>"):("k"))
inoremap <C-Space> <C-n>
inoremap <Nul> <C-n>

" Ctrl-x x for cleaver completion
inoremap <C-x><C-x> <C-x><C-o>

" Remove unwanted whitespaces Leader w
" http://vim.wikia.com/wiki/Remove_unwanted_spaces
nnoremap <silent> <Leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Avoid the non-completing enter key by making it behave like ctrl-y
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" The below mappings will make <C-N> work the way it normally
" does; however, when the menu appears, the <Down> key will be simulated. What
" this accomplishes is it keeps a menu item always highlighted. This way you can
" keep typing characters to narrow the matches, and the nearest match will be
" selected so that you can hit Enter at any time to insert it.

inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Window navigation
"""""""""""""""""""

" Current tab : use Ctrl and standard move (keys or hjkl) to move inside the tab
map <C-Left> <C-w>h
map <C-Up> <C-w>k
map <C-Down> <C-w>j
map <C-Right> <C-w>l
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h  " Issue in neovim
map <C-l> <C-W>l
nmap <Leader>v :vsplit<CR>
nmap <Leader>h :split<CR>

" Size of window
" Note : can use ctrl-maj on neovim only
" For the moment, can't map ctrl-h on neovim : issue
"map <A-w>h :vertical res -5<cr>
"map <A-w>j :res -5<cr>
"map <A-w>k :res +5<cr>
"map <A-w>l :vertical res +5<cr>

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

" Buffers
"map <leader><Up> :BufExplorer<CR>
map <leader><Down> :ls<CR>
map <leader><Right> :bn<CR>
map <leader><Left> :bp<CR>

" Toggle recent buffer with <Leader>-Tab
nnoremap <silent> <Leader><Tab> :b#<CR>

" File Specific
"""""""""""""""
" Text replacement

" Latex use ellipsis :
autocmd Filetype tex inoremap ... \ldots

" C / CPP fast -> and <<
au FileType c,cpp inoremap -. ->
au FileType cpp inoremap ,, <<
au FileType cpp inoremap <, <<

