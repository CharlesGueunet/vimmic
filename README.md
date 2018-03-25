VimMic is well-documented vim configuration along with a set of plugins for the
Vim text editor. It stand for Vim Make It Clever and is aimed to keep this
editor light and efficient.

__CHANGELOG__
--------------

* Ctrl-x x trigger chained completion and not only omni
* Remove nerd commenter, use 'gc' operator instead
* Add [place.vim](https://github.com/joereynolds/place.vim) to make changes without moving the cursor

__ISSUES__
----------

* C/CPP: If you are using CMake with Ninja, the generated `compile_command.json` use relative paths.
This is a CMake issue, if you use the `extra/vimmic_cpp_config.sh` script you
need to generate the config file for your C/CPP project with using Make as
generator and switch to Ninja after.

__Key Features__
----------------

This configuration is not intrusive and should not confict with Vim default use.

By default, leader is defined on coma.
* Mnemonic shortcuts (press leader three times to see them)
* Clever completion (Ctrl-X X to trigger, Ctrl-Space to navigate) and Syntax checking (asynchronous)
* Fast travel (file/buffers/tags...) and new operator/scopes
* Versionning, history and macro view integration
* Fully customizable
* ...

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
VIMMIC_DIR=".vimmic"
cd ~
git clone https://github.com/CharlesGueunet/vimmic.git "${VIMMIC_DIR}"
ln -sf "${VIMMIC_DIR}"/.vimrc .
```

Notice you can use whatever you want in `$VIMMIC_DIR` (including inside `.config`),
as long as you do not modify the directory path afterward (as it may break the
symbolic link).

If you want to update all plugins at once, simply run `:Update` in Vim.

### Neovim

For those who would like to try with [neovim][neovim], use the following
snippet to link your vim configuration with your neovim configuration,
change the `$VIMMIC_DIR` accordingly:

```bash
VIMMIC_DIR="~/.vimmic"
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.config}
ln -s ${VIMMIC_DIR} $XDG_CONFIG_HOME/nvim
ln -s ~/.vimrc $XDG_CONFIG_HOME/nvim/init.vim
```

Note: you may need to run `:Update` afterward if you have already installed the plugins
with Vim.

__How to use__
--------------

* The default Leader Key is `,` (it is recomanded to rebind capslock on it).
* You can press `;` instead of `:`
* If you want persistant undo (survive vim restart) create a 
  `.undodir/` folder in the Vimmic installation folder.
* If you want to display saved session at Vim startup, save them in
  `.sessions/` folder in the Vimmic installation folder.
* You can see the Vimmic keymap with the command: `:map` or with 3x leader.

You may need to restart Vim for your changes to the configuration to apply.

Please read the Vimmic's help ( `:help vimmic` ) as it is well documented
and provide many tips and tricks!

### Enabling / disabling plugins

As described in the *vimmic-config* help, if you want to add / remove
plugins, you can use the `${VIMMIC_DIR}/custom.toml` or `${VIMMIC_DIR}/disable.toml`
files (simple syntax) to manage the list of plugins.

Do not forget to restart your Vim afterward,
the editor will ask you to call `:Update` if needed.

__Structure__
--------------

All plugins are configured in their own files in `config/plugins/`.
Other files do not affect them (the *.vimrc* load them)

    ${VIMMIC_DIR}/         # Vimmic install directory
      .vimrc               # Loads Vimmic environment, configuration and plugins
      default.toml         # Default plugins list
      default_ft.toml      # Plugins loaded only on specific file types
      config/
        editor.vim         # Behaviour config (files, buffers, search...)
        shortcuts.vim      # Defines some shortcuts on the original vim functionalities
        functions.vim      # Some cool functions to update all plugins, fold, debug...
        plugins/           # per-plugin related configuration. Files should use the following sections:
                           #   Settings: Plugin related settings and variable
                           #   Shortcuts: Mapping for this plugin
                           #   Theme: Colors configuration for this plugin

For personnal configuration, you can ceate two files:

* `${VIMMIC_DIR}/.vimrc.preconf`: tweak vimmic by changing the leader key, colors,
  disabling part of the configuration...
* `${VIMMIC_DIR}/.vimrc.postconf`: override plugins configuration, change themes, add
  your own features...

Examples of those files in the `extra/` folder and the help *vimmic-config* gives some details.

__Gallery__
-----------

![Vimmic default config](http://charles.gueunet.fr/doc/vim/Vimmic_low_colors.png)
Default configuration on a low color terminal. On the left we see the NerdTree pane to navigate in the
project. The *Install* word is highlighted by the search.

![Vimmic quantum](http://charles.gueunet.fr/doc/vim/Vimmic_quantum.png)
The configuration using true-colors colorscheme as explained in the sample
*.vimrc.preconf* and *.vimrc.postconf* of the `extra/` folder. Here, we see on the
left the Nerd Tree with the project files, the Undo Tree with the historic of
the current file modifications and on the right the Tag bar with the current
function highlighted. Moreover, Git information are shown on the left of the
text.

![Vimmic Visual Shortcuts](http://charles.gueunet.fr/doc/vim/Vimmic_shortcuts.png)
To learn Vimmic, the help pages are your firends, but you can also use the
Visual Shortcut panel. (Summon by pressin three times `{leader}`)

![Vimmic code](http://charles.gueunet.fr/doc/vim/Vimmic_completion.png)
For code development, the left window shows an error (`t` is not printable) reported on the editor
line 15. The right window shows the clever completion (Ctrl-x x).


__Inspiration__
----------------

This configuration have started by a look at
[spf13](https://github.com/spf13/spf13-vim), another vim distribution.
spf13 is great but heavy so I decided to make my own configuration much lighter.

Another great distribution is [SpaceVim](https://github.com/SpaceVim/SpaceVim), but here
again this configuration is really complexe and most of the configuration should be made using
their own defined functions.

For the navigation and some highlight, we used
[this post](http://nvie.com/posts/how-i-boosted-my-vim/)

Lots of idea where taken from the
[jetbrains ide](https://www.jetbrains.com/) which is among the best ones.

For those who want to use space as the leader key,
[this website](https://sheerun.net/2014/03/21/how-to-boost-your-vim-productivity/)
can be usefull.

For later, build tools and shortcut might come from [this conf](https://github.com/xmementoit/vim-ide.git).

Another great website about vim plugins is [vimawesome](http://vimawesome.com/).

Some tricks about buffer and viml evaluation come from
[this dotfile](https://github.com/thirtythreeforty/dotfiles/blob/cb464b7ef00534aa06247e67f4e55c701022571f/vim/config/mappings.vim#L20-31).

__Copyright__
-------------

This git is maintained by **Charles Gueunet** \<charles.gueunet+vimmic@gmail.com\>

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
