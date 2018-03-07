" This file deals withs colors

" Editor
""""""""
if !exists('g:disable_defaultColors')
   " defualt vim
   colorscheme default

   highlight clear VertSplit
   highlight clear SignColumn
   highlight clear LineNr

   augroup vimmic_highlight_clea
      autocmd ColorScheme * highlight clear VertSplit
      autocmd ColorScheme * highlight clear SignColumn
      autocmd ColorScheme * highlight clear LineNr
   augroup END

   " Cursor, separator, folded, num col ...
   function! s:EditorColors()
      highlight clear VertSplit
      highlight CursorLine  cterm=NONE ctermbg=233 guibg=#162228
      highlight clear SignColumn
      highlight Folded ctermbg=233
      highlight Search ctermfg=Yellow ctermbg=NONE cterm=bold,underline
      highlight IncSearch ctermbg=NONE cterm=bold
   endfunction

   " Completion menu
   function! s:PmenuColors()
      highlight Pmenu      ctermfg=White     ctermbg=Black
      highlight PmenuSel   ctermfg=Black     ctermbg=DarkBlue
      highlight PmenuSbar  ctermfg=none      ctermbg=Green
      highlight PmenuThumb ctermfg=DarkBlue ctermbg=DarkBlue
   endfunction

   " Change color at 120 character by default
   if !exists('g:MarginPos')
      let g:MarginPos='120'
   endif
   if !exists('g:MarginBG')
      if &termguicolors
         let g:MarginBG='#162228'
      else
         let g:MarginBG='Black'
      endif
   endif
   function! s:PrintMargin()
      let &colorcolumn=join(range(g:MarginPos,300),',')
      if &termguicolors
         execute 'highlight ColorColumn cterm=NONE guibg='.g:MarginBG
      else
         execute 'highlight ColorColumn cterm=NONE ctermbg='.g:MarginBG
      endif
   endfunction

   " Apply these colors
   autocmd VimEnter,ColorScheme * call s:PmenuColors()
   autocmd VimEnter,ColorScheme * call s:EditorColors()
   if !exists('g:disable_margin')
      autocmd VimEnter,ColorScheme * call s:PrintMargin()
   endif

   " highlight unwanted(trailing) whitespace
   " + have this highlighting not appear whilst you are typing in insert mode
   " + have the highlighting of whitespace apply when you open new buffers
   " http://vim.wikia.com/wiki/Highlight_unwanted_spaces
   highlight ExtraWhitespace ctermbg=237 guibg=darkgray

   augroup vimmic_highlight_extraWhitespace
      autocmd ColorScheme * highlight ExtraWhitespace ctermbg=237 guibg=darkgray
      autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
      autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
      autocmd InsertLeave * match ExtraWhitespace /\s\+$/
   augroup END
endif

" Status line
""""""""""""""

function! PasteForStatusline()
   let l:paste_status = &paste
   if l:paste_status == 1
      return ' [paste] '
   else
      return ''
   endif
endfunction

" Statusbar layout
set laststatus=2
set statusline+=%#StatusLineLeft#                " different color
set statusline+=%t\                              " tail of the filename
set statusline+=%*\                              " end color
set statusline+=[%{strlen(&fenc)?&fenc:'none'},  " file encoding
set statusline+=%{&ff}]                          " file format
set statusline+=%h                               " help file flag
set statusline+=%y                               " filetype
set statusline+=%m                               " modified flag
set statusline+=%r                               " read only flag
set statusline+=%{PasteForStatusline()}          " paste flag
set statusline+=%=                               " left/right separator
set statusline+=%c,                              " cursor column
set statusline+=%l/%L                            " cursor line/total lines
set statusline+=\ %P\                            " percent through file

