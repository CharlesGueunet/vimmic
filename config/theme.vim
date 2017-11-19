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
      highlight CursorLine  cterm=NONE ctermbg=233
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
      let g:MarginBG='Black'
   endif
   function! s:PrintMargin()
      let &colorcolumn=join(range(g:MarginPos,300),',')
      execute 'highlight ColorColumn cterm=NONE ctermbg='.g:MarginBG
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

if v:version >= 700 && !exists('g:disable_defaultColors')

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

   " Statusbar colors

   " Color changes depending on the current mode
   if !exists('g:StatusNormalFG')
      if &termguicolors
         let g:StatusNormalFG='#263238'
      else
         let g:StatusNormalFG='White'
      endif
   endif
   if !exists('g:StatusInsertFG')
      let g:StatusInsertFG='Blue'
   endif
   if !exists('g:StatusReplaceFG')
      let g:StatusReplaceFG='Red'
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
            execute 'highlight StatusLine ctermbg='.g:StatusInsertFG
         elseif a:mode ==# 'r'
            execute 'highlight StatusLine ctermbg='.g:StatusReplaceFG
         else
            execute 'highlight StatusLine ctermbg='.g:StatusNormalFG
         endif
      endif
   endfunction

   augroup vimmic_status_color
      autocmd InsertEnter  * call InsertStatuslineColor(v:insertmode)
      autocmd InsertChange * call InsertStatuslineColor(v:insertmode)
      autocmd InsertLeave,VimEnter  * call InsertStatuslineColor('n')
   augroup END

   " Main section default colors
   if !exists('g:StatusBG')
      let g:StatusBG='White'
   endif
   if !exists('g:StatusNCBG')
      let g:StatusNCBG='233'
   endif
   if !exists('g:StatusNCFG')
      let g:StatusNCFG='White'
   endif

   augroup vimmic_status_init_bg
      autocmd VimEnter,ColorScheme * execute 'hi StatusLine  ctermfg='.g:StatusBG
      autocmd VimEnter,ColorScheme * execute 'hi StatusLineNC ctermfg='.g:StatusNCBG.' ctermbg='.g:StatusNCFG
   augroup END
   execute 'hi StatusLine  ctermfg='.g:StatusBG
   execute 'hi StatusLineNC ctermfg='.g:StatusNCBG.' ctermbg='.g:StatusNCFG

   " Left area of the bar defualt colors
   if !exists('g:StatusLeftBG')
      let g:StatusLeftBG='233'
   endif
   " This section is linked to the normal StatusLine
   highlight def link StatusLineLeft StatusLine
   augroup vimmic_status_init_left
      autocmd ColorScheme * execute 'highlight StatusLineLeft ctermbg='.g:StatusLeftBG
   augroup END
   execute 'highlight StatusLineLeft ctermbg='.g:StatusLeftBG


endif

" Filetype coloration

autocmd BufRead,BufNewFile *.plt set filetype=gnuplot
