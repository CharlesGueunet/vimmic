" Shougo/deoplete
" Asynchronous completion

let s:pluginName='deoplete.nvim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

  " Settings
  """"""""""
  let g:deoplete#enable_at_startup = 1
  call deoplete#custom#option({
        \ 'auto_complete_delay': 300,
        \ 'smart_case': v:true,
        \ 'on_insert_enter': v:false,
        \ 'refresh_always': v:false,
        \ })


    " Shortcut
    """"""""""
    " None

    " Theme
    """""""
    " None

else
    if has('python') && g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
