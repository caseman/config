" Note this assumes sensible.vim: https://github.com/tpope/vim-sensible

" 4 space tabs
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set showcmd
set showmatch
set hlsearch
set dir=/tmp
set tw=78
set hidden
set encoding=utf-8
let mapleader = ","

call pathogen#infect()

" Tab complete like shell
set wildmode=list:longest,full
set wildignore+=*/.git/**/*,*/.hg/**/*,*/.svn/**/*
set wildignore+=*/min/*,*/vendor/*,*/node_modules/*
set wildignore+=*/tmp/*,*.so,*.swp,*.pyc,*.lock
set wildignore+=*.tar.*,*.zip,*.gz,*.bz

" Don't interrupt so much
set shortmess=atI
set noerrorbells

" Redraw immediately when replacing text within a line
set cpoptions-=$
" Erase backspaced chars immediately
set cpoptions-=v
" Undo is not undone
set cpoptions-=u

" Persistent Undo
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Auto-insert comment leaders on wrap-around
set formatoptions+=c
" Don't insert comments leaders when inserting lines with o or O
set formatoptions-=o
" Allow comment rewrapping
set formatoptions+=q
" Don't wrap text, only comments
set formatoptions-=t
" Leave existing long lines alone
set formatoptions+=l
" Indent paragraphs to 2nd line
set formatoptions+=2

" Allow arbitrary cursor placement in block mode (ctrl+v)
set virtualedit+=block

" Character to denote wrapped lines
set showbreak=↪

" Lines of context to keep above and below cursor
set scrolloff=3

set list
set listchars=tab:▸\ ,eol:¬,trail:·

" Replace current visual selection with yank buffer contents with "r"
vmap r "_dP
" Don't clobber the unnamed register when pasting over text in visual mode. 
vnoremap p pgvy

" Make F1 == ESC
"map  <F1> <Esc>
"imap <F1> <Esc>
"vmap <F1> <Esc>
"nmap <silent> <F1> :nohlsearch<CR>
"map  <T-F1> <Esc>
"imap <T-F1> <Esc>
"vmap <T-F1> <Esc>
"nmap <silent> <T-F1> :nohlsearch<CR>

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

if executable('ag')
    " Use ag over grep if installed
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0

    " bind \ (backward slash) to grep shortcut
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
else
    " Setup grep to be recursive, ignore binaries, and version control metadata
    set grepprg=egrep\ -srn\ --binary-files=without-match\ --color=never\ --exclude=.svn\ --exclude=.hg\ --exclude=.git --exclude=node_modules
endif

" ,g to grep the word under the cursor
:nnoremap <leader>g :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" split shortcuts
nnoremap <leader>v :split<CR>
nnoremap <leader>c :close<CR>

" Fast buffer switching
nnoremap <leader><leader> <c-^>
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>6 :b6<CR>
nnoremap <leader>7 :b7<CR>
nnoremap <leader>8 :b8<CR>
nnoremap <leader>9 :b9<CR>
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR>
nnoremap <leader>b :buffers<CR>:buffer<Space>

" * Text Formatting -- Specific File Formats

" in text files, automatically format everything at 76 chars:
" autocmd FileType text set formatoptions+=t textwidth=76

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
autocmd FileType make set noexpandtab shiftwidth=8

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" Less indenting for json, js, and html
"autocmd FileType html set et ts=2 sw=2 sts=2
"autocmd FileType json set et ts=2 sw=2 sts=2
"autocmd FileType javascript set et ts=2 sw=2 sts=2

" autocmd syntax * SpaceHi
runtime macros/matchit.vim

" Where to look for tags
set tags+=./TAGS;,$HOME/.cache/tags

" * Plugin config

" Use ctlrp mixed mode by default
:nnoremap <c-p> :CtrlPMixed<CR>

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
"let g:airline_symbols.branch = "" 
let g:airline#extensions#syntastic#enabled = 1

map <C-n> :NERDTreeToggle<CR>

