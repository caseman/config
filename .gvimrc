" Maximize
set lines=999 columns=999
"set gfn=ProFontWindows:h12
"set gfn=DejaVu\ Sans\ Mono:h13.00
"set gfn=Source\ Code\ Pro:h13.00
"set gfn=Menlo:h14.00
"set gfn=Meslo\ LG\ M\ DZ\ for\ Powerline:h15.00
set gfn=Roboto\ Mono\ Medium\ for\ Powerline:h17.00
set linespace=1
" No gui toolbar
set guioptions-=T
" console for simple dialogs
set guioptions+=c
set virtualedit+=onemore
syntax on
colors casey

" Mark 80 columns
set colorcolumn=80
highlight ColorColumn ctermbg=gray guibg=#181818

" reload config while running
command! R so $MYVIMRC <BAR> so $MYGVIMRC

" Fix for redraw bug on write
command! W write<BAR>redraw!
cabbrev w W

if (&diff)
    " Maximize when opening diffs
    set lines=999 columns=999
endif
