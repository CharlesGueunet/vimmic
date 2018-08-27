"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""o "
" @file vimrc
" @author Charles Gueunet, Axel Martin
" @brief Vim main configuration file
" @version 0.6
" @date 04-01-2016
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Usefull variables                                                         {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Windows ?
let g:isWin = has('win16') || has('win32') || has('win64')
" / or \ depending on OS
let g:file_sep = (g:isWin)?'\':'/'
" Exemples on Linux, using $HOME/.vimmic as install folder
" ~/
let g:Vimmic_HOME = fnamemodify(expand('<sfile>'), ':p:h:gs').g:file_sep
if getftype(expand('<sfile>')) == "link"
   " ~/.vimmic/
   let g:Vimmic_BASE = fnamemodify(resolve(expand('<sfile>')), ':p:h:gs').g:file_sep
else
   " default to ~/.vim/ if not the symLink install method
   let g:Vimmic_BASE = g:Vimmic_HOME.g:file_sep.".vim".g:file_sep
endif
" ~/.vimmic/config/
let g:Vimmic_CONFIG = g:Vimmic_BASE.'config'.g:file_sep
" ~/.vimmic/config/plugins/
let g:Vimmic_CONFIG_PLUGINS = g:Vimmic_CONFIG.'plugins'.g:file_sep
" ~/.vimmic/dein/repos/github.com/Shougo/dein.vim/
let g:Vimmic_DEIN = g:Vimmic_BASE.join(['dein', 'repos', 'github.com', 'Shougo', 'dein.vim'], g:file_sep)
" ~/.vimmic/.vimrc.preconf
let g:Vimmic_PRECONF  = g:Vimmic_BASE.'.vimrc.preconf'
" ~/.vimmic/.vimrc.postconf
let g:Vimmic_POSTCONF = g:Vimmic_BASE.'.vimrc.postconf'
" Plugins blacklist
let g:Vimmic_DISABLED = []

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dein first install                                                        {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" First install
let g:deinNeedInstall=0
if !filereadable(expand(g:Vimmic_DEIN).g:file_sep.'README.md')
    if executable('git')
        let g:deinNeedInstall=1
        echom 'Install dein'
        exec '!git clone https://github.com/Shougo/dein.vim '.g:Vimmic_DEIN
    else
        echohl WarningMsg
        echom 'Git needed ! (how did you get this conf without it ?)'
        echohl None
    endif

endif

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" User custom configuration                                                 {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load the vimrc.preconf if exist
if filereadable(g:Vimmic_PRECONF)
    execute 'source' g:Vimmic_PRECONF
endif

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global configuration                                                      {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Leader key
if !exists('g:mapleader')
    let g:mapleader=','                      " Leader key is `,`.
endif

" Basics configuration of the editor (file, search, completion, cursor, ...)
execute 'source '.g:Vimmic_CONFIG.'editor.vim'

" basics functions to Update plugins, debug, highlight under cursor...
execute 'source '.g:Vimmic_CONFIG.'functions.vim'

" Basics colors and theme
execute 'source '.g:Vimmic_CONFIG.'theme.vim'

" Basics vim shortcuts (editor, completion, navigation, ...)
execute 'source '.g:Vimmic_CONFIG.'shortcuts.vim'

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin import                                                             {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

execute 'set runtimepath^='.g:Vimmic_DEIN

let g:Vimmic_NEED_LOAD = dein#load_state(g:Vimmic_BASE.'dein')
if g:Vimmic_NEED_LOAD
    call dein#begin(g:Vimmic_BASE.'dein')

    call dein#load_toml(g:Vimmic_BASE.'default.toml')
    call dein#load_toml(g:Vimmic_BASE.'default_ft.toml')

    " To add you custom plugins, add them in this file
    " The syntax is realy simple, see vimmic-toml help
    if filereadable(g:Vimmic_BASE.'custom.toml')
        call dein#load_toml(g:Vimmic_BASE.'custom.toml')
    endif

    " To disable default plugins of this conf, add them in this file
    " The syntax is realy simple, see vimmic-toml help
    if filereadable(g:Vimmic_BASE.'disable.toml')
        call DisablePlugins(g:Vimmic_BASE.'disable.toml', 1)
        " Dein update after modifying this file
        call add(g:dein#_vimrcs, g:Vimmic_BASE.'disable.toml')
    endif

    " Required:
    call dein#end()
    call dein#save_state()
endif
" keep construction this list of disabled plugins

" Required:
filetype plugin indent on

"End dein Scripts-------------------------

" Install post-process
" If you want to install not installed plugins on startup.
if g:deinNeedInstall
    if dein#check_install()
        "fix ensure the user will see the procedure
        let g:dein#install_max_processes = 1
        call dein#install()
        execute 'helptags '.g:Vimmic_BASE.'doc'
    endif
endif

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Module and environment configuration                                      {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load all plugins confs
" Each file have:
"  - settings
"  - shortcuts
"  - colors and theme
for s:pluginConf in globpath(g:Vimmic_CONFIG_PLUGINS, '*.vim' ,0 ,1)
    execute 'source' s:pluginConf
endfor

" Add the vimmic folder in the runtimpath for the documentation
" (in case it is not ~/.vim)
execute 'set runtimepath ^='.g:Vimmic_BASE

"}}}"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Post-configuration : used for plugins configuration and colors / themes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load the vimrc.postconf if exist
" See the help in vimmic-config
if filereadable(g:Vimmic_POSTCONF)
    execute 'source' g:Vimmic_POSTCONF
endif
