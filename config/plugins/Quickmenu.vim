" skywind3000/quickmenu.vim
" Menu pane, display help and shortcut to usefull functions

let s:pluginName='quickmenu.vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " enable cursorline (L) and cmdline help (H)
    let g:quickmenu_options = "LH"
    let g:quickmenu_special_keys = 0

    " HELP PANEL

    " clear all the items
    call g:quickmenu#reset()
    call g:quickmenu#header("Vimmic: help")

    " Editor display
    call g:quickmenu#append('# Highlight'                      , '')
    call g:quickmenu#append("Paste mode %{&paste? 'off':'on'}" , 'set paste!'                , 'enable/disable Paste mode (<F2>)')
    call g:quickmenu#append("Trailing check"                   , ':AirlineToggleWhitespace'  , 'enable/disable trailing space check (<F3>)')
    call g:quickmenu#append("Syntax check"                     , ':SyntasticToggleMode'      , 'enable/disable syntax checking (<F4>)')
    call g:quickmenu#append("Parenthesis color"                , ':RainbowParenthesesToggle' , 'enable/disable matching parenthesis color (<F5>)')
    call g:quickmenu#append("Turn spell %{&spell? 'off':'on'}" , 'set spell!'                , 'enable/disable spell check (<F6>)')
    call g:quickmenu#append("Clear right margin"               , ':hi clear ColorColumn'     , 'disable the right margin (<leader>a)')

    " All the help section of Vimmic
    call g:quickmenu#append('# Help'                , '')
    call g:quickmenu#append("Beginner's guide"      , 'help vimmic-beginner'  , 'how to start with Vimmic')
    call g:quickmenu#append("Vimmic configuration"  , 'help vimmic-config'    , 'change this conf at your convenience')
    call g:quickmenu#append("Plugins configuration" , 'help vimmic-plugins'   , 'change or add plugins configuration')
    call g:quickmenu#append("Shortcuts"             , 'help vimmic-shortcuts' , 'keys on fire')
    call g:quickmenu#append("Advanced"              , 'help vimmic-advanced'  , 'to works on advanced project')

    " Scripts
    call g:quickmenu#append('# Actions'      , '')
    call g:quickmenu#append("Use Tabulation" , ':set noexpandtab'    , 'allow to insert tabulation (:set noexpandtab)')
    call g:quickmenu#append("Check syntax"   , ':SyntasticCheck'     , 'can be done with <leader>c')
    call g:quickmenu#append("Trim Spaces"    , ':%call TrimSpaces()' , 'can be done with <leader>w')

    " LEADER PANEL

    " clear all the items
    call g:quickmenu#current(1)
    call g:quickmenu#header('Vimmic: Leader')

    " Editor display
    call g:quickmenu#append('# Composer'          , '')
    call g:quickmenu#append("Buffer manipulation" , ':call quickmenu#toggle(2)'   , 'Change / Search buffer' , '' , 0 , 'b')
    call g:quickmenu#append("Nerd Tree"           , ':call quickmenu#toggle(3)  ' , 'File explorer'          , '' , 0 , 'n')
    call g:quickmenu#append("Git/SVN"             , ':call quickmenu#toggle(4)'   , 'Version control'        , '' , 0 , 'g')
    call g:quickmenu#append("Algin"               , ':call quickmenu#toggle(5)'   , 'Tabularize'             , '' , 0 , 'a')

    call g:quickmenu#append('# Direct'                , '')
    call g:quickmenu#append("Undo"                  , ':UndoTreeToggle'   , 'Show the undo tree'     , '' , 0 , 'u')
    call g:quickmenu#append("Tag bar"               , ':TagbarToggle  '   , 'Show tag in buffer'     , '' , 0 , 't')

    " BUFFER PANEL

    " clear all the items
    call g:quickmenu#current(2)
    call g:quickmenu#header("Vimmic: Buffers")

    " Editor display
    call g:quickmenu#append("File find"   , ':CtrlP'       , 'Open new file'               , '' , 0 , 'f')
    call g:quickmenu#append("Buffer find" , ':CtrlPBuffer' , 'Open buffers'                , '' , 0 , 'b')
    call g:quickmenu#append("Mixed find"  , ':CtrlPMixed'  , 'Mixed find: buffer / files ' , '' , 0 , 'm')
    call g:quickmenu#append("Tag find"    , ':CtrlPBufTag' , 'Tags in current buffer'      , '' , 0 , 't')
    call g:quickmenu#append("Line find"   , ':CtrlPLine'   , 'Line in current buffer'      , '' , 0 , 'l')

    " FILE EXPLORER PANEL

    " clear all the items
    call g:quickmenu#current(3)
    call g:quickmenu#header("Vimmic: File explorer")

    " Editor display
    call g:quickmenu#append("Toggle pane"       , ':NERDTreeToggle' , 'open/close'            , '' , 0 , 't')
    call g:quickmenu#append("Find current file" , ':NERDTreeFind'   , 'open with cursor here' , '' , 0 , 'f')

    " VERSIONING PANEL

    " clear all the items
    call g:quickmenu#current(4)
    call g:quickmenu#header("Vimmic: Versioning")

    " Editor display
    call g:quickmenu#append("Diff current hunk" , ':GitGutterPreviewHunk' , 'show current diff'   , '' , 0 , 'd')
    call g:quickmenu#append("Previous hunk"     , ':GitGutterPrevHunk'    , 'go to previous hunk' , '' , 0 , 'p')
    call g:quickmenu#append("Next hunk"         , ':GitGutterNextHunk'    , 'go to next hunk'     , '' , 0 , 'n')
    call g:quickmenu#append("Revert hunk"       , ':GitGutterRevertHunk'  , 'revert current hunk' , '' , 0 , 'r')

    " ALIGN PANEL

    " clear all the items
    call g:quickmenu#current(5)
    call g:quickmenu#header("Vimmic: Align")

    " Editor display
    call g:quickmenu#append("Align :" , ':Tabularize /:' , 'Tablularize' , '' , 0 , ':')
    call g:quickmenu#append("Align &" , ':Tabularize /&' , 'Tablularize' , '' , 0 , '&')
    call g:quickmenu#append("Align ." , ':Tabularize /.' , 'Tablularize' , '' , 0 , '.')
    call g:quickmenu#append("Align ," , ':Tabularize /,' , 'Tablularize' , '' , 0 , ',')
    call g:quickmenu#append("Align =" , ':Tabularize /=' , 'Tablularize' , '' , 0 , '=')
    " Shortcut
    """"""""""
    noremap <silent><F12> :call quickmenu#toggle(0)<cr>
    noremap <silent><leader><leader><leader> :call quickmenu#toggle(1)<cr>

    " Theme
    """""""
    " None

else
    if index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
