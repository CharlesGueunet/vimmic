VimMic is well-documented vim configuration along with a set of plugins for the
Vim text editor. It stand for Vim Make It Clever and is aimed to keep this
editor light and efficient. It should be easy to use for anyone who is familiar
with Vim.

__Install__
-----------

Note we highly recommend to backup your previous `.vimrc` if not already done
as we are going to erase it through the installation process.

### Dependencies

We highly recommend having a Vim build supporting Python. To check if Python
is supported, run: `vim --version | grep python` and see if `+python[...]` is
present.

Dependencies listed here are recommended but not required for all plugins:

* [flake8][flake8] is used by the plugin for Python
  [flake8-vim][plugin-flake8]. Install it through [pip][pip]:
  `pip install --user flake8`.
* [ctags][ctags] installed for better completion / code search support.
  Consider using [Universal Ctags][uni-ctags] which is more up-to-date.

### Install and update

Quick installation script:

```bash
DIRNAME=".vimmic"
cd ~
git clone --recursive https://github.com/CharlesGueunet/vimmic.git "${DIRNAME}"
ln -sf "${DIRNAME}"/.vimrc .
```

Notice you can use whatever you want in `$DIRNAME`, as long as you do not
modify the directory path afterward (as it may break the symbolic link).

If you want to update all plugins at once, simply run `:Update` in Vim.

### Neovim

For those who would like to try with [neovim][neovim], use the following
snippet to link your vim configuration with your neovim configuration:

```bash
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ~/.vim $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
```

__How to use__
--------------

* The default Leader Key is `,`.
* You can press `;` instead of `:`
* If you want persistant undo (survive vim restart) create a `.undodir/`
  folder in the Vimmic installation folder.
* If you want to display saved session at Vim startup, save them in
  `sessions/` folder in the Vimmic installation folder.
* You can see the Vimmic keymap with the command: `:map`.

You may need to restart Vim for your changes to the configuration to apply.

Please read the list of [plugins mapping](Keymap.md) and the
[plugin configuration](Config.md) documentations as they are well documented
and provide many tips and tricks!

### Enabling / disabling plugins

If you want to disable / enable plugins, you can use the `$HOME/.vimrc.preconf`
file to force our plugin manager (Dein) to add / remove a plugin. More details
are available in the sample in `extra/vimrc.preconf.sample`.

Do not forget to reload your configuration by:
* restarting vim
* running `:Update`
* restarting vim again.

__Structure__
--------------

All plugins are configured in their own files in `config/plugins/`.
Other files do not affect them (the *.vimrc* load them)

    .vimmic/               # Vimmic install directory
      .vimrc               # Loads Vimmic environment, configuration and plugins
      config/
        editor.vim         # Original vim config (files, buffers, search...)
        shortcuts.vim      # Defines some shortcuts on the original vim functionalities
        functions.vim      # Some cool functions to update all plugins, fold, debug...
        plugins/           # per-plugin related configuration. Files should use the following sections:
                           #   Settings: Plugin related settings and variable
                           #   Shortcuts: Mapping for this plugin
                           #   Theme: Colors configuration for this plugin

We also use two other files defined in the user home directory (you can see
examples of those files in the `extra/` directory):

* `$HOME/.vimrc.preconf`: tweak vimmic by adding or disabling plugins, changing
  the leader key, disabling part of the configuration...
* `$HOME/.vimrc.postconf`: override plugins configuration, change themes, add
  your own features...


__Gallery__
-----------

![Vimmic default config](https://github.com/CharlesGueunet/vimmic/blob/dev/extra/Vimmic_default.png?raw=true)
Default configuration. On the left we see the NerdTree pane to navigate in the
project. The *Install* word is highlighted by the search.

![Vimmic quantum](https://github.com/CharlesGueunet/vimmic/blob/dev/extra/Vimmic_quantum.png?raw=true)
The configuration using true-colors colorscheme as explained in the sample
*.vimrc.preconf* and *.vimrc.postconf* of the extra/ folder. Here, we see on the
left the Nerd Tree with the project files, the Undo Tree with the historic of
the current file modification and on the right the Tag bar with the current
function highlighted. Moreover, Git information are shown on the left of the
text.

![Vimmic code](https://github.com/CharlesGueunet/vimmic/blob/dev/extra/Vimmic_completion.png?raw=true)
For code development, the left window shows the error reported on the editor
line 15. The right window shows the clever completion (Ctrl-x x).


__Inspiration__
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

__Copyright__
-------------

This git is maintained by **Charles Gueunet** \<charles.gueunet+vimconf@gmail.com\>

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

[plugin-flake8]: https://github.com/andviro/flake8-vim
[pip]: https://pypi.python.org/pypi/pip
[flake8]: https://pypi.python.org/pypi/flake8
[ctags]: https://en.wikipedia.org/wiki/Ctags
[uni-ctags]: https://github.com/universal-ctags
[neovim]: https://neovim.io/
