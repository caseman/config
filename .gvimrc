set lines=70 columns=113
"set gfn=ProFontWindows:h12
"set gfn=DejaVu\ Sans\ Mono:h13.00
"set gfn=Source\ Code\ Pro:h13.00
"set gfn=Menlo:h14.00
set gfn=Meslo\ LG\ S\ DZ\ for\ Powerline:h13.00
set guioptions-=T
set virtualedit+=onemore
syntax on
colors casey

" Mark 80 columns
set colorcolumn=80
highlight ColorColumn ctermbg=gray guibg=#222222

" reload config while running
:nnoremap <leader>r :so $MYVIMRC <bar> :so $MYGVIMRC<CR>

" Enable spellcheck for content files
autocmd BufNewFile,BufRead *.md,*.rst,*.txt,*.html,README set spell

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
nmap <D-Up> :tabfirst<CR>
nmap <D-Right> :tabn<CR>
nmap <D-Down> :tablast<CR>

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

" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_auto_loc_list = 1
highlight SyntasticErrorSign guifg=white guibg=red
highlight SyntasticError guibg=#2f0000
let g:syntastic_javascript_checkers = ["eslint"]
let g:syntastic_go_checkers = ["gometalinter"]
" gometalinter is supa-slow by default, so pass it the fast flag
let g:syntastic_go_gometalinter_args = "--fast"

:nnoremap <leader>s :SyntasticCheck<CR>
:nnoremap <leader>l :lnext<CR>
:nnoremap <leader>h :lprevious<CR>

" ALE https://github.com/w0rp/ale
" 7/16 ALE not working (hangs mvim on open)
"let g:ale_linters = ['eslint']
