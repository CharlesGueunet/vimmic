" kien/rainbow_parentheses.vim
" Color mathching parenthesis, brackets, ...

let s:pluginName='rainbow_parentheses.vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " Always on
    augroup vimmic_rainbow
       au VimEnter * RainbowParenthesesToggle
       au Syntax * RainbowParenthesesLoadRound
       au Syntax * RainbowParenthesesLoadSquare
       au Syntax * RainbowParenthesesLoadBraces
    augroup END

    " Shortcut
    """"""""""
    nmap <F1> :RainbowParenthesesToggle<CR>

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
