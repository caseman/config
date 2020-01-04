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
:nnoremap <leader>r :so $MYVIMRC <bar> :so $MYGVIMRC<CR>

" Enable spellcheck for content files
autocmd BufNewFile,BufRead *.md,*.rst,*.txt,*.html,README set spell

" Use pgsql highlighting
autocmd BufNewFile,BufRead *.sql set filetype=pgsql

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
let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "passive_filetypes": ["go"] }

:nnoremap <leader>s :SyntasticCheck<CR>
:nnoremap <leader>S :SyntasticToggleMode<CR>
:nnoremap <leader>l :lnext<CR>
:nnoremap <leader>h :lprevious<CR>

" ALE https://github.com/w0rp/ale
" 7/16 ALE not working (hangs mvim on open)
"let g:ale_linters = ['eslint']
