## DoxygenToolkit for VIM
This plugin was originally created by Mathias Lorente and is available
[here][1]. I put it on here to be easily usable as a git submodule
for [my vim configuration][2].

### Configuration
Some configuration options can be set in your `~/.vimrc`.

    let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
    let g:DoxygenToolkit_paramTag_pre="@Param "
    let g:DoxygenToolkit_returnTag="@Returns   "
    let g:DoxygenToolkit_blockHeader="-------------------------------"
    let g:DoxygenToolkit_blockFooter="---------------------------------"
    let g:DoxygenToolkit_authorName="Mathias Lorente"
    let g:DoxygenToolkit_licenseTag="My own license" <-- !!! Does not end with "\<enter>"

### Thanks
Mathias Lorente for this script.

[1]: http://www.vim.org/scripts/script.php?script_id=987
[2]: http://github.com/mrtazz/vimfiles
