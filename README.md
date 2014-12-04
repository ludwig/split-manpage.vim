## About

`split-manpage.vim` is a plugin for opening man pages inside another Vim window.

In Vim, the `K` key looks up the keyword under the cursor. It does so using the value
of the `keywordprg` option, which defaults to "man" or to "man -s" if a count is specified.
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

To open the man page for the keyword under the cursor, press a prefix sequence (`<Leader>k` by default)
followed by a cursor movement key (one of `hjkl`). The appropriate split window will be created
with the contents of the desired man page.

The default set of key mappings are as follows

- `<Leader>kk` - opens the man page on a split window above the current window.
- `<Leader>kj` - opens the man page on a split window below the current window.
- `<Leader>kh` - opens the man page on a vertical split window to the left of the current window.
- `<Leader>kl` - opens the man page on a vertical split window to the right of the current window.

As with Vim's `K` (refer to `:help K` for more), you can also apply a count before calling any of
these mappings. The appropriate man page section will be brought up when doing the lookup. For example,
`2<Leader>kk` will take the keyword under the cursor, look it up in section 2 of the man pages,
and place the resulting man page inside a split window above the current window.

You can also use the commands `:Man <word>` and `:ManS <section> <word>`, but they will open the
desired man page in the current window. For example, to bring up the `curl(1)` man page you can run
`:Man curl`, and to find `printf(3)` you can run `:ManS 3 printf`.

To get rid of the man page you can simply delete its buffer with the command `:bd`.

## Options

To override the default prefix `<Leader>k`, you can place this line in your `~/.vimrc` and use
any other key sequence you want

    let g:split_manpage_prefix = '<Leader>k'

You can also assign an alternate key sequence to open the man page inside the current window
instead. By default, this sequence is `<Leader>K`. No prefix is applied to this mapping.

    let g:split_manpage_samewindow = '<Leader>K'

By default, the `K` key is disabled in normal mode, but it can still be called in visual mode
via something like `vawK`. If you'd prefer to prevent SplitManpage from turning it off, you
can use the option

    let g:split_manpage_disable_K = 0

