" inkarkat/vim-mark
" higlight word under cursor / pattern

let s:pluginName='vim-mark'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

   " Settings
   """"""""""
   let g:mwHistAdd = ''
   let g:mwAutoSaveMarks = 0
   let g:mwAutoLoadMarks = 0
   let g:mwDisableDefaultMapping = 1

   nmap <unique> <Leader>hw <Plug>MarkSet
   xmap <unique> <Leader>hw <Plug>MarkSet
   nmap <unique> <Leader>hr <Plug>MarkRegex
   xmap <unique> <Leader>hr <Plug>MarkRegex
   nmap <unique> <Leader>hC <Plug>MarkClear

   nmap <unique> <Leader>h* <Plug>MarkSearchCurrentNext
   nmap <unique> <Leader>h# <Plug>MarkSearchCurrentPrev
   nmap <unique> <Leader>hn <Plug>MarkSearchAnyNext
   nmap <unique> <Leader>hp <Plug>MarkSearchAnyPrev

   " Theme
   """""""
   " None

else
   if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
      echom s:pluginName.' not found, try :Update'
   endif
endif
