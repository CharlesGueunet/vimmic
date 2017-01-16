
VimMic is a configuration along with a set of plugins for the Vim text editor.
It stand for Vim Make It Clever and is aimed to keep this editor light and efficient.
It should be easy to use for anyone who is familiar with Vim, without breaking your habits.

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

If you have already cloned this repo without the --recursive use :

```bash
  git submodule update --init
```

To install ctags (for the tagbar), look into your distribution repository, or download sources
[here](http://prdownloads.sourceforge.net/ctags/ctags-5.8.tar.gz).<br/>
Consider [Universal Ctags](https://github.com/universal-ctags), a more up-to-date project
that works on C++11 and later.

For Python users, the [flake8-vim](https://github.com/andviro/flake8-vim)
plugin might require the [flake8](https://pypi.python.org/pypi/flake8) Python
package. To install it, you can use :

```bash
   pip install --user flake8
```

You need to intall this package for the version of python you use.

##Update :

Just run :

```bash
    git pull --recurse-submodules
```

to have the latest files</br>
Then in vim :

```vim
    Update
```

to update your plugins.

##Neovim :

For those who would like to make a try : [neovim](https://neovim.io/doc/user/nvim_from_vim.html)

```bash
    mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
    ln -s ~/.vim $XDG_CONFIG_HOME/nvim
    ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
```

neovim is fully compatible with vim, so these configuration files works totally.<br>
You may need to call :Update at first launch of neovim.<br>
If you have no color using neovim, check your $TERM. If it is xterm, change it to xterm-256color.

CONFIG
------

## Customize

There is two files aimed to make this configuration more convenient for you.
_$HOME/.vimrc.preconf_ mainly used to add or disable plugins. Here you can also make some configuration
that need to be done *a priori*, like changing the leader key. For more personalization, the
_$HOME/.vimrc.postconf_ is where you can overrid any Vimmic configuration.\\
For both files, there is a sample version in this git, in the _extra_ folder.

If you think your customizationsmight be usefull for other people, please consider contributing to this git.

If you want to have a persistant undo create a _$HOME/.undodir_ folder.

To save session and have them at vim startup, create them in _$HOME/.vim/sessions/_

## Additional

* snippets completion:
    If you want to add your own snippets, create a _ctbundle/custom\_snippets/snippets_
    folder and put your snippets in it. The file should be named type.snippets, you have
    a lot of example files in _bundle/vim-snippets/snippets_.

USE
---

 * We assume you know how to use vim
 * The default leader key is ","

## Navigation

 *try to use buffer navigation, cool with [nerdTree](https://github.com/scrooloose/nerdtree) (Leader n)*

 * (Leader v) to vertical split
 * (Leader h) to horizontal split
 * (Leader left or right or num) to change buffer
 * (Leader bottom) to list buffers
 * (Leader top) to change buffer
 * (Leader &lt; or &gt;) to change tab
 * (CTRL+w  arrow) switch windows (split)
 * (Leader o) to maximize/unmaximizer current windows among splitted
 * (Leader b) open ctags menu. Ctags are used to rapidely go to function / variable ...

## Files navigation
 * (Leader n) open NerdTree : file navigator menu
 * (Leader f) open NerdTree on current location

## Text
 * [easy-motion](https://github.com/easymotion/vim-easymotion) allow fast travel to word after cursor (w) or before (b)
     and other traversal. Use (leader leader w/e/...).
 * [vim-surround](https://github.com/tpope/vim-surround) is made to help in "surrounding object" manipulation.
     For example you can change 'test' in "test" by pressing cs'" with your curson inside the '. Also works for xml.
 * you can also add surounding object. In visual selection (Maj+S {) put the current selection between braces.
 * [vim-over](https://github.com/osyo-manga/vim-over) bring interactive substitution :
   + (Leader s) interactive substitute
   + (Leader r) replace current word
   + in visual mode (Ctrl+R) interactive substitute in current selection only

## Indentation
  * C and C++ can be indented with (Ctrl+f) for current block / selection, if you have python support.
     This indentation use [clang-formatter](http://clang.llvm.org/docs/ClangFormat.html#vim-integration).
     To personalise the output, put a ".clang-format" file in the project root (one is given in example in the git)
  * To align ([tabular](https://github.com/godlygeek/tabular)) text on a given char : :Tab/\<char\> <br>
     shorcut exist for = and : with (Leader a=/a:).
  * You can fold your current scope ('{ ... }') by pressing (Leader -)

## Tips
 * (Leader p) show your current regiser, allowing you to retrieve old pasted lines ("0p for example)
 * you can add [bookmark](https://github.com/MattesGroeger/vim-bookmarks) to a line with (Leader mm)
     and  navigate through bookmarks with (Leader mp) and (Leader mn). Add text to your bookmark with (Leader mi)
 * [undo-tree](https://github.com/mbbill/undotree) give a good view of the vim undotree.
     It is accessible *via* (Leader u). You can also print a diff with the current state with (Maj+D) on the node
 * mouse enabled, use Maj when selecting text to allow Ctrl+Maj+c
 * If you don't want [airline](https://github.com/vim-airline/vim-airline) to check for indentation/trailling : press F3
     You can also disable it in the _.vimrc.postconf_.

## Completion
 * Word completion use JetBrain style : Ctrl-Space.
 * You can use snippets with tab (example : inc<tab> -> #include <| >)
 * When closed you con go out of bracket, string... with (Ctrl+g g)

## Code tips
 * [Syntastic](https://github.com/scrooloose/syntastic) can be toogled with F4
    and the error window can be shown with (Leader e).
 * (Leader c space) tooggle comment on the current line/selection.
 * \+ and \_ allows to select and expand / shrink the current [region](https://github.com/terryma/vim-expand-region)
 * XML completion: along with a lot of snippets (p, body, ul ...)
    [closetag](https://github.com/alvan/vim-closetag) autocomplete tags: \<toto\> -\> \<toto\>| \</toto\>
 * [vimtex](https://github.com/lervag/vimtex) add commands, mapping and other facilites for tex edition

### [Syntastic](https://github.com/scrooloose/syntastic)
 * You can force a silent check with (Leader c) and make the error windows appear with (Leader e)
 * for syntastic to work properly in your project you may need to indicate some includes or flags for the compiler.
A sample file for C++ is include in the _extra_ folder : _.syntastic\_cpp\_config_.
This file should be next to the source file opened in vim.

### [Vim-clang](https://github.com/justmao945/vim-clang)
 * C and C++ have a context aware completion.
 * Use a .clang file at the root of your project to indicate some includes or files. This file can be the same
   than the _.syntastic\_cpp\_config_ (see above). (these files will be united)
 * If the completion doesn't works, you might want to use the DebugVimClang command to show you the reasons the completion fail

## Git
 * (Leader g d) show you the diff of the current hunk
 * (Leader g h) highlight your file with the changes
 * (Leader g r) revert the current hunk to the git state


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
Some tricks about buffer and viml evaluation come from
[this dotfile](https://github.com/thirtythreeforty/dotfiles/blob/cb464b7ef00534aa06247e67f4e55c701022571f/vim/config/mappings.vim#L20-31).


ISSUE
-----

Snipmate assume bakslash are escaped in the body of the snippet but vim-snippet don't. This is corrected for Latex but we have not tested all
langages. If some other needs correction just tell us.<br/>
Changing syntastic and clang-vim to use the same file does'nt work. You can use symlink instead.<br/>
<!--For those using neovim, you need the latest build ([here](https://github.com/neovim/neovim)) to avoid a weird overflow of the warning section of airline.-->
<!--Event with the latest version, you will still have a little bug : the error and warning windows are shown even when empty.<br>-->
<!--To avoid having to compil your own neovim and the little bug, you can use [this patch](https://github.com/vim-airline/vim-airline/pull/1126/files).-->

GIT
---

This git is maintained by **Charles Gueunet** \<charles.gueunet+vimconf@gmail.com\>

