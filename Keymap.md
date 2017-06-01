### Shortcut syntax
Ctrl is control<br/>
Leader is comma (by default on Vimmic)<br/>

{Ctrl+Key}: + means you need to press Control and Key simultaneously<br/>
{Leader Key}: space means you need to press Leader, then the key.
{Key1/Key2}: / means or, Key1 or Key2.

### Enable / disable feature
* F2 Toggle past mode to allow copy and past without troubles.
* F3 Toggle trailling space checking
* F4 Toggle Syntastic check
* F5 Toggle Rainbow
* {Leader a} Disable the right margin (can be disabled completely in .vimrc.preconf)

Note use Maj when selecting with the mouse to allow copy inside Vim.

### Buffer Navigation
* {Leader Left/Right} go to previous/next buffer.
* {Leader NUM} Go to buffer number NUM (not with Number keypad).
* {Leader bottom} list opened buffers.
* {Leader top} move between opened buffer, close buffer.
* {Leader Tab} go back to previous buffer.

### Window Navigation
 * {Leader \</\>} to go on tab Left or Right.
 * {Ctrl+w Arrow} or {Ctrl+h/j/k/l} to move cursor one the designated pane {Ctrl+Arrow} and {Ctrl+h/j/k/l} should works too.
 * {Leader v} Split vertically.
 * {Leader h} Split horizontally.
 * You can use the mouse or the (res +/-NUM or vertical res +-NUM) to change pane size.

### Files navigation
 * {Leader n} open NerdTree: file navigator menu.
 * {Leader f} open NerdTree, Find current location.

### Selection
* +/- grow or dim current selection: [expand-region](https://github.com/terryma/vim-expand-region)
* {Leader space} stop highlighting current search.

### Fold
* {Leader -} fold between { }.
* Space toggle fold.

### Indentation
* \< and \> to move the current selection left / right.
* {Ctrl+f} reformat line / selection using clang format in C/CPP, if Vim has python support.
* To align ([tabular](https://github.com/godlygeek/tabular)) text on a given char: (:Tabularize /\<char\>)
    + {Leader a =} align = on a block.
    + {Leader a :} align : on a block.
    + {Leader a &} align & on a block.
* You can disable [airline](https://github.com/vim-airline/vim-airline) indentation / trailing spaces checking on the *postconf* file.

### Completion
* {Ctrl+Space} for basic word completion (JetBrain style).
* {Ctrl+x x} for clever completion (Omni, equivalent to {Ctrl+x o}).
* {Ctrl+x f} (vim native) for file completion.
* {Ctrl+x l} (vim native) for full line completion.
* Tab to expand snippets (in C/CPP, inc|\<Tab\> become #include \<|\>).
* {Ctrl+a} go out of current.

### Code
* F4 Toggle error check: [Syntastic](https://github.com/scrooloose/syntastic).
* {Leader e} to bring error window.
* {Leader c space} toggle comment on a line/selection. ({Leader c m} for block comment).
* {Leader b} open [tag bar](https://github.com/majutsushi/tagbar)
* {Ctrl+f} to reformat in C/CPP using [clang-formatter](http://clang.llvm.org/docs/ClangFormat.html#vim-integration).
* K in normal mode to print the manual of function under cursor

### Git
* {Leader g d} show you the diff of the current hunk with [gitgutter](https://github.com/airblade/vim-gitgutter).
* {Leader g h} highlight your file with the changes.
* {Leader g r} revert the current hunk to the git state.
* {Leader g n} go to next chunk
* {Leader g p} go to previous chunk

### Others
* {Leader w} remove trailing spaces
* {Leader u} open open a pane to visualize your [undo-tree](https://github.com/mbbill/undotree).
* {Leader Leader w} to fast travel Words with [easy-motion](https://github.com/easymotion/vim-easymotion). A lots of others shortcut available, read the doc of this plugin.
* {Leader m m} Toogle current line [bookmark](https://github.com/MattesGroeger/vim-bookmarks). {Leader m i} Bookmark with text.
* {c s " '} to change a double quoted string by a simple quoted one using [vim-surround](https://github.com/tpope/vim-surround). Also works with all kind of surrounding characters
* {Maj+S )} to put the visual selection inside parenthesis. Also works with all king of surrounding characters.

