" Vim launch script to grep for file matches and open in location window

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

if executable('ag')
    " Use ag over grep if installed
    set grepprg=ag\ --vimgrep\ --nogroup\ --nocolor\ --ignore\ \"*.lock\"
    set grepformat=%f:%l:%c:%m

    nnoremap \ :Ag<SPACE>
else
    " Setup grep to be recursive, ignore binaries, and version control metadata
    set grepprg=egrep\ -srn\ --binary-files=without-match\ --color=never\ --exclude=.svn\ --exclude=.hg\ --exclude=.git\ --exclude=node_modules
endif



