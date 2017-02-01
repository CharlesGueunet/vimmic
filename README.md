VimMic is well-documented vim configuration along with a set of plugins for the Vim text editor.
It stand for Vim Make It Clever and is aimed to keep this editor light and efficient.
It should be easy to use for anyone who is familiar with Vim.

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

__INSTALL__
-----------

### Core

After backing up the old _.vimrc_ file.

```bash
  cd ~
  git clone --recursive https://github.com/CharlesGueunet/vimconf.git .vimmic
  ln -sf .vimmic/.vimrc .
```

The name *.vimmic/*  is given as example, this configuration will use the symbolic link
to find the configuration folder.<br/>

Additional features available if:<br/>
* Vim has Python support
* Ctags is installed (Consider [Universal Ctags](https://github.com/universal-ctags), a more up-to-date project)

### Python

For Python users, the [flake8-vim](https://github.com/andviro/flake8-vim)
plugin might require the [flake8](https://pypi.python.org/pypi/flake8) Python
package. To install it, you can use :

```bash
   pip install --user flake8
```

You need to intall this package for the version of python you use.

### Update

Their is a command in Vim to update all plugins:
```vim
    :Update
```

__USE__
-------

* The default Leader Key is ",".
* You can press ; instead of :
* If you want persistant undo (survive vim restart) create a **.undodir/** folder in the Vimmic installation folder.
* If you want to display saved session at Vim startup, save them in **sessions/** folder in the Vimmic installation folder.

We recommand to read the Vimmic configurations files (Next section) as they are well documented.<br/>
Click [here](Keymap.md) for Plugins mapping.
And   [here](Config.md) for Plugins configuration (short).

__STRUCTURE__
--------------

All plugins are configured in their own files in **config/plugins/**.
Other files do not affect them (the *.vimrc* load them)

Files: <br/>
**.vimmic** / <br/>
- .vimrc
- **config/**
    - editor.vim
    - shortcuts.vim
    - functions.vim
    - **plugins/**
        - here are all the plugins conf files

And<br/>
* \~/.vimrc.preconf
* \~/.vimrc.postconf

### .vimrc

The main configuration file:
* Create Vimmic variables (Usefull paths)
* Load plugins
* Source other configuration files (including user-defined pre/post conf)

### editor.vim

Editor related settings: Files, Buffers, Completion, Seach ...

### shortcut.vim

Define key mapping and shortcut (No plugin related)

### functions.vim

Define some cool functions to update all plugins, fold, debug.

### plugins/

Contain one file per plugins. Each of this file have three section:
* Settings: Plugin related settings and variable
* Shortcut: Mapping for this plugin
* Theme: Colors for this plugin

### \~/.vimrc.preconf

You have an example this file in the **extra/** folder of this git.
Allows to tweak Vimmic by adding or disabling plugins, changing leader key, disabling part of the conf...

### \~/.vimrc.postonf

You have an example this file in the **extra/** folder of this git.
Allows to tweak Vimmic by overriding plugins configurations, changing themes, adding your own features...

__INSPIRATION__
----------------

This configuration have started by a look at
[spf13](https://github.com/spf13/spf13-vim), another vim distribution.
spf13 is great but heavy so I decided to make my own configuration much lighter.

For the navigation and some highlight, I used advices of
[this post](http://nvie.com/posts/how-i-boosted-my-vim/)

Lots of idea where taken from the
[jetbrains ide](https://www.jetbrains.com/) wich are among the best ones.

For those who want to use space as the leader key,
[this](https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/)
website could be usefull.

For later, build tools and shortcut might come from [this conf](https://github.com/xmementoit/vim-ide.git).

Another great website about vim plugins is [vimawesome](http://vimawesome.com/).

Some tricks about buffer and viml evaluation come from
[this dotfile](https://github.com/thirtythreeforty/dotfiles/blob/cb464b7ef00534aa06247e67f4e55c701022571f/vim/config/mappings.vim#L20-31).

__GIT__
-------

This git is maintained by **Charles Gueunet** \<charles.gueunet+vimconf@gmail.com\>
