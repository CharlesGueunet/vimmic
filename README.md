
This project is a configuration along with a set of plugins for the Vim text editor.
It is aimed to keep vim light and efficient and should be
usable for anyone who know how to use this editor.
It should not confilct with your habits if you are familiar with Vim.

This project use pathogen to keep each plugin in a separate folder (in bundle and ftbundle).
Plugins are include as submodules and so stay under responsibility of their creators.

Copyright (C) 2016 Charles Gueunet

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

INSTALL
-------

##*Once you have backed up your old .vim and .vimrc* :

```bash
  cd ~
  git clone --recursive https://github.com/CharlesGueunet/vimconf.git .vim
  ln -sf .vim/.vimrc .
```

If you have already cloned this repo without the --recursive (or after an update) you can use :

```bash
  git submodule update --init
```

To install ctags, look into your distribution repository, or download sources
[here](http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz).<br>

By default ctags is configured use zsh if it is installed (bash otherwise).
Change syntastic shell to your convenient if needed in the vimrc file.<br>

For Python users, the [flake8-vim](https://github.com/andviro/flake8-vim)
plugin might require the [flake8](https://pypi.python.org/pypi/flake8) Python
package. To install it, you can use :

```bash
   pip install --user flake8
```

##Update :

When you update this configuration you should re-run the submodule update given above.
If you have a warning like :

```
warning: unable to rmdir (ft)bundle/[plugin] : folder is not empty
```

It comes from the submodule architecture. You might and you **should** delete this folder
corresponding to a droped off plugin.

##Neovim :

For those who would like to make a try : [neovim](https://neovim.io/doc/user/nvim_from_vim.html)

```bash
    mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
    ln -s ~/.vim $XDG_CONFIG_HOME/nvim
    ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
```

neovim is fully compatible with vim, so these configuration files works totally.<br>
If you have no color using neovim, check your $TERM. If it is xterm, change it to xterm-256color
and colors should come back!

CONFIG
------

###Templates :

* [c.vim](https://github.com/vim-scripts/c.vim) :
    Edit the file ftbundle/C_CPP/c.vim/c-support/template/Templates with your informations

* snippets completion:
    Files are in bundle/vim-snippets/snippets for global ones.
    Some more are defined in add_snippets/snippets.
    Each file is on the form : extension.snippets

* doc:
    You can add the doc of all plungins with :
```vim
    :Helptags
```

  (do not mix up with :heltags, made to add  the doc of one plugin!)


USE
---

 * We assume you know how to use vim
 * The leader key is ","

## Customize

If you want to add custom configuration, you can make a _$HOME/.vimrc.local_ containing your instructions.
You can use it to override shortcut, change colors or add plugins configuration.
This file is loaded after the .vimrc.<br>
Note, if you want to change your theme, put a:

```vim
highlight clear SignColumn
```

after the colorscheme instruction to have a consistant SignColumn<br>

Moreover if you want to add custom plugins, you can create a _ctbundle_ folder in the _.vim_ and put them in it.
One again, use the _$HOME/.vimrc.local_ for configuration.<br>
If you think your customization might be usefull for other people, please consider [Contributions](#contrib)

## Navigation

 *(try to use buffer navigation, cool with [nerdTree](https://github.com/scrooloose/nerdtree) ((Leader n))*

 * (Leader v) to vertical split
 * (Leader h) to horizontal split
 * (Leader left or right) to go to the dezired buffer
 * (Leader bottom) to list buffers
 * (Leader top) to change buffer
 * (Leader &lt; or &gt;) to go to desired windows
 * (CTRL+ w  arrow) to go to the dezired windows (split)
 * (Leader o) to maximize/unmaximizer current windows among splitted
 * (Leader b) open ctags menu, allow travel btw functions & variables

## Files navigation
 * (Leader n) open NerdTree : file navigator menu
 * (Leader f) open NerdTree on current location

## Words
 * Fast travel with (Leader Leader w)
 * cs'" to change 'test' in "test" ( **c**hange **s**urround
   using [vim-surround](https://github.com/tpope/vim-surround) )
 * in Visual selection : maj+S allow to put surround mark arround the selected block :
     maj+S  {  will sourround the block with {}
 * Interactively replace word under cursor using (Leader r)
 * Interactive substitute (%s) using (Leader s)

## Indent
  * (Leader ig) to have [indentation guides](https://github.com/nathanaelkane/vim-indent-guides)
  * C and C++ can be indented with (Ctrl d) (current line / selection)
    this indentation use [clang formatter](http://clang.llvm.org/docs/ClangFormat.html#vim-integration).
    to personalise put a ".clang-format" file in the project root (one is given in example in the git)
  * To align ([tabular](https://github.com/godlygeek/tabular)) text on a given char : :Tab/\<char\>
  * Shorcut exist for = and : with (Leader a= (or :a)).
  * You can fold your current scope ('{ ... }') by pressing (Leader -)

## Tips
 * (Leader p) show your current regiser, allowing you to retrieve old pasted lines ("0p for example)
 * you can add [bookmark](https://github.com/MattesGroeger/vim-bookmarks) to a line with "mm" and  navigate through bookmarks with mp and mn
 * Add text to your bookmark with "mi"
 * Using git, you can show a diff of the changes under cursor with (Leader hp)
 * (Leader u) show a pane with the undo-tree ( (maj D) on this pane to show diff with current)
 * mouse enabled, use maj when selecting text to allow ctrl-maj-c
 * If you don't want Airline to check for indentation/trailling : press F3

## Completion
 * The completion use JetBrain style : Ctrl-Space.
 * You can use snippets with tab (example : inc<tab> -> #include <| >)
    reminder snippets are in bundle/vim-snippets/snippets
 * Bracket, char string... are auto-closed automatically
 * When closed you con go out of bracket, string... with (Ctrl+g g)
 * to insert c function with c.vim : \if, \im ... cf :h csupport

## Code tips
 * (Leader s) to deactivate / reactivate syntax verification on save ([Syntastic](https://github.com/scrooloose/syntastic))
 * (Leader c space) to comment
 * (Leader c u)     to uncomment
 * on command mode : maj K give you the doc of the function under cursor
 * (Leader b) to open [tagbar](https://github.com/majutsushi/tagbar) (containing class, functions, fields ...)
 * + and _ allows to select and expand / shrink the current [region](https://github.com/terryma/vim-expand-region)
 * XML autocomplete juste write the body and then tab : p TAB -> \<p\>\</p\>
     Custom tag autocomplete when created : \<toto\> -\> \<toto\>| \</toto\>

## Git
 * (Leader g d) show you the diff of the current hunk
 * (Leader g h) highlight your file with the changes
 * (Leader g r) revert the current hunk to the git state

### [Syntastic](https://github.com/scrooloose/syntastic)
 * You can force a silent check with (Leader c) and make the error windows appear with (Leader e)
 * for syntastic to work properly in your project you may need to indicate some files to include or some flags for the compiler.
A sample file for C++ is include here : .syntastic\_cpp\_config.
This file should be next to the source file opened in vim.

INSPIRATION
-----------

This configuration have started by a look at
[spf13](https://github.com/spf13/spf13-vim), another vim distribution.
spf13 is great but heavy so I decided to make my own configuration much lighter.<br>
For the navigation and some highlight, I used advices of
[this post](http://nvie.com/posts/how-i-boosted-my-vim/)<br>
Lots of idea where taken from the
[jetbrains ide](https://www.jetbrains.com/) wich are among the best ones.<br>
For those hwo want to use space as the leader key,
[this](https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/)
website could be usefull.<br>
For later, build tools and shortcut might come from [this conf](https://github.com/xmementoit/vim-ide.git).<br>
Another great website about vim plugins is [vimawesome](http://vimawesome.com/).


<a name="contrib"></a>CONTRIBUTION
----------------------------------

### Adding plugins
For consistency, plugins needs to be added as submodule.
If they are gloabls (common to every language) add them in bundle.
If they depend on the current FileType, put it on ftbunld/Language.

 ```bash
  git submodule add [git-url]
 ```

ISSUE
-----

For those using neovim, you need the latest build ([here](https://github.com/neovim/neovim)) to avoid a weird overflow of the warning section of airline.
Event with the latest version, you will still have a little bug : the error and warning windows are shown even when empty.<br>
To avoid having to compil your own neovim and the little bug, you can use [this patch](https://github.com/vim-airline/vim-airline/pull/1126/files).

GIT
---

This git is maintained by **Charles Gueunet** \<charles.gueunet+vimconf@gmail.com\>

