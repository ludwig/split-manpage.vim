" Open manpages in split window
" Author: Luis Armendariz <luis.armendariz@gmail.com>
" Version: 1.0
" Last Modified: Dec 2, 2014

if exists('g:loaded_split_manpage')
    finish
endif
let g:loaded_split_manpage = 1

if !exists('g:split_manpage_prefix')     | let g:split_manpage_prefix = '<leader>k' | endif
if !exists('g:split_manpage_samewindow') | let g:split_manpage_samewindow = '<leader>K' | endif
if !exists('g:split_manpage_disable_K')  | let g:split_manpage_disable_K = 1 | endif

" Disable keyword lookup in normal mode. Note that K will still work in visual mode,
" using 'vawK' sequence to look up the current word on the cursor, for example.
if g:split_manpage_disable_K != 0
    nnoremap K <nop>
endif

" Program to use for keyword lookups (default is "man -s")
set keywordprg=man\ -s

" Open man page for word under cursor (use '<cword>' to retrieve current word under cursor)
" http://vim.wikia.com/wiki/Open_a_window_with_the_man_page_for_the_word_under_the_cursor
" http://vimdoc.sourceforge.net/htmldoc/windows.html#special-buffers
function! s:_ReadMan(man_section, man_word, winpos)
    " If 'man_section' is 0, use empty string instead.
    " We perform this check because v:count is 0 by default
    let s:man_section = a:man_section
    if s:man_section == 0
        let s:man_section = ''
    endif
    " Open a new window
    execute ":wincmd n"
    execute ":wincmd " . a:winpos
    " Make the new window a scratch buffer
    execute ":setlocal buftype=nofile"
    execute ":setlocal bufhidden=hide"
    execute ":setlocal noswapfile"
    " Don't list the buffer either
    execute ":setlocal nobuflisted"
    " Read in the man page for 'man_word' (col -b is for formatting)
    execute ":r!man " . s:man_section . " " . a:man_word . " | col -b"
    execute ":set ft=man"
    " Go to the first line and delete it
    execute ":goto"
    execute ":delete"
endfunction

" Open up 'man <section> <word>' in same window
function! s:ReadManS(section, word)
    call s:_ReadMan(a:section, a:word, 'o')
endfunction

" Open up 'man <word>' in same window
function! s:ReadMan(word)
    call s:_ReadMan('', a:word, 'o')
endfunction

" Map keys to the ReadMan() function
execute 'nnoremap <silent> ' . g:split_manpage_samewindow . " :<C-U>call <SID>_ReadMan(v:count, expand('<cword>'), 'o')<CR>"
execute 'nnoremap <silent> ' . g:split_manpage_prefix . "o :<C-U>call <SID>_ReadMan(v:count, expand('<cword>'), 'o')<CR>"
execute 'nnoremap <silent> ' . g:split_manpage_prefix . "h :<C-U>call <SID>_ReadMan(v:count, expand('<cword>'), 'H')<CR>"
execute 'nnoremap <silent> ' . g:split_manpage_prefix . "j :<C-U>call <SID>_ReadMan(v:count, expand('<cword>'), 'J')<CR>"
execute 'nnoremap <silent> ' . g:split_manpage_prefix . "k :<C-U>call <SID>_ReadMan(v:count, expand('<cword>'), 'K')<CR>"
execute 'nnoremap <silent> ' . g:split_manpage_prefix . "l :<C-U>call <SID>_ReadMan(v:count, expand('<cword>'), 'L')<CR>"

" Add 'Man' and 'ManS' commands
command! -nargs=+ Man   call <SID>ReadMan(<f-args>)
command! -nargs=+ ManS  call <SID>ReadManS(<f-args>)

" Set up some command-line abbreviations
cabbrev man Man
cabbrev mans ManS

" vim: ft=vim tw=100
