" w0rp/ale
" Asynchronous Lint Engine: error / warning check

let s:pluginName='ale'
silent let s:loaded = dein#util#_check_install(s:pluginName)
if s:loaded == 0

  " Settings
  """"""""""
  let g:ale_completion_enabled = 0
  let g:ale_statusline_format = ['| %d errors', '| %d warnings', '']
  if has('nvim')
    let g:ale_virtualtext_cursor=1
    let g:ale_virtualtext_prefix=' ⇨  '
    if &termguicolors
       augroup Vimmic_ALE_COLORS
          autocmd VimEnter * highlight ALEVirtualTextError guifg=#dd7186 gui=bold
          autocmd VimEnter * highlight ALEVirtualTextWarning guifg=#d5b875 gui=bold
          autocmd VimEnter * highlight ALEVirtualTextIngo guifg=#69c5ce gui=bold
       augroup end
    else
       augroup Vimmic_ALE_COLORS
          autocmd VimEnter * highlight ALEVirtualTextError ctermfg=red cterm=bold
          autocmd VimEnter * highlight ALEVirtualTextWarning ctermfg=yellow cterm=bold
          autocmd VimEnter * highlight ALEVirtualTextIngo ctermfg=cyan cterm=bold
       augroup end
    endif
  endif

  augroup vimmic_c_ale_config
    autocmd!
    autocmd FileType c let g:ale_linters         = {'c':['clangcheck', 'cpplint']}
    autocmd FileType cpp let g:ale_c_build_dir_names = ['.', 'build']
  augroup end

  augroup vimmic_cpp_ale_config
    autocmd!
    autocmd FileType cpp let g:ale_linters           = {'cpp':['clangcheck', 'cppcheck', 'cpplint']}
    autocmd FileType cpp let g:ale_c_build_dir_names = ['.', 'build']
  augroup end

  augroup vimmic_py_config
    autocmd!
    " flake8 is too intrusive
    autocmd FileType python let b:ale_linters = ['flake8']
    autocmd FileType python let b:ale_fixers = ['autopep8', 'yapf']
    autocmd FileType python let b:ale_pylint_options = '--extension-pkg-whitelist=numpy'
  augroup end

  " Shortcut
  """"""""""
  map <leader>st :ALEToggle<CR>
  map <F4> :ALEToggle<CR>
  map <leader>sc :ALELint<CR>
  map <leader>se :lopen<CR>

  " Theme
  """""""
  " None

  " Functions
  """""""""""

  " Statusbar print
  function! LinterStatusWarn() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    if l:all_non_errors != 0
      return printf('[%d Warn]', l:all_non_errors)
    endif

    return ''
  endfunction

  function! LinterStatusErr() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error

    if l:all_errors != 0
      return printf('[%d Err]', l:all_errors)
    endif

    return ''
  endfunction

else
  if g:Vimmic_NEED_LOAD && index(g:Vimmic_DISABLED, s:pluginName) == -1
    echom s:pluginName.' not found, try :Update'
  endif
endif
