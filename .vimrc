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
set listchars=tab:▸\ ,eol:↲,nbsp:␣,trail:•,extends:⟫,precedes:⟪

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
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
augroup highlighting
    autocmd!
    " Save and restore search higlighting when entering and leaving insert mode
    autocmd InsertEnter * :let b:_search=@/|let @/=''
    autocmd InsertLeave * :let @/=get(b:,'_search','')
augroup END

" Tab to indent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Smart tab completion
function! Smart_TabComplete()
  let line = getline('.')
  let substr = strpart(line, -1, col('.')+1)
  let substr = matchstr(substr, "[^ \t]*$")
  if (col('.') == 1 || line[col('.') - 2] !~ '\k')
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1
  let has_slash = match(substr, '\/') != -1
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"
  elseif ( has_slash )
    return "\<C-X>\<C-F>"
  else
    return "\<C-X>\<C-O>"
  endif
endfunction
inoremap <expr> <tab> Smart_TabComplete()<BAR>!pumvisible()?"\<C-X>\<C-P>":""
" Shift tab reverts completion
inoremap <s-tab> <c-n>

" Autocomplete pop-up keybindings
inoremap <expr> <Esc>   pumvisible()?"\<C-E>":"\<Esc>"
inoremap <expr> <CR>    pumvisible()?"\<C-Y>":"\<CR>"
inoremap <expr> l       pumvisible()?"\<C-L>":"\l"
inoremap <expr> h       pumvisible()?"\<C-H>":"\h"
inoremap <expr> j       pumvisible()?"\<C-N>":"\j"
inoremap <expr> k       pumvisible()?"\<C-P>":"\k"
inoremap <expr> <Up>    pumvisible()?"\<C-P>":"\<Up>"
inoremap <expr> <Down>  pumvisible()?"\<C-N>":"\<Down>"
inoremap <expr> <c-f>   pumvisible()?"\<PageDown>\<C-P>\<C-N>":"\<PageDown>"
inoremap <expr> <c-b>   pumvisible()?"\<PageUp>\<C-P>\<C-N>":"\<PageUp>"

" Faster substitute
nnoremap <Leader>% :%s/
vnoremap <Leader>% :s/

" Register access
nnoremap <silent> <leader>r :registers<CR>
map <D-'> ""p
map <D-0> "0p
map <D-1> "1p
map <D-2> "2p
map <D-3> "3p
map <D-4> "4p
map <D-5> "5p
map <D-6> "6p
map <D-7> "7p
map <D-8> "8p
map <D-9> "9p
imap <D-'> <C-R>"
imap <D-0> <C-R>0
imap <D-1> <C-R>1
imap <D-2> <C-R>2
imap <D-3> <C-R>3
imap <D-4> <C-R>4
imap <D-5> <C-R>5
imap <D-6> <C-R>6
imap <D-7> <C-R>7
imap <D-8> <C-R>8
imap <D-9> <C-R>9

nnoremap <Leader>n :%g//norm <Left><Left><Left><Left><Left>
" Faster normal magic
nnoremap <Leader>n :%g//norm <Left><Left><Left><Left><Left>
vnoremap <Leader>n :norm 

" Strip trailing whitespace
nnoremap <Leader>w :%s/\s\+$//g<CR>
vnoremap <Leader>w :s/\s\+$//g<CR>

" Grepping
if executable('ag')
    " Use ag over grep if installed
    set grepprg=ag\ --vimgrep\ --nogroup\ --nocolor\ --ignore\ \'*.lock\'
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
    set grepprg=egrep\ -srn\ --binary-files=without-match\ --color=never\ --exclude=.svn\ --exclude=.hg\ --exclude=.git\ --exclude=node_modules
endif

" ,gr to grep the word under the cursor
:nnoremap <leader>gr :grep! "\b<C-R><C-W>\b"<CR>:cw<CR><CR>
" grep for selection
:vnoremap <leader>gr :grep! "<c-r>"" %<CR>:cw<CR><CR>

" Buffers, windows, and splits {{{
" Stolen fron yadr: https://github.com/skwp/dotfiles/blob/master/vim/settings/yadr-window-killer.vim
" Use Q to intelligently close a window 
" (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))

  " We should never bdelete a nerd tree
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif

  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction

nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

" Fast buffer switching
nnoremap <leader><leader> <c-^>
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprev!<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
nnoremap <leader>B :buffers<CR>:buffer<Space>

" Quick jumping between splits
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-H> <C-W>h
map <C-L> <C-W>l
" Open and close splits easily
nnoremap <silent> vv :set columns=205<BAR>:vsplit<CR>
nnoremap ss <C-W>s
" Resize splits efficiently
nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> _ <C-W>_
nnoremap <silent> = <C-W>=
" }}}

