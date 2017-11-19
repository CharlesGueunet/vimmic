" davidhalter/jedi-vim
" Python completion anderror reporting

let s:pluginName='jedi-vim'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    " Jedi can be a little bit intrusive when you are used to code in Python (too
    " much popups, too much screen used...). The following configuration reduce
    " the module verbosity.
    " See the jedi-vim setting page for more informations :
    "     https://github.com/davidhalter/jedi-vim#settings
    "
    " Mapping are defined in the Shortcuts section.

    " Don't popup on dot
    let g:jedi#popup_on_dot=0

    " Don't show the docstring in popup during completion
    augroup vimmic_python_completion
        autocmd FileType python setlocal completeopt-=preview
    augroup END

    " IMPORTANT NOTE : if you feel completion is really slow on common used
    " library (such as pandas or os), please see the relevant following issue :
    "     https://github.com/davidhalter/jedi-vim/issues/163
    " However, note that completion is slow the first time (because it loads all
    " the module structure) and is cached for future use in the same vim instance.

    " Shortcut
    """"""""""
    " Note: The following Jedi-vim shortcuts are based on the JetBrains shortcuts
    " logic.
    " Note: to properly use the rename command, go to the function/class
    " definition or the variable assignation through <C-b> and use <S-F6>
    " shortcut.
    let g:jedi#goto_command = '<C-b>'
    let g:jedi#goto_assignments_command = ''
    let g:jedi#goto_definitions_command = ''
    let g:jedi#documentation_command = '<leader>K'
    let g:jedi#completions_command = '<C-Space>'
    let g:jedi#rename_command = '<S-F6>'
    let g:jedi#usages_command = '<S-F7>'

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
