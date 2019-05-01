" This file deals withs colors

" Editor
""""""""
if !exists('g:Vimmic_DisableDefaultColors')
   " default vim
   colorscheme default

   highlight clear VertSplit
   highlight clear SignColumn
   highlight clear LineNr
   highlight clear Conceal

   augroup vimmic_highlight_clean
      autocmd ColorScheme * highlight clear VertSplit
      autocmd ColorScheme * highlight clear SignColumn
      autocmd ColorScheme * highlight clear LineNr
   augroup end

   let g:Vimmic_IncSearch = get(g:, 'Vimmic_IncSearch', 'Red')

   " Cursor, separator, folded, num col ...
   function! s:EditorColors()
      highlight clear VertSplit
      highlight CursorLine  cterm=NONE ctermbg=233 guibg=#162228
      highlight clear SignColumn
      highlight Folded ctermbg=233
      highlight Search ctermfg=Yellow ctermbg=NONE cterm=bold,underline
      highlight clear IncSearch
      " highlight current word color
      if &termguicolors
         execute 'highlight IncSearch guibg=NONE ctermbg=NONE guifg='.g:Vimmic_IncSearch
      else
         execute 'highlight IncSearch guibg=NONE ctermbg=NONE ctermfg='.g:Vimmic_IncSearch
      endif
      " fix for xterm shell
      if !has('gui_running')
         highlight Normal ctermbg=NONE guibg=NONE
         if &termguicolors
            let g:Vimmic_DefaultBG = get(g:, 'Vimmic_DefaultBG', '#263238')
            execute 'highlight Terminal    guibg='.g:Vimmic_DefaultBG
            execute 'highlight TabLine     guibg='.g:Vimmic_MarginBG
            execute 'highlight TabLineFill guibg='.g:Vimmic_MarginBG
            execute 'highlight TabLineSel  guibg='.g:Vimmic_DefaultBG
         else
            let g:Vimmic_DefaultBG = get(g:, 'Vimmic_DefaultBG', 'Black')
            execute 'highlight Terminal    ctermbg='.g:Vimmic_DefaultBG
            execute 'highlight TabLine     ctermbg='.g:Vimmic_MarginBG
            execute 'highlight TabLineFill ctermbg='.g:Vimmic_MarginBG
            execute 'highlight TabLineSel  ctermbg='.g:Vimmic_DefaultBG
         endif
      endif

      " Termdebug
      highlight debugPC term=reverse ctermbg=darkred guibg=darkred
      highlight debugBreakpoint term=reverse ctermfg=Yellow guifg=Yellow
   endfunction

   " Completion menu
   function! s:PmenuColors()
      highlight Pmenu      ctermfg=White     ctermbg=Black
      highlight PmenuSel   ctermfg=Black     ctermbg=DarkBlue
      highlight PmenuSbar  ctermfg=none      ctermbg=Green
      highlight PmenuThumb ctermfg=DarkBlue ctermbg=DarkBlue
   endfunction

   " Dark margin at 120 char
   let g:Vimmic_MarginPos = get(g:, 'Vimmic_MarginPos', '120')
   if &termguicolors
      let g:Vimmic_MarginBG = get(g:, 'Vimmic_MarginBG', '#162228')
   else
      let g:Vimmic_MarginBG = get(g:, 'Vimmic_MarginBG', 'Black')
   endif

   function! s:PrintMargin()
      let &colorcolumn=join(range(g:Vimmic_MarginPos,g:Vimmic_MarginPos+400),',')
      if &termguicolors
         execute 'highlight ColorColumn cterm=NONE guibg='.g:Vimmic_MarginBG
      else
         execute 'highlight ColorColumn cterm=NONE ctermbg='.g:Vimmic_MarginBG
      endif
   endfunction

   " Apply these colors
   augroup Vimmic_colors
      autocmd!
      autocmd VimEnter,ColorScheme * call s:PmenuColors()
      autocmd VimEnter,ColorScheme * call s:EditorColors()
      if !exists('g:Vimmic_DisableMargin')
         autocmd VimEnter,ColorScheme * call s:PrintMargin()
      endif
   augroup end

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
   augroup end
