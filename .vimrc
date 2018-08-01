" Note this assumes sensible.vim

" 4 space tabs
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smarttab

set showcmd
set showmatch
set hlsearch
set dir=/tmp
set tw=78
set hidden
let mapleader = ","

call pathogen#infect()

" Tab complete like shell
set wildmode=list:longest,full

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
" Allow comment rewrapping
set formatoptions+=q
" Don't wrap text, only comments
set formatoptions-=t
set formatoptions+=c
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

" Setup grep to be recursive, ignore binaries, and version control metadata
set grepprg=grep\ -srn\ --binary-files=without-match\ --color=never\ --exclude=.svn\ --exclude=.hg\ --exclude=.git

" ,g to grep the word under the cursor
:nnoremap <leader>g :execute 'grep '.expand('<cword>').' .' <BAR> cw<CR>

" switch between last two files
:nnoremap <leader><leader> <c-^>

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


