
This project is configuration for the Vim text editor.
It is aimed to keep vim light and efficient and should be
usable for anyone who know how to use this editor.
It should not confilct with your habbit if you are fammiliar with Vim.

This project use pathogen to keep each plugin in a separate folder (bundle).
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

** Once you have backed up your old .vim ** :

cd ~
git clone --recursive https://github.com/CharlesGueunet/vimconf.git .vim
ln -sf .vim/.vimrc .

If you have already cloned this repo without the --recursive you can use :

git submodule update --init

To install eclim (not used for a long time):
    java -jar eclim_2.4.1.jar

To install ctags (or choose your distribution version):
    cd ctags
    ./configure
    make
    sudo make install
by default ctags use zsh if it is installed (or bash otherwise)
change syntastic shell to your convenient if needed in the vimrc file.


CONFIG
------

Templates :

c.vim :
  Edit the file bundle/c.vim/c-support/template/Templates with your informations
  other templates are here

snippets completion
  files are in bundle/vim-snippets/snippets
  Each file is on the for : extension.snippets

USE
---

We assume you know how to use vim

The leader key is ","

# Navigation (try to use buffer navigation, cool with nerdTree (<leader> + n))
  <leader>v to vertical split
  <leader>h to horizontal split
  <leader> + left or right to go to the dezired buffer
  <leader> + bottom to list buffers
  <leader> + top to change buffer
  <leader> + > or < to go to desired windows
  <ctrl> w + arrow to go to the dezired windows (split)
  <leadear>o to maximize/unmaximizer current windows among splitted

  <leader> b open ctags menu, allow travel btw functions & variables

# Files
  <leader> n open NerdTree : file navigator menu
  <leader> f open NerdTree on current location

# Words
  Fast travel with <leader><leader>w
  cs'" to change 'test' in "test" (change surround)
  you can add bookmark to a line with "mm"
      navigate through bookmarks with mp and mn

# Indent
  <leager>ig to have indentation guide
  To align text on a given char : :Tab/<char>
  Shorcut exist for = and : with <leader>a= (or :).
  You can fold your current scope ('{ ... }') by pressing <leader>-

# Tips
  mouse enabled, use maj when selecting text to allow ctrl-maj-c
  XML autocomplete juste write the body and then tab : p TAB -> <p></p>
     Custom tag autocomplete when created : <toto> -> <toto>| </toto>
  <leader>+p show your current regiser, allowing you to retrieve old pasted lines ("0p for example)

# Completion
  You can use autocompletion with tab (example : inc<tab> -> #include <| >)
  Bracket, char string... are auto-closed automatically
  to insert c function with c.vim : \if, \im ... cf :h csupport
  (:Helptags to update help)

# Code tips
  <leader>+s to deactivate / reactivate syntax verification on save (Syntastic)
  <leader>+c space to comment
  <leader>+c u     to uncomment
  for syntastic to work properly in your project you may need to indicate some files to include or some flags for the
  compiler.
  A sample file for C++ is include here : .syntastic\_cpp\_config.
  This file should be next to the source file opened in vim.

GIT
---

This git is maintained by Charles Gueunet <charles.gueunet+vimconf@gmail.com>
