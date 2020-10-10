VIM Cheatsheet
==============

Tabs
----
See https://vim.fandom.com/wiki/Using_tab_pages.

### Opening and Closing
```vim
" Open files in tabs when starting VIM
vim -p first.txt second.txt

" Open a file in a new tab
:tabedit file.txt

" Close the current tab
:tabclose

" Close tab 3 (tabs are indexed starting at 1)
:tabclose 3

" Close all but the current tab
:tabonly
```

### Navigating
```vim
" Go to the next tab
gt
:tabn

" Go to the previous tab
gT
:tabp

" Go to the tab at position 3 (tabs are indexed starting at 1)
3gt

" Go to the first or last tabs
:tabfirst
:tablast
```

### Moving
```vim
" List all tabs and their displayed windows
:tabs

" Move the current tab after tab 3
:tabm 3

" Move the current tab first
:tabm 0

" Move the current tab last
:tabm
```

