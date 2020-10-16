VIM Cheatsheet
==============

Folds
-----
:h folds
:h fold-com[mands]

### Creating
These commands only work when `foldmethod` is `manual` or `marker`.

```vim
" Create a fold from the cursor line to the line where {motion} ends
zf{motion}

" Create a fold for [count] lines staring from the line with the cursor
zF[count]

" Create a fold for the lines in {range}
:{range}fo[ld]
```

### Deleting
These commands only work when `foldmethod` is `manual` or `marker`.

```vim
" Delete the fold at the cursor and move any nested folds one level up
zd

" Delete the fold and any nested folds at the cursor
zD

" Delete all folds in the window
zE
```

### Opening and Closing
```vim
" Toggle one fold under the cursor
za

" Toggle all folds under the cursor
zA

" Fold one more level in the window (if `foldlevel` > 0 subtract 1)
zm

" Close all folds in the window (set `foldlevel` to 0)
zM

" Reduce folding one level in the window (add 1 to `foldlevel`)
zr

" Open all folds in the window (set `foldlevel` to the highest fold level)
zR

" Open one fold under the cursor
zo

" Open one fold in {range}
:{range}foldo[pen]

" Open all folds in {range}
:{range}foldo[pen]!

" Open all folds under the cursor
zO

" Close one fold in {range}
:{range}foldc[lose]

" Close all folds in {range}
:{range}foldc[lose]!

" Close one fold under the cursor
zc

" Close all folds under the cursor
zC
```

### Navigating
```vim
" Move to the start of the current open fold, or to the start of the containing
" fold if already at the start of a fold
[z

" Move to the end of the current open fold, or to the end of the containing
" fold if already at the end of a fold
]z

" Move downwards the start of the next fold. Repeat the command [count] times.
" This command can be used after an operator.
zj

" Move upwards the end of the previous fold. Repeat the command [count] times.
" This command can be used after an operator.
zk
```

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