if !exists('g:disable_defaultColors')
   " Statusbar colors

   " Main section default colors
   if !exists('g:StatusBG')
      if &termguicolors
         let g:StatusBG='#eeeeee'
      else
         let g:StatusBG='White'
      endif
   endif
   if !exists('g:StatusNCBG')
      if &termguicolors
         let g:StatusNCBG='#263238'
      else
         let g:StatusNCBG='Black'
   endif
   endif
   if !exists('g:StatusNCFG')
      if &termguicolors
         let g:StatusNCFG='#ffffff'
      else
         let g:StatusNCFG='White'
      endif
   endif

   function! StatusLineInitBG()
      if &termguicolors
         execute 'hi StatusLine   gui=bold term=bold cterm=bold guibg='.g:StatusBG
         execute 'hi StatusLineNC gui=none term=none cterm=none guibg='.g:StatusNCBG.' guifg='.g:StatusNCFG
      else
         execute 'hi StatusLine   term=bold cterm=bold ctermbg='.g:StatusBG
         execute 'hi StatusLineNC term=none cterm=none ctermbg='.g:StatusNCBG.' ctermfg='.g:StatusNCFG
      endif
   endfunction

   augroup vimmic_status_init_bg
         autocmd VimEnter,ColorScheme * call StatusLineInitBG()
   augroup END

   " Color changes depending on the current mode
   if !exists('g:StatusNormalFG')
      if &termguicolors
         let g:StatusNormalFG='#263238'
      else
         let g:StatusNormalFG='Black'
      endif
   endif
   if !exists('g:StatusInsertFG')
      if &termguicolors
         let g:StatusInsertFG='#0066ff'
      else
         let g:StatusInsertFG='Blue'
      endif
   endif
   if !exists('g:StatusReplaceFG')
      if &termguicolors
         let g:StatusReplaceFG='#f44336'
      else
         let g:StatusReplaceFG='Red'
      endif
   endif

   function! InsertStatuslineColor(mode)
      if &termguicolors
         "guicolors
         if a:mode ==# 'i'
            execute 'highlight StatusLine guifg='.g:StatusInsertFG
         elseif a:mode ==# 'r'
            execute 'highlight StatusLine guifg='.g:StatusReplaceFG
         else
            execute 'highlight StatusLine guifg='.g:StatusNormalFG
         endif
      else
         if a:mode ==# 'i'
            execute 'highlight StatusLine ctermfg='.g:StatusInsertFG
         elseif a:mode ==# 'r'
            execute 'highlight StatusLine ctermfg='.g:StatusReplaceFG
         else
            execute 'highlight StatusLine ctermfg='.g:StatusNormalFG
         endif
      endif
   endfunction

   augroup vimmic_status_color
      autocmd InsertEnter  * call InsertStatuslineColor(v:insertmode)
      autocmd InsertChange * call InsertStatuslineColor(v:insertmode)
      autocmd InsertLeave  * call InsertStatuslineColor('n')
      autocmd VimEnter * call InsertStatuslineColor('n')
   augroup END

   " Left area of the bar defualt colors
   if !exists('g:StatusLeftBG')
      if &termguicolors
         let g:StatusLeftBG='#263238'
      else
         let g:StatusLeftBG='Black'
      endif
   endif

   if !exists('g:StatusLeftFG')
      if &termguicolors
         let g:StatusLeftFG='#ffffff'
      else
         let g:StatusLeftFG='White'
      endif
   endif

   " This section is linked to the normal StatusLine
   highlight def link StatusLineLeft StatusLine

   function! StatusLineLeftInitBG()
      if &termguicolors
         execute 'highlight StatusLineLeft guibg='.g:StatusLeftBG.' guifg='.g:StatusLeftFG
      else
         execute 'highlight StatusLineLeft ctermbg='.g:StatusLeftBG.' ctermfg='.g:StatusLeftFG
      endif
   endfunction

   augroup vimmic_status_init_left
      autocmd ColorScheme,VimEnter * call StatusLineLeftInitBG()
   augroup END

endif

" Filetype coloration

autocmd BufRead,BufNewFile *.plt set filetype=gnuplot