endif

" Status line
""""""""""""""

function! StatusGitBranch()
  let l:gitBranch = ''
  if exists('*FugitiveStatusline')
    let l:gitBranch = FugitiveStatusline()
  endif

  return l:gitBranch
endfunction

function! StatusPasteMode()
   let l:paste_status = ''
   if &paste == 1
      let l:paste_status = '[paste] '
   endif

   return l:paste_status
endfunction

function! StatusWarning()
  let l:warn = ''
  if exists('*LinterStatusWarn')
    let l:warn = LinterStatusWarn()
  endif

  return l:warn
endfunction

function! StatusErrors()
  let l:err = ''
  if exists('*LinterStatusErr')
    let l:err = LinterStatusErr()
  endif

  return l:err
endfunction


" Statusbar layout
set laststatus=2
set statusline=""
set statusline+=%#StatusLineLeft#                " different color
set statusline+=%t\                              " tail of the filename
set statusline+=%*\                              " end color
set statusline+=[%{strlen(&fenc)?&fenc:'none'},  " file encoding
set statusline+=%{&ff}]                          " file format
set statusline+=%h                               " help file flag
set statusline+=%y                               " filetype
set statusline+=%m                               " modified flag
set statusline+=%r                               " read only flag
set statusline+=%{StatusGitBranch()}             " git branch with fugitive
set statusline+=%{StatusPasteMode()}             " paste flag
set statusline+=%=                               " left/right separator
set statusline+=%{StatusWarning()}
set statusline+=%{StatusErrors()}
set statusline+=\ 
set statusline+=%c,                              " cursor column
set statusline+=%l/%L                            " cursor line/total lines
set statusline+=\ %P\                            " percent through file

