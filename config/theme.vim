" This file deals withs colors

" Coloration and highlighting
""""""""""""""""""""""""""""""""""""""""

" Colorscheme used
" colorscheme delek                 " Theme used
set background=dark               " Load dark color scheme

" Functions (called at start)
""""""""""""""""""""""""""""""""""""""""

" Cursor, separator, folded, num col ...
function! s:EditorColors()
    highlight clear VertSplit
    highlight CursorLine  cterm=NONE ctermbg=233
    highlight clear SignColumn
    highlight Folded ctermbg=233
    highlight Search ctermfg=Yellow ctermbg=NONE cterm=bold,underline
    highlight IncSearch ctermbg=NONE cterm=bold
endfunction

" Completion menu
function! s:PmenuColors()
    highlight Pmenu        cterm=none ctermfg=White     ctermbg=Black
    highlight PmenuSel     cterm=none ctermfg=Black     ctermbg=DarkGreen
    highlight PmenuSbar    cterm=none ctermfg=none      ctermbg=Green
    highlight PmenuThumb   cterm=none ctermfg=DarkGreen ctermbg=DarkGreen
endfunction

" Change color at 120 character by default
if !exists("g:margin_position")
  let g:margin_position=120
endif
function! s:PrintMargin()
    let &colorcolumn=join(range(g:margin_position,999),",")
    highlight ColorColumn cterm=NONE ctermbg=Black
endfunction

" call EditorColors
if !exists("g:disable_defaultColors")
    autocmd VimEnter,ColorScheme * call s:PmenuColors()
    autocmd VimEnter,ColorScheme * call s:EditorColors()
    if !exists("g:disable_margin")
        autocmd VimEnter,ColorScheme * call s:PrintMargin()
    endif
else
    autocmd VimEnter,ColorScheme * highlight CursorLine cterm=NONE
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

" Status line
if version >= 700
   set laststatus=2
   set statusline+=%t\                              " tail of the filename
   set statusline+=[%{strlen(&fenc)?&fenc:'none'},  " file encoding
   set statusline+=%{&ff}]                          " file format
   set statusline+=%h                               " help file flag
   set statusline+=%m                               " modified flag
   set statusline+=%r                               " read only flag
   set statusline+=%y                               " filetype
   set statusline+=%=                               " left/right separator
   set statusline+=%c,                              " cursor column
   set statusline+=%l/%L                            " cursor line/total lines
   set statusline+=\ %P                             " percent through file

   function! InsertStatuslineColor(mode)
      if a:mode == 'i'
         highlight StatusLine guifg=White
      elseif a:mode == 'r'
         highlight StatusLine guifg=Red
      else
         highlight StatusLine guifg=gray42
      endif
   endfunction

   au InsertEnter * call InsertStatuslineColor(v:insertmode)
   au InsertChange * call InsertStatuslineColor(v:insertmode)
   au InsertLeave,VimEnter * hi StatusLine guifg=gray42 guibg=NONE
endif
