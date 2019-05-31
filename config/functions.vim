" This file contain some usefull function, to Update plugins, debug, fold ...

" Tools
"""""""""""""""""""""""""""""""""""""""

" Update the vim configuration
function! Update()
  if exists(':DeinUpdate')
    DeinUpdate
  else
    call dein#clear_state() | call dein#update() | call dein#recache_runtimepath()
  endif
endfunction
command! Update call Update()

" Ask vim-clang to compile the project to debug the autocompletion
function! ClangCheck()
   let g:clang_diagsopt = 'rightbelow:6'
   ClangSyntaxCheck
endfunction
augroup vimmic_cpp_clangCheck
   autocmd FileType c,cpp command! ClangCheck call ClangCheck()
augroup END

" Clever fold all using language specific syntax
function! FoldAll()
   set foldcolumn=1
   set foldmethod=indent
   redraw!
   set foldmethod=manual
endfunction
command! FoldAll call FoldAll()

" Trailling space removal
function! TrimSpaces() range
   " http://vim.wikia.com/wiki/Remove_unwanted_spaces
   let l:last_search=@/
   execute a:firstline.','.a:lastline.'substitute/\s\+$//e'
   let @/=l:last_search
   nohl
endfunction

" Execute macro on each line
" From: https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim?_utm_source=1-2-2
function! ExecuteMacroOverVisualRange()
   echo '@'.getcmdline()
   execute ":'<,'>normal @".nr2char(getchar())
endfunction

" Search in openend buffers and populate quicklist
function! Searchbuff(searchPattern)
   call setqflist([])
   cclose
   exec 'silent bufdo vimgrepadd! '.a:searchPattern.' %'
   copen
endfunction
command! -nargs=1 Searchb call Searchbuff(<f-args>)

" Dein plugin management

" This list allows to keep in mind which plungins have been disabled
" and so we will not ask the user to install it.
let g:Vimmic_DISABLED = []

function! DisablePlugins(filename, update_dein)
   " Need dein in this function
   " parse toml file here
   let l:toml = dein#toml#parse_file(dein#util#_expand(a:filename))
   if type(l:toml) != type({})
      call dein#util#_error('Invalid toml file: ' . a:filename)
      return 1
   endif

   let l:pattern = '.*/'

   if has_key(l:toml, 'plugins')
      for l:plugin in l:toml.plugins
         if !has_key(l:plugin, 'repo')
            call dein#util#_error('No repository plugin data: ' . a:filename)
            return 1
         endif

         let l:disable_plugin = substitute(l:plugin.repo, l:pattern, '', 'g')
         " keep a list of disabled plugins
         call insert(g:Vimmic_DISABLED,l:disable_plugin)
         if a:update_dein == 1
            " disable in dein
            call dein#disable(l:disable_plugin)
         endif
      endfor
   endif
endfunction

" Highlight
"""""""""""""""""""""""""""""""""""""""

" Highlight the current word under the cursor, except some groups
" http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
let g:no_highlight_group_for_current_word=['Statement', 'Comment', 'Type', 'PreProc']
function! s:HighlightWordUnderCursor()
   if !exists('g:Vimmic_NoHiCurWrod')
      let l:syntaxgroup = synIDattr(synIDtrans(synID(line('.'), stridx(getline('.'), expand('<cword>')) + 1, 1)), 'name')

      if (index(g:no_highlight_group_for_current_word, l:syntaxgroup) == -1)
         execute printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
      else
         execute 'match IncSearch /\V\<\>/'
      endif
   else
      highlight clear IncSearch
   endif
endfunction

if !exists('g:Vimmic_NoHiCurWrod') && !exists('g:disable_defaultColors')
   augroup vimmic_highlight_word_cursor
      autocmd CursorMoved * call s:HighlightWordUnderCursor()
   augroup END
endif

" Vimmic_config
"""""""""""""""""""""""""""""""""""""""

" generate .vimmic_config if possible

function! s:vimmic_cmake_generator(...)
   if a:0 > 0
      let l:cache_file = a:1
   else
      let l:cache_file='build/CMakeCache.txt'
   endif

   if filereadable(l:cache_file)
      let l:cache_cmd='cat '.l:cache_file.' | grep CMAKE_GENERATOR: | cut -d = -f 2'
      let s:res = system(l:cache_cmd)
      return trim(s:res)
   endif
   return ''
endfunction

function! s:vimmic_create_config(cpp, ...)
   if g:isWin == 1
      return
   endif

   if a:0 > 0
      let l:check = a:1
   else
      let l:check = 1
   endif

   if !exists('g:vimmic_default_c_opts')
      let g:vimmic_default_c_opts=' -Wall -fopenmp'
      if (a:cpp == 1)
         let g:vimmic_default_c_opts=g:vimmic_default_c_opts.' -std=c++14'
      endif
   endif

   if l:check == 1
      let g:vimmic_config_found = Filify#process('.vimmic_config', {'check_only':1})
   else
      " force not found
      let g:vimmic_config_found = 0
   endif
   if g:vimmic_config_found  == 0
      let l:config_file='build/compile_commands.json'
      if filereadable(l:config_file)
         let g:vimmic_cmake_generator = s:vimmic_cmake_generator()
         if (g:vimmic_cmake_generator ==# 'Ninja')
            let s:gen_file='vimmic_config_ninja.sh'
         else
            let s:gen_file='vimmic_config_make.sh'
         endif
         let l:gen_cmd=g:Vimmic_BASE.'/extra/'.s:gen_file.' build/compile_commands.json > .vimmic_config;
                  \ echo '.g:vimmic_default_c_opts.' >> .vimmic_config'
         echom 'generate confing from '.l:config_file.' : '.l:gen_cmd
         silent execute '!'.l:gen_cmd
         echom 'Done'
      endif
   endif
endfunction

augroup vimmic_c_cpp_ale_preconfig
   autocmd!
   autocmd FileType c   call s:vimmic_create_config(0)
   autocmd FileType cpp call s:vimmic_create_config(1)
augroup END

