" Note this assumes sensible.vim: https://github.com/tpope/vim-sensible

filetype plugin indent on

" 4 space tabs
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
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.DS_Store

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

" Lines of context to keep above and below cursor
set scrolloff=3

" Character to denote wrapped lines
set showbreak=↪

" Visible whitespace
set list
set listchars=tab:▸\ ,eol:↲,nbsp:␣,trail:⬤,extends:⟫,precedes:⟪

" Highlight VCS conflict markers.
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Replace current visual selection with yank buffer contents with "r"
vmap r "_dP
" Don't clobber the unnamed register when pasting over text in visual mode.
vnoremap p pgvy

" Remove training wheels you weak minded fool
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Tab to indent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Tab in insert mode either indents or autocompletes
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <expr> <tab> InsertTabWrapper()
" Shift tab reverts completion
inoremap <s-tab> <c-n>

" Faster substitute.
nnoremap <Leader>% :%s//<left>
vnoremap <Leader>% :s//<left>

" Strip trailing whitespace
nnoremap <Leader>w :%s/\s\+$//g<CR>
vnoremap <Leader>w :s/\s\+$//g<CR>

" Grepping
if executable('ag')
    " Use ag over grep if installed
    set grepprg=ag\ --vimgrep\ --nogroup\ --nocolor\ --ignore\ \"*.lock\"
    set grepformat=%f:%l:%c:%m

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0

    " bind \ (backward slash) to grep shortcut
    command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
else
    " Setup grep to be recursive, ignore binaries, and version control metadata
    set grepprg=egrep\ -srn\ --binary-files=without-match\ --color=never\ --exclude=.svn\ --exclude=.hg\ --exclude=.git --exclude=node_modules
endif

" ,g to grep the word under the cursor
:nnoremap <leader>g :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>

" Quick jumping between splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
" Open and close splits easily
nnoremap <silent> vv :set columns=205<BAR>:vsplit<CR>
nnoremap ss <C-W>s
nnoremap Q  <C-W>q
" Resize splits efficiently
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> _ :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> = <C-W>=

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
nnoremap <leader>0 :blast<CR>
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR>
nnoremap <leader>b :buffers<CR>:buffer<Space>

" diff shortcuts
noremap <leader>< :diffget<CR>
noremap <leader>> :diffput<CR>
" Make diffing faster
let g:diff_translations = 0

" press return in normal mode to click links for help nav
nnoremap <CR> <C-]>

" curly brace movement (overrides default requiring them to be flush left)
:map [[ ?{$<CR>w99[{<Space>
:map ][ /}$<CR>b99]}<Space>
:map ]] j0[[%/{$<CR><Space>
:map [] k$][%?}$<CR><Space>

" * Text Formatting -- Specific File Formats

" in text files, automatically format everything at 76 chars:
" autocmd FileType text set formatoptions+=t textwidth=76

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
autocmd FileType make set noexpandtab shiftwidth=8

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

" for Go, use tabs
autocmd FileType go set noexpandtab shiftwidth=4

" for js, use indent folding o_O
autocmd FileType javascript set foldmethod=indent

" Shorcut to manually set filetype
nnoremap <leader>t :set syntax=

" Where to look for tags
set tags+=./TAGS;,$HOME/.cache/tags

" Open URL under cursor
command! -bar -nargs=1 OpenURL :!open <args>
function! OpenURLUnderCursor()
    let l:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;:]*')
    if l:uri != ""
        exec '!open "' . l:uri . '"'
    else
        echo 'No URL found in line'
    endif
endfunction
nmap <silent> <Leader>o :call OpenURLUnderCursor()<CR><CR>

" Open current directory in Finder
nnoremap <leader>O :!open .<cr>

" Copy current file path to clipboard
nnoremap <silent> <leader>f :let @+=expand('%:p')<CR>

" Toggle line numbers
nnoremap <silent> <leader># :set invnumber<CR>
nnoremap <silent> <leader>@ :set invrelativenumber<CR>

" Toggle syntax folding, defaults off
nnoremap <silent> <leader>f :setlocal foldenable!<CR>
set foldmethod=syntax
set foldignore=
set foldnestmax=1
set foldminlines=3
set nofoldenable

" Lightweight embedded shell
nmap <silent> <leader>z :term ++close /usr/bin/env ZDOTDIR=/Users/caseyduncan/.minimal zsh<CR>

" fugitive
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gci :Gcommit --verbose<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>pr :term ++close<cr>ghpr<cr>

" * Plugin config

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1

let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

" Right split for undo tree with full width diff at bottom
let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators = 1
let g:undotree_HelpLine = 0

" key mappings for plugins
map <C-p> :CtrlPMixed<CR>
map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <leader>n :NERDTreeFind<CR>
map <C-u> :UndotreeToggle<CR>
nnoremap <silent> <leader>v :set columns=205<BAR>:Gstatus<CR>

