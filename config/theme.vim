" This file deals withs colors

" Editor
""""""""
if !exists('g:Vimmic_DisableDefaultColors')

  " Define base colors
  if &termguicolors
    let g:Vimmic_none    = get(g:, 'Vimmic_none',    'NONE')
    let g:Vimmic_black   = get(g:, 'Vimmic_black',   'Black')
    let g:Vimmic_black2  = get(g:, 'Vimmic_black2',  'DarkGray')
    let g:Vimmic_red     = get(g:, 'Vimmic_red',     'Red')
    let g:Vimmic_green   = get(g:, 'Vimmic_green',   'Green')
    let g:Vimmic_yellow  = get(g:, 'Vimmic_yellow',  'Yellow')
    let g:Vimmic_blue    = get(g:, 'Vimmic_blue',    'Blue')
    let g:Vimmic_magenta = get(g:, 'Vimmic_magenta', 'Mangenta')
    let g:Vimmic_cyan    = get(g:, 'Vimmic_cyan',    'Cyan')
    let g:Vimmic_white   = get(g:, 'Vimmic_white',   'White')
  else
    let g:Vimmic_none    = get(g:, 'Vimmic_none',    'NONE')
    let g:Vimmic_black   = get(g:, 'Vimmic_black',   '0')
    let g:Vimmic_black2  = get(g:, 'Vimmic_black2',  '8')
    let g:Vimmic_red     = get(g:, 'Vimmic_red',     '1')
    let g:Vimmic_green   = get(g:, 'Vimmic_green',   '2')
    let g:Vimmic_yellow  = get(g:, 'Vimmic_yellow',  '3')
    let g:Vimmic_blue    = get(g:, 'Vimmic_blue',    '4')
    let g:Vimmic_magenta = get(g:, 'Vimmic_magenta', '5')
    let g:Vimmic_cyan    = get(g:, 'Vimmic_cyan',    '6')
    let g:Vimmic_white   = get(g:, 'Vimmic_white',   '7')
  endif

  " Cleanup some default
  augroup vimmic_highlight_clean
    autocmd VimEnter,ColorScheme * highlight clear Normal
    autocmd VimEnter,ColorScheme * highlight clear IncSearch
    autocmd VimEnter,ColorScheme * highlight clear Search
    autocmd VimEnter,ColorScheme * highlight clear CursorLine
    autocmd VimEnter,ColorScheme * highlight clear CursorLineNr
    autocmd VimEnter,ColorScheme * highlight clear LineNr
    autocmd VimEnter,ColorScheme * highlight clear SignColumn
    autocmd VimEnter,ColorScheme * highlight clear Visual
    autocmd VimEnter,ColorScheme * highlight clear VertSplit
    autocmd VimEnter,ColorScheme * highlight clear Conceal
  augroup end

  " Elements colors
  function! s:EditorColors()
    if &termguicolors
      let l:termbg='guibg'
      let l:termfg='guifg'
    else
      let l:termbg='ctermbg'
      let l:termfg='ctermfg'
    endif

    execute 'highlight Normal          '.l:termbg.'='.g:Vimmic_none
    execute 'highlight IncSearch       cterm=bold   '.l:termfg.'='.g:Vimmic_red
    execute 'highlight Search          cterm=bold   '.l:termfg.'='.g:Vimmic_yellow
    execute 'highlight DiffAdd         cterm=bold   '.l:termfg.'='.g:Vimmic_green
    execute 'highlight CursorLine      cterm=underline'
    execute 'highlight CursorLineNr    cterm=bold   '.l:termfg.'='.g:Vimmic_blue
    execute 'highlight LineNr          '.l:termfg.'='.g:Vimmic_yellow
    execute 'highlight Folded          '.l:termbg.'='.g:Vimmic_none
    execute 'highlight TermCursor      '.l:termbg.'='.g:Vimmic_black2
    execute 'highlight SignColumn      '.l:termbg.'='.g:Vimmic_none
    execute 'highlight Visual          cterm=bold    cterm=reverse'
    execute 'highlight debugPC         term=reverse ctermbg=darkred guibg=darkred'
    execute 'highlight debugBreakpoint term=reverse ctermfg=Yellow  guifg=Yellow'
    " Completion menu
    execute 'highlight Pmenu      '.l:termfg.'='.g:Vimmic_white.' 'l:termbg.'='.g:Vimmic_black
    execute 'highlight PmenuSel   '.l:termfg.'='.g:Vimmic_blue.'  'l:termbg.'='.g:Vimmic_black
    execute 'highlight PmenuSbar  '.l:termfg.'='.g:Vimmic_none.'  'l:termbg.'='.g:Vimmic_green
    execute 'highlight PmenuThumb '.l:termfg.'='.g:Vimmic_none.'  'l:termbg.'='.g:Vimmic_black

    " fix for xterm shell
    if !has('gui_running')
      execute 'highlight Terminal    '.l:termbg.'='.g:Vimmic_black
      execute 'highlight TabLine     '.l:termbg.'='.g:Vimmic_black2
      execute 'highlight TabLineFill '.l:termbg.'='.g:Vimmic_black2
      execute 'highlight TabLineSel  '.l:termbg.'='.g:Vimmic_black
    endif

  endfunction

   " Apply these colors
   augroup Vimmic_colors
      autocmd!
      autocmd VimEnter,ColorScheme * call s:EditorColors()
      if !exists('g:Vimmic_DisableMargin')
         autocmd VimEnter,ColorScheme * call s:PrintMargin()
      endif
   augroup end

   " Dark margin at 120 char
   let g:Vimmic_MarginPos = get(g:, 'Vimmic_MarginPos', '120')
   let g:Vimmic_MarginBG = get(g:, 'Vimmic_MarginBG', g:Vimmic_black2)

   function! s:PrintMargin()
      let &colorcolumn=join(range(g:Vimmic_MarginPos,g:Vimmic_MarginPos+1),',')
      if &termguicolors
         execute 'highlight ColorColumn cterm=NONE guibg='.g:Vimmic_MarginBG
      else
         execute 'highlight ColorColumn cterm=NONE ctermbg='.g:Vimmic_MarginBG
      endif
   endfunction


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
    let l:innerStatus = matchstr(l:gitBranch, 'Git(\zs.*\ze)')
    if !empty(l:innerStatus)
      let l:gitBranch = '[git:'.l:innerStatus.']'
    endif
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
set statusline+=%{StatusGitBranch()}             " git branch with fugitive
set statusline+=%{StatusPasteMode()}             " paste flag
set statusline+=%m                               " modified flag
set statusline+=%r                               " read only flag
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
   let g:Vimmic_StatusBG   = get(g:, 'Vimmic_StatusBG'  , g:Vimmic_black)
   let g:Vimmic_StatusNCBG = get(g:, 'Vimmic_StatusNCBG', g:Vimmic_black2)
   let g:Vimmic_StatusNCFG = get(g:, 'Vimmic_StatusNCFG', g:Vimmic_white)

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
   let g:Vimmic_StatusNormalFG   = get(g:, 'Vimmic_StatusNormalFG'  , g:Vimmic_white)
   let g:Vimmic_StatusInsertFG   = get(g:, 'Vimmic_StatusInsertFG'  , g:Vimmic_blue)
   let g:Vimmic_StatusReplaceFG  = get(g:, 'Vimmic_StatusReplaceFG' , g:Vimmic_red)
   let g:Vimmic_StatusTerminalFG = get(g:, 'Vimmic_StatusTerminalFG', g:Vimmic_green)

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
    if $USER ==# 'root'
        let g:Vimmic_StatusLeftBG = get(g:, 'Vimmic_StatusLeftBG', g:Vimmic_red)
    else
        let g:Vimmic_StatusLeftBG = get(g:, 'Vimmic_StatusLeftBG', g:Vimmic_blue)
    endif
    let g:Vimmic_StatusLeftFG = get(g:, 'Vimmic_StatusLeftFG', g:Vimmic_black)

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

