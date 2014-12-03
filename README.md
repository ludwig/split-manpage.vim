## About

SplitManpage is a plugin for opening man pages inside another Vim window.

In Vim, the `K` key looks up the keyword under the cursor. It does so using the value
of the 'keywordprg' option, which defaults to "man", or "man -s" if a count is specified.
Unfortunately, you are temporarily taken out of vim into a pager program, making the
whole experience rather disruptive.

This plugin fixes that behavior by opening the desired man page inside of Vim itself.
The contents of the man page are placed in a temporary buffer on a split window.

## Installation

Use your favorite Vim plugin manager to install this plugin. For example, with NeoBundle
you can place this line in your `~/.vimrc` file

    ```
    NeoBundle 'ludwig/split-manpage.vim'
    ```

## Usage

To open the man page for the keyword under the cursor, press the prefix sequence (`<Leader>k` by default)
followed by a window cursor motion (one of `hjkl`).

The default set of key mappings are as follows

- `<Leader>kk` - opens the man page on a split window above the current window.
- `<Leader>kj` - opens the man page on a split window below the current window.
- `<Leader>kh` - opens the man page on a vertical split window to the left of the current window.
- `<Leader>kl` - opens the man page on a vertical split window to the right of the current window.

As with Vim's `K` (see `:help K`), you can also apply a count before calling any of these mappings.
The appropriate man page section will be brought up when doing the lookup. For example, `2<Leader>kk`
will look up the keyword under the cursor in section 2 of the man pages.

You can also use the commands `:Man <word>` and `:ManS <section> <word>`, but they will open the
desired man page in the current window. For example, to bring up the `curl(1)` man page you can run
`:Man curl`, and to find `printf(3)` you can run `:ManS 3 printf`.

## Options

To override the default prefix `<Leader>k` you can use this option

    ```
    let g:split_manpage_prefix = '<Leader>k'
    ```

You can also assign an alternate key sequence to open the man page inside the current window.
By default, that sequence is `<Leader>K`. No prefix is applied to this mapping.

    ```
    let g:split_manpage_samewindow = '<Leader>K'
    ```

By default, the `K` key is disabled (mapped to `<nop>`). You can turn that off with

    ```
    let g:split_manpage_disable_K = 0
    ```

