" mbbill/undotree
" Visualize vim undo-tree to easily recover past states

scriptencoding utf-8

let s:pluginName='undotree'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:undotree_TreeNodeShape = '●'

    let g:undotree_HighlightChangedText = 0    " remove annoying highlight
    let g:undotree_WindowLayout = 2            " undo-tree left, diff below.
    let g:undotree_DiffAutoOpen = 0            " diff on demand
    let g:undotree_ShortIndicators=1           " smaller panel
    let g:undotree_SplitWidth=21               " and size

    if exists("g:Vimmic_HideHelp")
       let g:undotree_HelpLine=0
    endif

    " Shortcut
    """"""""""
    nnoremap <leader>u :UndotreeToggle<cr>

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