" diff shortcuts
noremap <leader>< :diffget<CR>
noremap <leader>> :diffput<CR>
" Make diffing faster
let g:diff_translations = 0

" press CTRL-return in normal mode to click links for help nav
nnoremap <c-CR> <C-]>

" curly brace movement (overrides default requiring them to be flush left)
map [[ ?{$<CR>w99[{<Space>
map ][ /}$<CR>b99]}<Space>
map ]] j0[[%/{$<CR><Space>
map [] k$][%?}$<CR><Space>

" skipping through lists
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>
nnoremap <leader>l :lclose<CR>
nnoremap ]c :cnext<CR>
nnoremap [c :cprevious<CR>

" Folding {{{
set foldenable
" Auto open/close folds
set foldopen=all
set foldclose=all
" Toggle automatic fold open/close
function! AutoFoldToggle()
    let l:cursetting = &foldclose
    if l:cursetting == 'all'
        set foldclose=
        set foldopen=
        echo 'auto-folding disabled'
    else
        set foldclose=all
        set foldopen=all
        echo 'auto-folding enabled'
    endif
endfunction
nnoremap <silent> <leader>z :call AutoFoldToggle()<CR>
" zM scrolls to reveal lines above
nnoremap zM zMzb
" zO even works when fold is partially open
nnoremap zO zczO
" open fold in split window
nnoremap <silent> zs :split +foldopen!<CR>
"set foldnestmax=1
"set foldminlines=3
" limit what's saved in views and sessions
set viewoptions=folds,cursor
set sessionoptions=folds
augroup fold
    autocmd!
    " Don't screw up folds when inserting text that might affect them, until
    " leaving insert mode. Foldmethod is local to the window.
    autocmd InsertEnter,WinLeave ?* let g:last_fdm=&foldmethod | setlocal foldmethod=manual
    autocmd InsertLeave,WinEnter ?* let &l:foldmethod=g:last_fdm
    " Save & restore view state when writing buffers
    " Making the view at BufWrite is too late, so as a workaround
    " we write one whenever the command line is used
    autocmd CmdlineLeave ?* silent! mkview!
    autocmd BufWritePost ?* silent! loadview
    " Save & retore view state when buffers are saved and loaded
    autocmd BufWinLeave,BufWritePost ?* silent! mkview!
    autocmd BufWinEnter ?* silent! loadview
augroup END
" }}}

" Text Formatting -- Specific File Formats {{{1
augroup formatting
autocmd!

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
autocmd FileType make set noexpandtab shiftwidth=8

" for HTML, generally format text, but if a long line has been created leave it
" alone when editing:
autocmd FileType html set formatoptions+=tl

function! GoFoldLevel(lnum)
    let l:line = getline(a:lnum)
    let l:lineabove = getline(a:lnum - 1)
    let l:linebelow = getline(a:lnum + 1)
    if l:line =~# '^\<func\>' || l:line =~# '^\<type\>'
        return 'a1'
    endif
    if l:line =~# '\s($' && l:line !~# '^)' && l:linebelow !~# ',$'
        return 'a1'
    endif
    if l:line =~# 'err != nil {$'
        return 'a1'
    endif
    if l:line =~# '^[})]$' && l:lineabove !~# ',$'
        return 's1'
    endif
    if l:line =~# '^\s*[})]$' && l:lineabove !~# ',$'
        let l:indent = indent(a:lnum)
        let l:cursor = a:lnum
        while l:cursor > 0
            let l:cursor = prevnonblank(l:cursor - 1)
            if indent(l:cursor) == l:indent 
                if getline(l:cursor) =~# 'err != nil {$'
                    return 's1'
                else
                    return '='
                endif
            endif
        endwhile
    endif
    if l:line != '' && l:line[0] !~# '\s' && l:line !~# '\s{$' 
        return 0
    endif
    return '='
endfunction

" Debug aid for fold-expr
nnoremap zl :echo 'expr: ' . GoFoldLevel(line('.')) .' level: ' . foldlevel(line('.'))<CR>

" for Go, use tabs
autocmd FileType go set noexpandtab shiftwidth=4

" for js, use indent folding o_O
autocmd FileType javascript set foldmethod=indent

" Enable spellcheck for content files
autocmd BufNewFile,BufRead *.md,*.rst,*.txt,*.html,README set spell

" Fold text files manually
autocmd FileType text set foldmethod=manual

" Fold vim config files by marker
autocmd FileType vim set foldmethod=marker

autocmd FileType python,c,cpp,ruby set foldmethod=syntax

autocmd FileType go set foldmethod=expr foldexpr=GoFoldLevel(v:lnum)

" Unfold gitcommits
autocmd FileType gitcommit set foldlevel=1

" Use pgsql highlighting
autocmd BufNewFile,BufRead *.sql set filetype=pgsql

augroup END " formatting }}}

" Shortcut to manually set filetype
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
command! O !open .

" Copy current file path to clipboard
command! File let @+=expand('%:p')

" Toggle line numbers
nnoremap <silent> <leader># :set invnumber<CR>
nnoremap <silent> <leader>@ :set invrelativenumber<CR>
set number
set relativenumber

" Enable folding
set foldenable
set foldmethod=syntax
set foldignore=
" Toggle syntax folding locally
nnoremap <silent> <leader>z :setlocal foldenable!<CR>
" zM scrolls to reveal lines above
nnoremap zM zMzz
" zO even works when fold is partially open
nnoremap zO zczO
" open fold in split window
nnoremap <silent> zs :split +foldopen!<CR>
"set foldnestmax=1
"set foldminlines=3
augroup fold
    autocmd!
    " Don't screw up folds when inserting text that might affect them, until
    " leaving insert mode. Foldmethod is local to the window.
    autocmd InsertEnter,WinLeave * let g:last_fdm=&foldmethod | setlocal foldmethod=manual
    autocmd InsertLeave,WinEnter * let &l:foldmethod=g:last_fdm
    " Save & restore view state when writing buffers
    " Making the view at BufWrite is too late, so as a workaround
    " we write one whenever the command line is used
    autocmd CmdlineLeave * mkview!
    autocmd BufWritePost * loadview
    " Save & retore view state when buffers are saved and loaded
    autocmd BufWinLeave * mkview!
    autocmd BufWinEnter * silent loadview
augroup END

" Lightweight embedded shell
command! Term term ++close /usr/bin/env ZDOTDIR=/Users/caseyduncan/.minimal zsh

" Plugins {{{

" fugitive
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gs :Gstatus<cr>
nnoremap <silent> <leader>gw :Gwrite<cr>
nnoremap <silent> <leader>gb :Gblame<cr>
nnoremap <silent> <leader>gco :Gcheckout<cr>
nnoremap <silent> <leader>gci :Gcommit --verbose<cr><C-W>_
nnoremap <silent> <leader>gp :Gpush<cr>
nnoremap <silent> <leader>pr :term ++close<cr>ghpr<cr>

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeAutoDeleteBuffer = 1

let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s '
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale = 1

" Right split for undo tree with full width diff at bottom
let g:undotree_WindowLayout = 4
let g:undotree_ShortIndicators = 1
let g:undotree_HelpLine = 0

" key mappings for plugins
map <C-p> :CtrlPMixed<CR>
nnoremap <leader>r :CtrlPRegisters<CR>
map <C-n> :NERDTreeToggle<CR>
map <C-u> :UndotreeToggle<CR>

" ctrl-p funky
nnoremap <leader>f :CtrlPFunky<CR>
" Find function under cursor
nnoremap <leader>F :execute 'CtrlPFunky ' . expand('<cword>')<CR>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_funky_after_jump = 'zo'

" vim-gitgutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
nmap <Leader>ha <Plug>(GitGutterStageHunk)
nmap <Leader>hu <Plug>(GitGutterUndoHunk)
nmap <silent> <Leader>hc :GitGutterStageHunk<CR>:Gcommit<CR>

" vim-go
au FileType go nmap <silent> <leader>gob :w<CR>:GoBuild<CR>
au FileType go nmap <silent> <leader>got :w<CR>:GoTest<CR>
au FileType go nmap <silent> <leader>gof :w<CR>:GoTestFunc<CR>
au FileType go nmap <silent> <leader>goi :GoImport<CR>
au FileType go nmap <silent> <leader>god :GoDelsDir<CR>
au FileType go nmap <silent> <leader>goa :GoAlternate<CR>
let g:go_test_timeout =  '30s'
let g:go_fmt_command = 'gofmt' " don't auto-delete imports!
let g:go_auto_type_info = 1    " get signature/type info for object under cursor
" syntax highlighting
let g:go_highlight_functions = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_format_strings = 1
" nnoremap <leader>gol :GoLint<BAR>:GoVet<CR>

" conoline
let g:conoline_auto_enable = 1

" ale
let g:ale_linters = {
    \   'go': ['gometalinter', 'gofmt'],
    \   'javascript': ['eslint'],
\}
" }}}
