" airblade/vim-gitgutter
" Git changes indicators and diff

let s:pluginName='vim-gitgutter'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

  " Settings
  """"""""""
  let g:gitgutter_override_sign_column_highlight = 0
  let g:gitgutter_sign_priority = 1

  " In vimrc.postconf
  " let g:gitgutter_sign_added              = '│'
  " let g:gitgutter_sign_modified           = '│'
  " let g:gitgutter_sign_removed            = '│'
  " let g:gitgutter_sign_removed_first_line = '.'
  " let g:gitgutter_sign_modified_removed   = '├'

  " Shortcut
  """"""""""
  map <leader>gt :GitGutterToggle<cr>
  " diff from git
  map <leader>gd :GitGutterPreviewHunk<cr>
  " highlight different lines
  map <leader>gh :GitGutterLineHighlightsToggle<cr>
  " Revert this section from git
  map <leader>gr :GitGutterUndoHunk<cr>
  "go to previous/next hunk
  map <leader>gp :GitGutterPrevHunk<cr>
  map <leader>gn :GitGutterNextHunk<cr>

  " scope: current git chunk
  omap ig <Plug>GitGutterTextObjectInnerPending
  omap ag <Plug>GitGutterTextObjectOuterPending
  xmap ig <Plug>GitGutterTextObjectInnerVisual
  xmap ag <Plug>GitGutterTextObjectOuterVisual

  " Theme
  """""""
  function! s:GitgutterColors()
    highlight GitGutterAdd ctermbg=none ctermfg=green
    highlight GitGutterChange ctermbg=none ctermfg=yellow
    highlight GitGutterChangeDelete ctermbg=none ctermfg=yellow
    highlight GitGutterDelete ctermbg=none ctermfg=red
    highlight GitGutterAddLine ctermbg=22
    highlight GitGutterChangeLine ctermbg=94
    highlight GitGutterDeleteLine ctermbg=88
  endfunction

  if !exists('g:disable_defaultColors')
    autocmd VimEnter,ColorScheme * call s:GitgutterColors()
  endif

else
  if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
    echom s:pluginName.' not found, try :Update'
  endif
endif
