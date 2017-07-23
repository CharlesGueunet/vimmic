" mbbill/undotree
" Menu pane, display help and shortcut to usefull functions

if dein#util#_check_install('undotree') == 0

    " Settings
    """"""""""
    " enable cursorline (L) and cmdline help (H)
    let g:quickmenu_options = "LH"

    " clear all the items
    call g:quickmenu#reset()
    call g:quickmenu#header("Vimmic: help")

    " Content
    " ------

    " Editor display
    call g:quickmenu#append('# Highlight'                       , '')
    call g:quickmenu#append("Paste mode %{&paste? 'off':'on'}" , "set paste!"               , "enable/disable Paste mode (<F2>)")
    call g:quickmenu#append("Trailing check"                   , ':AirlineToggleWhitespace' , 'enable/disable trailing space check (<F3>)')
    call g:quickmenu#append("Syntax check"                     , ':SyntasticToggleMode'     , 'enable/disable syntax checking (<F4>)')
    call g:quickmenu#append("Parenthesis color"                , ':RainbowToggle'           , 'enable/disable matching parenthesis color (<F5>)')
    call g:quickmenu#append("Turn spell %{&spell? 'off':'on'}" , "set spell!"               , "enable/disable spell check (<F6>)")
    call g:quickmenu#append("Clear right margin"               , ':hi clear ColorColumn'    , 'disable the right margin (<leader>a)')

    " All the help section of Vimmic
    call g:quickmenu#append('# Help'                , '')
    call g:quickmenu#append("Beginner's guide"      , 'help vimmic-beginner'  , "how to start with Vimmic")
    call g:quickmenu#append("Vimmic configuration"  , 'help vimmic-config'    , "change this conf at your convenience")
    call g:quickmenu#append("Plugins configuration" , 'help vimmic-plugins'   , "change or add plugins configuration")
    call g:quickmenu#append("Shortcuts"             , 'help vimmic-shortcuts' , "keys on fire")
    call g:quickmenu#append("Advanced"              , 'help vimmic-advanced'  , "to works on advanced project")

    " Scripts
    call g:quickmenu#append('# Actions'      , '')
    call g:quickmenu#append("Use Tabulation" , ':set noexpandtab'    , 'allow to insert tabulation (:set noexpandtab)')
    call g:quickmenu#append("Check syntax"   , ':SyntasticCheck'     , 'can be done with <leader>c')
    call g:quickmenu#append("Trim Spaces"    , ':%call TrimSpaces()' , 'can be done with <leader>w')

    " Shortcut
    """"""""""
    noremap <silent><F12> :call quickmenu#toggle(0)<cr>

    " Theme
    """""""
    " None

endif
