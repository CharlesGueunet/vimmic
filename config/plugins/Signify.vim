" mhinz/vim-signify
" Show lines modified corresponding to versionning system

let s:pluginName='vim-signify'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

    " Settings
    """"""""""
    let g:signify_vcs_list = [ 'accurev','bzr','cvs','darcs','fossil','hg','perforce','rcs','svn','tfs']

    " Shortcut
    """"""""""
    map <leader>gt :SignifyToggle<CR>

    " Theme
    """""""
    function! s:SignifyColors()
        highlight SignifySignAdd    cterm=bold  ctermfg=119
        highlight SignifySignDelete cterm=bold  ctermfg=167
        highlight SignifySignChange cterm=bold  ctermfg=227
    endfunction

    if !exists('g:disable_defaultColors')
        augroup vimmic_signify_colors
           autocmd VimEnter * call s:SignifyColors()
        augroup END
    endif

else
    if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
        echom s:pluginName.' not found, try :Update'
    endif
endif
