" eugen0329/vim-esearch
" Search in files

let s:pluginName='vim-esearch'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:esearch = {'default_mappings': 1}


    " Shortcut
    """"""""""
        " Start esearch prompt autofilled with one of g:esearch.use initial patterns
    call esearch#map('<leader>/', 'esearch')
    " Start esearch autofilled with a word under the cursor
    call esearch#map('<leader>p/', 'esearch-word-under-cursor')

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
