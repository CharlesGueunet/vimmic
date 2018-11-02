" skywind3000/quickmenu.vim
" Menu pane, display help and shortcut to usefull functions

let s:pluginName='quickmenu.vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    "'''''''''
    " enable cursorline (L) and cmdline help (H) for left panel, use (T)
    let g:quickmenu_options = 'LH'
    let g:quickmenu_special_keys = 0

    " HELP PANEL

    call g:quickmenu#reset()
    call g:quickmenu#header('Vimmic: help')

    call g:quickmenu#append('# Highlight'                      , '')
    call g:quickmenu#append('Parenthesis color'                , 'RainbowParenthesesToggle'                 , 'enable/disable matching parenthesis color (<F1>)')
    call g:quickmenu#append('Paste mode %{&paste? "off":"on"}' , 'set paste!'                               , 'enable/disable Paste mode (<F2>)')
    call g:quickmenu#append('Trailing check'                   , 'AirlineToggleWhitespace'                  , 'enable/disable trailing space check (<F3>)')
    call g:quickmenu#append('Syntax check'                     , 'ALEToggle'                                , 'enable/disable syntax checking (<F4>)')
    call g:quickmenu#append('Turn spell %{&spell? "off":"on"}' , 'set spell!'                               , 'enable/disable spell check (<F6>)')
    call g:quickmenu#append('Clear right margin'               , 'hi clear ColorColumn'                     , 'disable the right margin (<leader>ic)')
    call g:quickmenu#append('Word under cursor highlight stop' , 'let g:disable_highlightWordUnderCursor=1' , 'disable word highlight (<leader>iw)')

    call g:quickmenu#append('# Help'                , '')
    call g:quickmenu#append('Beginner s guide'      , 'help vimmic-beginner'  , 'how to start with Vimmic')
    call g:quickmenu#append('Vimmic configuration'  , 'help vimmic-config'    , 'change this conf at your convenience')
    call g:quickmenu#append('Plugins configuration' , 'help vimmic-plugins'   , 'change or add plugins configuration')
    call g:quickmenu#append('Shortcuts'             , 'help vimmic-shortcuts' , 'keys on fire')
    call g:quickmenu#append('Advanced'              , 'help vimmic-advanced'  , 'to works on advanced project')

    call g:quickmenu#append('# Actions'      , '')
    call g:quickmenu#append('Use Tabulation' , 'set noexpandtab'    , 'allow to insert tabulation (:set noexpandtab)')
    call g:quickmenu#append('Check syntax'   , 'SyntasticCheck'     , 'can be done with <leader>sc')
    call g:quickmenu#append('Trim Spaces'    , '%call TrimSpaces()' , 'can be done with <leader>pt')

    " LEADER PANEL

    call g:quickmenu#current(1)
    call g:quickmenu#reset()
    call g:quickmenu#header('Vimmic: Leader')

    call g:quickmenu#append('# Composed'          , '')
    call g:quickmenu#append('Window manipulation' , 'call quickmenu#bottom(2)'  , 'New tab / split / resize' , '' , 0 , 'w')
    call g:quickmenu#append('Buffer manipulation' , 'call quickmenu#bottom(3)'  , 'Change / Search buffer'   , '' , 0 , 'b')
    call g:quickmenu#append('Interface'           , 'call quickmenu#bottom(4)'  , 'Interface options'        , '' , 0 , 'i')
    call g:quickmenu#append('Nerd Tree'           , 'call quickmenu#bottom(5)'  , 'File explorer'            , '' , 0 , 'n')
    call g:quickmenu#append('Git/SVN'             , 'call quickmenu#bottom(6)'  , 'Version control'          , '' , 0 , 'g')
    call g:quickmenu#append('Make'                , 'call quickmenu#bottom(7)'  , 'Make/Cmake control'       , '' , 0 , 'm')
    call g:quickmenu#append('Syntax check'        , 'call quickmenu#bottom(8)'  , 'Error/warning display'    , '' , 0 , 's')
    call g:quickmenu#append('Process'             , 'call quickmenu#bottom(9)'  , 'Text manipulation'        , '' , 0 , 'p')
    call g:quickmenu#append('Comment'             , 'call quickmenu#bottom(10)' , 'NerdComment'              , '' , 0 , 'c')
    call g:quickmenu#append('Align'               , 'call quickmenu#bottom(11)' , 'Blockwise'                , '' , 0 , 'a')
    if exists(":Termdebug")
       call g:quickmenu#append('Debug'            , 'call quickmenu#bottom(13)' , 'Debug (gdb)'              , '' , 0 , 'd')
    endif
    call g:quickmenu#append('# Direct'            , '')
    call g:quickmenu#append('Undo'                , 'UndotreeToggle'            , 'Show the undo tree'       , '' , 0 , 'u')
    call g:quickmenu#append('Tag bar'             , 'TagbarToggle '             , 'Show tag in buffer'       , '' , 0 , 't')


    " WINDOW PANEL

    call g:quickmenu#current(2)
    call g:quickmenu#reset()
    call g:quickmenu#header('Vimmic: Window')
    call g:quickmenu#append('New tab'          , 'tabnew'        , 'split current buffer'  , '' , 0 , 't')
    call g:quickmenu#append('Horizontal split' , 'split'         , 'split current buffer'  , '' , 0 , 'h')
    call g:quickmenu#append('Vertical split'   , 'vsplit'        , 'split current buffer'  , '' , 0 , 'v')
    call g:quickmenu#append('Only current'     , 'only'          , 'keep only current view', '' , 0 , 'o')
    call g:quickmenu#append('Window choose'    , 'ChooseWin'     , 'Window switcher'       , '' , 0 , 'w')
    call g:quickmenu#append('Swap window'      , 'ChooseWinSwap' , 'Move current window'   , '' , 0 , 's')

    " BUFFER PANEL

    call g:quickmenu#current(3)
    call g:quickmenu#reset()
    call g:quickmenu#header('Vimmic: Buffers')
    call g:quickmenu#append('File find'      , 'CtrlP'                      , 'Open new file'               , '' , 0 , 'f')
    call g:quickmenu#append('Buffer find'    , 'CtrlPBuffer'                , 'Open buffers'                , '' , 0 , 'b')
    call g:quickmenu#append('Mixed find'     , 'CtrlPMixed'                 , 'Mixed find: buffer / files ' , '' , 0 , 'm')
    call g:quickmenu#append('Tag find'       , 'CtrlPBufTag'                , 'Tags in current buffer'      , '' , 0 , 't')
    call g:quickmenu#append('Line find'      , 'CtrlPLine'                  , 'Line in current buffer'      , '' , 0 , 'l')
    call g:quickmenu#append('Vertical new'   , 'BufExplorerVerticalSplit'   , 'With buffer list'            , '' , 0 , 'v')
    call g:quickmenu#append('Horizontal new' , 'BufExplorerHorizontalSplit' , 'With buffer list'            , '' , 0 , 'h')

    " INTERFACE PANEL

    call g:quickmenu#current(4)
    call g:quickmenu#reset()
    call g:quickmenu#header('Vimmic: Interface')
    call g:quickmenu#append('Colum highlight stop'             , 'hi clear ColorColumn'                     , 'Irreversible ' , '' , 0 , 'c')
    call g:quickmenu#append('Word under cursor highlight stop' , 'let g:disable_highlightWordUnderCursor=1' , 'Irreversible'  , '' , 0 , 'w')

    " FILE EXPLORER PANEL

    call g:quickmenu#current(5)
    call g:quickmenu#reset()
    call g:quickmenu#header('Vimmic: File explorer')
    call g:quickmenu#append('Toggle pane'       , 'NERDTreeToggle' , 'open/close'            , '' , 0 , 't')
    call g:quickmenu#append('Find current file' , 'NERDTreeFind'   , 'open with cursor here' , '' , 0 , 'f')

    " VERSIONING PANEL

    call g:quickmenu#current(6)
    call g:quickmenu#reset()
    call g:quickmenu#header('Vimmic: Versioning')
    call g:quickmenu#append('Toggle'            , 'GitGutterToggle'           , 'enable/disable'                 , '' , 0 , 't')
    call g:quickmenu#append('Branches'          , 'call quickmenu#bottom(10)' , 'show/change current git branch' , '' , 0 , 'b')
    call g:quickmenu#append('Diff current hunk' , 'GitGutterPreviewHunk'      , 'show current diff'              , '' , 0 , 'd')
    call g:quickmenu#append('Previous hunk'     , 'GitGutterPrevHunk'         , 'go to previous hunk'            , '' , 0 , 'p')
    call g:quickmenu#append('Next hunk'         , 'GitGutterNextHunk'         , 'go to next hunk'                , '' , 0 , 'n')
    call g:quickmenu#append('Revert hunk'       , 'GitGutterRevertHunk'       , 'revert current hunk'            , '' , 0 , 'r')

    " BUILD PANEL

    call g:quickmenu#current(7)
    call g:quickmenu#reset()
    call g:quickmenu#header('Vimmic: Build')
    call g:quickmenu#append('Cmake'       , ':CMake'                              , 'run CMake on build/'              , ''    , 0 , 'c')
    call g:quickmenu#append('Install'     , ':let g:cmake_build_target="install"' , 'target set to install'            , ''    , 0 , 'i')
    call g:quickmenu#append('Make'        , ':Make'                               , 'run make (:WW)'                   , ''    , 0 , 'm')
    call g:quickmenu#append('Make Silent' , ':Make'                               , 'run make in hidden buffer (:WWW)' , ''    , 0 , 'M')
    call g:quickmenu#append('Latex build' , ':VimtexCompile'                      , 'compile latex in the bg'          , 'tex' , 0 , 'l')

    " SYNTAX PANEL

    call g:quickmenu#current(8)
    call g:quickmenu#reset()
    call g:quickmenu#header('Vimmic: Syntax')
    call g:quickmenu#append('Toggle'          , 'ALEToggle' , 'Activate / Deactivate error checking' , '' , 0    , 't')
    call g:quickmenu#append('Check'           , 'ALELint'   , 'Refresh error checking'               , '' , 0    , 'c')
    call g:quickmenu#append('Error Window'    , 'lopen'     , 'Show error window'                    , '' , 0    , 'e')
    call g:quickmenu#append('Quickfix Window' , 'ClangCheck', 'Show quickfix window (clang)'         , 'c,cpp' , 0    , 'q')
    call g:quickmenu#append('Select error'    , 'll'        , 'Go to selected error'                 , '' , 0    , 's')
    call g:quickmenu#append('Previous error'  , 'lprevious' , 'Select previous error'                , '' , 0    , 'p')
    call g:quickmenu#append('Next error'      , 'lnext'     , 'Select next error'                    , '' , 0    , 'n')

    " PROCESS PANEL

    call g:quickmenu#current(9)
    call g:quickmenu#reset()
    call g:quickmenu#header('Vimmic: Process')
    call g:quickmenu#append('Invert'        , 'Switch'                        , 'Switch value / syntax'                          , '' , 0 , 'i')
    call g:quickmenu#append('Replace [X]'   , 'echo "not from the quickpanel"', 'Replace current word (not from the quickpanel)' , '' , 0 , 'r')
    call g:quickmenu#append('Substitute'    , '%s/'                           , 'Search and replace'                             , '' , 0 , 's')
    call g:quickmenu#append('Trailing'      , '%call TrimSpaces()'            , 'remove trailling spaces (also in visual)'       , '' , 0 , 't')
    call g:quickmenu#append('Cyle argument' , 'SidewaysRight'                 , 'arguemnt rotate'                                , '' , 0 , 'c')
    call g:quickmenu#append('Cyle argument' , 'SidewaysLeft'                  , 'arguemnt rotate (reverse)'                      , '' , 0 , 'C')

    " COMMENT PANEL

    call g:quickmenu#current(10)
    call g:quickmenu#reset()
    call g:quickmenu#header('Vimmic: Comment')
    call g:quickmenu#append('Toggle block/line' , 'call ToogleCommmentaryCCPP' , '// or /**/ for gc'       , 'c ,cpp' , 0 , 't')
    call g:quickmenu#append('(Un)Comment'       , 'normal gcc'                 , 'Comment / uncomment: gc' , ''       , 0 , 'c')

    " ALIGN PANEL

    call g:quickmenu#current(11)
    call g:quickmenu#reset()
    call g:quickmenu#header('Vimmic: Align')
    call g:quickmenu#append('Align :' , 'normal gaip:' , 'Inside paragraph' , '' , 0 , ':')
    call g:quickmenu#append('Align &' , 'normal gaip&' , 'Inside paragraph' , '' , 0 , '&')
    call g:quickmenu#append('Align .' , 'normal gaip.' , 'Inside paragraph' , '' , 0 , '.')
    call g:quickmenu#append('Align ,' , 'normal gaip,' , 'Inside paragraph' , '' , 0 , ',')
    call g:quickmenu#append('Align =' , 'normal gaip=' , 'Inside paragraph' , '' , 0 , '=')

    " GIT BRANCHES PANEL

    " % Warning, work in current directory: where vim was launched
    function! QuickBranches()
       call g:quickmenu#current(12)
       call g:quickmenu#reset()
       call g:quickmenu#header('Vimmic: Git branches')
       call g:quickmenu#append('# Branches', '')
       let l:branches = systemlist("git branch --list | sed 's/\*//g' | sed 's/ //g'")
       for l:branch in l:branches
          call g:quickmenu#append('' . l:branch, 'silent !git checkout ' . l:branch)
       endfor
    endfunction

    call QuickBranches()

    " DEBUG PANEL

    if exists(":Termdebug")
       call g:quickmenu#current(13)
       call g:quickmenu#reset()
       call g:quickmenu#header('Vimmic: Debug')
       call g:quickmenu#append('Run :'                , 'Run'      , 'gdb: run'      , '' , 0 , 'r')
       call g:quickmenu#append('Continue :'           , 'Continue' , 'gdb: continue' , '' , 0 , 'c')
       call g:quickmenu#append('Step :'               , 'Step'     , 'gdb: step'     , '' , 0 , 's')
       call g:quickmenu#append('Next line :'          , 'Over'     , 'gdb: next'     , '' , 0 , 'n')
       call g:quickmenu#append('Finish :'             , 'Finish'   , 'gdb: finish'   , '' , 0 , 'f')
       call g:quickmenu#append('Breakpoint : '        , 'Break'    , 'gdb: break'    , '' , 0 , 'b')
       call g:quickmenu#append('Delete Breakpoint : ' , 'Clear'    , 'gdb: delete'   , '' , 0 , 'd')
    endif

    " Shortcut
    "'''''''''
    noremap <silent><F12> :call quickmenu#bottom(0)<cr>
    noremap <silent><leader><leader><leader> :call quickmenu#bottom(1)<cr>
    noremap <silent><leader>gb :call quickmenu#bottom(12)<cr>

    " Theme
    "''''''
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
