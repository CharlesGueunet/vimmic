" scrooloose/nerdtree
" File navigator

let s:pluginName='nerdtree'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:NERDTreeDirArrows=0

    " Highligh nerdtree
    let g:NERDTreeFileExtensionHighlightFullName = 1
    let g:NERDTreeExactMatchHighlightFullName = 1
    let g:NERDTreePatternMatchHighlightFullName = 1
    let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
    let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name

    if exists('g:Vimmic_HideHelp')
       let NERDTreeMinimalUI=1
    endif

    " leave if only nerdTree win open
    augroup Vimmic_NerdTree_close
        autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') ) | q | endif
    augroup end

    " Shortcut
    """"""""""
    map <leader>nt :NERDTreeToggle<cr>
    map <leader>nf :NERDTreeFind<cr>

    " Theme
    """""""
    " None

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
