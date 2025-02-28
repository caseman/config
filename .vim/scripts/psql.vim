" vim script for PSQL_EDITOR
source ~/.minimal-vimrc
" silent! below split ~/scratch/queries.sql
" Read the psql history file into a temporary buffer
silent! below split PSQL_HISTORY
setlocal buftype=nofile
silent! read ~/.psql_history
" munge the history file format into something more readable
" and filter out psql \* commands
silent! %!tr '\001' '\n' | grep -v '^\\'
normal! G
set ft=sql
" land back at the top window
2wincmd k

