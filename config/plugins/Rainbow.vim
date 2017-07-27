" luochen1990/rainbow
" Color mathching parenthesis, brackets, ...

let s:pluginName='rainbow'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:rainbow_active = 1     "0 if you want to enable it later via :RainbowToggle"
    let g:rainbow_conf = {
                \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
                \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightgreen', 'lightmagenta', 'lightgray', 'lightred'],
                \   'operators': '_,\|;\|==\|!=\|>=\|<=\|=\|->\|\.\|+\|-\|*\|&\|||\|>\|<\|!_',
                \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
                \   'separately': {
                \       '*': {},
                \       'tex': {
                \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/'],
                \       },
                \       'lisp': {
                \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
                \       },
                \       'vim': {
                \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
                \       },
                \       'html': {
                \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
                \       },
                \       'css': 0,
                \   }
                \}

    " Shortcut
    """"""""""
    nmap <F5> :RainbowToggle<CR>

    " Theme
    """""""
    " None

else
    silent echom s:pluginName.' not found, try :Update'
endif
