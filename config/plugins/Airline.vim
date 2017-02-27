" vim-airline/vim-airline
" Replacement statusline

" Settings
""""""""""
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

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'P'
let g:airline_symbols.whitespace = 'Ξ'

" Shortcut
""""""""""
" Stop checking for whitespace (right orange section)
map <F3> :AirlineToggleWhitespace<cr>

" Vim-airline: go to tab 1-9
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


" Theme
"""""""
" None
