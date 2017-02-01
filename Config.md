### [Syntastic](https://github.com/scrooloose/syntastic)
 * You can force a silent check with (Leader c) and make the error windows appear with (Leader e)
 * for Syntastic to work properly in your project you may need to indicate some includes or flags for the compiler.
A sample file for C++ is include in the **extra/** folder : *.syntastic\_cpp\_config*.
This file should be next to the source file opened in vim.

### [Vim-clang](https://github.com/justmao945/vim-clang)
 * C and C++ have a context aware completion.
 * Use a .clang file at the root of your project to indicate some includes or files. This file can be the same
   than the *.syntastic\_cpp\_config* (see above). (these files will be united soon)
 * If the completion doesn't works, you might want to use the DebugVimClang command to show you the reasons the completion fail

