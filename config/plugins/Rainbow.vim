" luochen1990/rainbow
" Color mathching parenthesis, brackets, ...

let s:pluginName='rainbow'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:rainbow_active = 0
    augroup RainbowParentheseEnable
        autocmd FileType c,cpp,go,ruby,javascript RainbowToggleOn
    augroup end


    " Shortcut
    """"""""""
    nnoremap <leader>hb :RainbowToggle<CR>

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
