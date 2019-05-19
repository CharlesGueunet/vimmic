" garbas/vim-snipmate
" replace keyword with parametrable block of code for fast typing

let s:pluginName='neosnippet.vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

   " Settings
   """"""""""
   " SuperTab like snippets behavior.
   " Note: It must be "imap" and "smap".  It uses <Plug> mappings.
   " imap <expr><TAB>
   "          \ pumvisible() ? "\<C-n>" :
   "          \ neosnippet#expandable_or_jumpable() ?
   "          \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
   smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
   " Snipmate
   " let g:neosnippet#enable_snipmate_compatibility = 1

   " Shortcut
   """"""""""
   imap <C-x>s <Plug>(neosnippet_expand_or_jump)
   smap <C-x>s <Plug>(neosnippet_expand_or_jump)
   xmap <C-x>s <Plug>(neosnippet_expand_target)

   " Theme
   """""""
   " None

else
   if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
      echom s:pluginName.' not found, try :Update'
   endif
endif
