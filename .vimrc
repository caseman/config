colors pablo
syntax on
set noerrorbells
set shiftwidth=4
set tabstop=4
set autoindent
set smarttab
set showcmd
set showmatch
set ruler
set incsearch
set dir=/tmp
set tw=78
set history=1000

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Tab complete like shell
set wildmode=list:longest,full

" Redraw immediately when replacing text within a line
set cpoptions-=$
" Erase backspaced chars immediately
set cpoptions-=v
" Undo is not undone
set cpoptions-=u

" Auto-insert comment leaders on wrap-around
set formatoptions+=c
" Allow comment rewrapping
set formatoptions+=q
" Don't wrap text, only comments
set formatoptions-=t
set formatoptions+=c
" Leave existing long lines alone
set formatoptions+=l

" Allow arbitrary cursor placement in block mode (ctrl+v)
set virtualedit+=block

" Character to denote wrapped lines
set showbreak=↪

" Lines of context to keep above and below cursor
set scrolloff=3

set list
set listchars=tab:▸\ ,eol:¬

" * Text Formatting -- Specific File Formats

" enable filetype detection:
filetype on

" in text files, automatically format everything at 76 chars:
autocmd FileType text set formatoptions+=t textwidth=76

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
autocmd FileType make set noexpandtab shiftwidth=8

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" autocmd syntax * SpaceHi

augroup filetypedetect 
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig 
augroup END 

":let g:detectindent_preferred_expandtab = 1
":let g:detectindent_preferred_indent = 4
":autocmd BufReadPost * :DetectIndent