if !exists('g:Vimmic_DisableDefaultColors')
   " Statusbar colors

   " Main section default colors
   if &termguicolors
      let g:Vimmic_StatusBG   = get(g:, 'Vimmic_StatusBG'  , '#eeeeee')
      let g:Vimmic_StatusNCBG = get(g:, 'Vimmic_StatusNCBG', '#263238')
      let g:Vimmic_StatusNCFG = get(g:, 'Vimmic_StatusNCFG', '#ffffff')
   else
      let g:Vimmic_StatusBG   = get(g:, 'Vimmic_StatusBG'  , 'White')
      let g:Vimmic_StatusNCBG = get(g:, 'Vimmic_StatusNCBG', 'Black')
      let g:Vimmic_StatusNCFG = get(g:, 'Vimmic_StatusNCFG', 'White')
   endif

   function! StatusLineInitBG()
      if &termguicolors
         execute 'highlight StatusLine   gui=bold term=bold cterm=bold guibg='.g:Vimmic_StatusBG
         execute 'highlight StatusLineNC gui=none term=none cterm=none guibg='.g:Vimmic_StatusNCBG.' guifg='.g:Vimmic_StatusNCFG

         execute 'highlight ToolbarLine   gui=bold term=bold cterm=bold guibg='.g:Vimmic_StatusNCBG
         execute 'highlight ToolbarButton gui=none term=none cterm=none guibg='.g:Vimmic_StatusBG.' guifg='.g:Vimmic_StatusNCFG
      else
         execute 'highlight StatusLine   term=bold cterm=bold ctermbg='.g:Vimmic_StatusBG
         execute 'highlight StatusLineNC term=none cterm=none ctermbg='.g:Vimmic_StatusNCBG.' ctermfg='.g:Vimmic_StatusNCFG

         execute 'highlight ToolbarLine   term=bold cterm=bold ctermbg='.g:Vimmic_StatusNCBG
         execute 'highlight ToolbarButton term=none cterm=none ctermbg='.g:Vimmic_StatusBG.' ctermfg='.g:Vimmic_StatusNCFG
      endif
   endfunction

   augroup vimmic_status_init_bg
      autocmd VimEnter,ColorScheme * call StatusLineInitBG()
   augroup end

   " Color changes depending on the current mode
   if &termguicolors
      let g:Vimmic_StatusNormalFG   = get(g:, 'Vimmic_StatusNormalFG'  , '#263238')
      let g:Vimmic_StatusInsertFG   = get(g:, 'Vimmic_StatusInsertFG'  , '#0066ff')
      let g:Vimmic_StatusReplaceFG  = get(g:, 'Vimmic_StatusReplaceFG' , '#f44336')
      let g:Vimmic_StatusTerminalFG = get(g:, 'Vimmic_StatusTerminalFG', '#6b9468')
   else
      let g:Vimmic_StatusNormalFG   = get(g:, 'Vimmic_StatusNormalFG'  , 'Black')
      let g:Vimmic_StatusInsertFG   = get(g:, 'Vimmic_StatusInsertFG'  , 'Blue')
      let g:Vimmic_StatusReplaceFG  = get(g:, 'Vimmic_StatusReplaceFG' , 'Red')
      let g:Vimmic_StatusTerminalFG = get(g:, 'Vimmic_StatusTerminalFG', 'Green')
   endif

   function! InsertStatuslineColor(mode)
      if &termguicolors
         "guicolors
         if a:mode ==# 'i'
            execute 'highlight StatusLine guifg='.g:Vimmic_StatusInsertFG
         elseif a:mode ==# 'r'
            execute 'highlight StatusLine guifg='.g:Vimmic_StatusReplaceFG
         else
            execute 'highlight StatusLine guifg='.g:Vimmic_StatusNormalFG
         endif
      else
         if a:mode ==# 'i'
            execute 'highlight StatusLine ctermfg='.g:Vimmic_StatusInsertFG
         elseif a:mode ==# 'r'
            execute 'highlight StatusLine ctermfg='.g:Vimmic_StatusReplaceFG
         else
            execute 'highlight StatusLine ctermfg='.g:Vimmic_StatusNormalFG
         endif
      endif
   endfunction

   augroup vimmic_status_color
      autocmd InsertEnter  * call InsertStatuslineColor(v:insertmode)
      autocmd InsertChange * call InsertStatuslineColor(v:insertmode)
      autocmd InsertLeave  * call InsertStatuslineColor('n')
      autocmd VimEnter * call InsertStatuslineColor('n')
   augroup end

   " Left area of the bar defualt colors
   " Change for blue to red if root user
   if &termguicolors
      if $USER ==# 'root'
         let g:Vimmic_StatusLeftBG = get(g:, 'Vimmic_StatusLeftBG', '#dd7186')
      else
         let g:Vimmic_StatusLeftBG = get(g:, 'Vimmic_StatusLeftBG', '#263238')
      endif
      let g:Vimmic_StatusLeftFG = get(g:, 'Vimmic_StatusLeftFG', '#ffffff')
   else
      if $USER ==# 'root'
         let g:Vimmic_StatusLeftBG = get(g:, 'Vimmic_StatusLeftBG', '1')
      else
         let g:Vimmic_StatusLeftBG = get(g:, 'Vimmic_StatusLeftBG', '4')
      endif
      let g:Vimmic_StatusLeftFG = get(g:, 'Vimmic_StatusLeftFG', 'White')
   endif

   " This section is linked to the normal StatusLine
   " highlight def link StatusLineLeft StatusLine

   function! StatusLineLeftInit()
      if &termguicolors
         execute 'highlight StatusLineLeft guibg='.g:Vimmic_StatusLeftBG.' guifg='.g:Vimmic_StatusLeftFG
         execute 'highlight StatusLineTerm guibg='.g:Vimmic_StatusBG.' guifg='.g:Vimmic_StatusTerminalFG
         execute 'highlight StatusLineTermNC guibg='.g:Vimmic_StatusNCBG.' guifg='.g:Vimmic_StatusTerminalFG
      else
         execute 'highlight StatusLineLeft ctermbg='.g:Vimmic_StatusLeftBG.' ctermfg='.g:Vimmic_StatusLeftFG
         execute 'highlight StatusLineTerm ctermbg='.g:Vimmic_StatusNCBG.' ctermfg='.g:Vimmic_StatusTerminalFG
      endif
   endfunction

   augroup vimmic_status_init
      autocmd ColorScheme,VimEnter * call StatusLineLeftInit()
   augroup end

endif

