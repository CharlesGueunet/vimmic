" AndrewRadev/switch.vim
" switch between differents expressions

let s:pluginName='switch.vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let b:switch_custom_definitions = [
                \   ['true', 'false'],
                \   {
                \     '\<[a-z0-9]\+_\k\+\>': {
                \       '_\(.\)': '\U\1'
                \     },
                \     '\<[a-z0-9]\+[A-Z]\k\+\>': {
                \       '\([A-Z]\)': '_\l\1'
                \     },
                \   }
                \ ]

    augroup vimmic_switch_define
       autocmd FileType c,cpp let b:switch_custom_definitions = [
                \   {
                \     '\<[a-z0-9]\+_\k\+\>': {
                \       '_\(.\)': '\U\1'
                \     },
                \     '\<[a-z0-9]\+[A-Z]\k\+\>': {
                \       '\([A-Z]\)': '_\l\1'
                \     },
                \   },{
                \     '\(\k\+\)\.': '\1->',
                \     '\(\k\+\)->': '\1.',
                \  },{
                \     '\.': '->',
                \     '->': '.',
                \  },{
                \     '==':'!=',
                \     '!=':'==',
                \  },{
                \     '>=':'>',
                \     '>':'<',
                \     '<':'<=',
                \     '<=':'>=',
                \  },{
                \     '++':'--',
                \     '--':'++',
                \  }
                \ ]
    augroup END

    " Shortcut
    """"""""""
    map <leader>pi :Switch<cr>

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
