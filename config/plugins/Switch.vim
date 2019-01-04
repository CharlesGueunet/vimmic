" AndrewRadev/switch.vim
" automatic replace expression

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
                \   },{
                \      'ON': 'OFF',
                \      'OFF': 'ON'
                \   }
                \ ]

    augroup vimmic_switch_define
       autocmd FileType c,cpp let b:switch_custom_definitions = [
                \  {
                \     '\<[a-z0-9]\+_\k\+\>': {
                \       '_\(.\)': '\U\1'
                \     },
                \     '\<[a-z0-9]\+[A-Z]\k\+\>': {
                \       '\([A-Z]\)': '_\l\1'
                \     },
                \  },{
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

       autocmd FileType cmake let b:switch_custom_definitions = [
                \  {
                \     'REQUIRED':'QUIET',
                \     'QUIET':'MODULE',
                \     'MODULE':'REQUIRED',
                \  },{
                \     'STATUS':'WARNING',
                \     'WARNING':'FATAL_ERROR',
                \     'FATAL_ERROR':'AUTHOR_WARNING',
                \     'AUTHOR_WARNING':'SEND_ERROR',
                \     'SEND_ERROR':'DEPRECATION',
                \     'DEPRECATION':'STATUS',
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
