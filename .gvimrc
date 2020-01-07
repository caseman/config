set lines=70 columns=210
"set gfn=ProFontWindows:h12
"set gfn=DejaVu\ Sans\ Mono:h13.00
"set gfn=Source\ Code\ Pro:h13.00
"set gfn=Menlo:h14.00
set gfn=Meslo\ LG\ S\ DZ\ for\ Powerline:h15.00
set guioptions-=T
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

" Enable spellcheck for content files
autocmd BufNewFile,BufRead *.md,*.rst,*.txt,*.html,README set spell

" Use pgsql highlighting
autocmd BufNewFile,BufRead *.sql set filetype=pgsql

if (&diff)
    " Maximize when opening diffs
    set lines=999 columns=999
endif

:nnoremap <leader>l :lnext<CR>
:nnoremap <leader>h :lprevious<CR>

let g:ale_linters = {
    \   'go': ['gometalinter', 'gofmt'],
    \   'javascript': ['eslint'],
\}
