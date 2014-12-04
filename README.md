## About

`split-manpage.vim` is a plugin for opening man pages inside another Vim window.

In Vim, the key `K` looks up the keyword under the cursor. It does so using the value
of the `keywordprg` option (whose default value is "man", or "man -s" if a count is specified).
Unfortunately, you are temporarily taken out of vim into a pager program, making the
whole experience rather disruptive.

This plugin fixes that behavior by opening the desired man page inside of Vim itself.
The contents of the man page are placed in a temporary buffer on a split window.
Moreover, because that temporary buffer is hidden and not associated with any file,
it's easy to get rid of it.

## Installation

Use your favorite Vim plugin manager to install this plugin. For example, with NeoBundle
you can place this line in your `~/.vimrc` file

    NeoBundle 'ludwig/split-manpage.vim'

## Usage

To open the man page for the keyword under the cursor, press the prefix sequence `<Leader>k`
followed by a cursor movement key (one of `hjkl`). The appropriate split window will be created
with the contents of the desired man page.

To get rid of the man page you can simply delete its buffer with the command `:bd`.

The default set of key mappings are as follows

- `<Leader>kk` - opens the man page on a split window above the current window.
- `<Leader>kj` - opens the man page on a split window below the current window.
- `<Leader>kh` - opens the man page on a vertical split window to the left of the current window.
- `<Leader>kl` - opens the man page on a vertical split window to the right of the current window.

As with Vim's `K` (refer to `:help K`), you can also supply a count argument before calling
any of these mappings. The appropriate man page section will be brought up when doing the lookup.
For example, `2<Leader>kk` will take the keyword under the cursor, look it up in section 2 of the
man pages, and place the resulting man page inside a split window above the current window.

You can also use the commands `:Man <word>` and `:ManS <section> <word>`, but they will open the
desired man page in the current window. For example, to bring up the `curl(1)` man page you can run
`:Man curl`, and to find `printf(3)` you can run `:ManS 3 printf`.

## Options

To override the default prefix sequence `<Leader>k`, you can place this line in your `~/.vimrc`
and use any other key sequence you want:

    ```vim
    let g:split_manpage_prefix = '<Leader>k'
    ```

You can also assign an alternate key sequence to open the man page inside the current window
instead. By default, this sequence is `<Leader>K`. No other prefix sequence is necessary to use
this mapping:

    ```vim
    let g:split_manpage_samewindow = '<Leader>K'
    ```

Because it's easy to hit it by accident, the key `K` has been disabled in normal mode. Note that you
can still use it in visual mode via something like `vawK`. If you'd prefer to prevent this plugin
from turning off `K`, you can use the option:

    ```vim
    " Whether to disable the K key. Set this option to 0 to leave K alone. (default is 1)
    let g:split_manpage_disable_K = 0
    ```

