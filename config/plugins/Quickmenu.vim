" mbbill/undotree
" Menu pane, display help and shortcut to usefull functions

" Settings
""""""""""
" enable cursorline (L) and cmdline help (H)
let g:quickmenu_options = "LH"

" clear all the items
call g:quickmenu#reset()
call g:quickmenu#header("Vimmic: help")

" Content
" ------

" All the man section of Vimmic
call g:quickmenu#append('# Man', '')
" Help Navigtion Vimmic
" Help Highlight Vimmic
" Help Completion Vimmic

" Editor display
call g:quickmenu#append('# Highligh', '')
call g:quickmenu#append('Paste mode', 'call feedkeys("\<F2>")', 'Can be done with <F2>')
call g:quickmenu#append('Trailing check', ':AirlineToggleWhitespace', 'Can be done with <F3>')
call g:quickmenu#append('Syntax check', ':SyntasticToggleMode', 'Can be done with <F4>')
call g:quickmenu#append('Parenthesis color', ':RainbowToggle', 'Can be done with <F5>')
call g:quickmenu#append('Clear right margin', ':hi clear ColorColumn', 'Can be done with <leader>a')

" Scripts
call g:quickmenu#append('# Actions', '')
" Remove trailing
" Call syntastic


" Shortcut
""""""""""
noremap <silent><F12> :call quickmenu#toggle(0)<cr>

" Theme
"""""""
" None
