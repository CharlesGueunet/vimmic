" zivyangll/git-blame.vim
" Git blame current line

let s:pluginName='git-blame.vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

  " Settings
  """"""""""
  let g:GBlameVirtualTextEnable = 1 " only impact neovim
  let g:GBlameVirtualTextPrefix = ' ⇨  '
  if &termguicolors
    augroup Vimmic_GBlame_COLORS
      autocmd VimEnter * highlight GBlameMSG guifg=#6a6c6c gui=bold
    augroup end
  else
    augroup Vimmic_GBlame_COLORS
      autocmd VimEnter * highlight GBlameMSG ctermfg=gray cterm=bold
    augroup end
  endif


  " Shortcut
  """"""""""
  nnoremap <Leader>gb :<C-u>call gitblame#echo()<CR>


else
  if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
    echom s:pluginName.' not found, try :Update'
  endif
endif
