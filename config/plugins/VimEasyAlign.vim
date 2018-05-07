" corntrace/bufexplorer
" Fast travel opened buffers

let s:pluginName='vim-easy-align'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " None
    " NOTE: special char
    " = Around the 1st occurrences
    " 2= Around the 2nd occurrences
    " *= Around all occurrences
    " **= Left/Right alternating alignment around all occurrences
    " <Enter> Switching between left/right/center alignment modes
    " <Space> Around the 1st occurrences of whitespaces
    " 2<Space> Around the 2nd occurrences
    " -<Space> Around the last occurrences
    " <Enter><Enter>2<Space> Center-alignment around the 2nd occurrences
    " pressing <Ctrl-X> in interactive mode <<<< COOL
    " or using :EasyAlign /REGEX/ command in visual mode or in normal mode with a range (e.g. :%)
    " And others, see the README for more

    " Shortcut
    """"""""""
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)

    " Theme
    """""""
    " None

    " GUI
    """""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
