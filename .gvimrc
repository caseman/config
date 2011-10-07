winpos 80 60
set lines=70 columns=100
"set gfn=ProFontWindows:h12
set gfn=DejaVu\ Sans\ Mono:h13.00
set guioptions-=T
"set gfn=Menlo:h13.00
set virtualedit+=onemore
syntax on
colors casey

" Enable spellcheck for creatin files
autocmd BufNewFile,BufRead *.rst,*.txt,*.html,README set spell

" Use pgsql highlighting
autocmd BufNewFile,BufRead *.sql set filetype=pgsql

"tab mappings 
nmap <D-1> 1gt 
nmap <D-2> 2gt 
nmap <D-3> 3gt 
nmap <D-4> 4gt 
nmap <D-5> 5gt 
nmap <D-6> 6gt 
nmap <D-7> 7gt 
nmap <D-8> 8gt 
nmap <D-9> 9gt 
nmap <D-t> :tabnew<CR> 
nmap <D-w> :tabclose<CR>
nmap <D-Left> :tabp<CR>
nmap <D-Up> :tabp<CR>
nmap <D-Right> :tabn<CR>
nmap <D-Down> :tabn<CR>

" Autocomplete pop-up (http://www.vim.org/tips/tip.php?tip_id=1228)
inoremap <expr> <Esc>      pumvisible()?"\<C-E>":"\<Esc>" 
inoremap <expr> <CR>       pumvisible()?"\<C-Y>":"\<CR>" 
inoremap <expr> <Down>     pumvisible()?"\<C-N>":"\<Down>" 
inoremap <expr> <Up>       pumvisible()?"\<C-P>":"\<Up>" 
inoremap <expr> <PageDown> pumvisible()?"\<PageDown>\<C-P>\<C-N>":"\<PageDown>" 
inoremap <expr> <PageUp>   pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<PageUp>"

if (&diff)
    " Maximize when opening diffs
    set lines=999 columns=999
endif
