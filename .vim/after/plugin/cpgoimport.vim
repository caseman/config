" CTRL-P Extension to fuzzy search go.mod to add imports

" Add this to your .vimrc to invoke via <leader>i
" nnoremap <silent> <leader>i :CtrlPGoImport<CR>

if !( exists('g:loaded_ctrlp') && g:loaded_ctrlp )
    " bail if ctrlp is not loaded
	fini
endif

" Return the go modules defined in go.mod as a list
function! cpgoimport#init()
    return systemlist('egrep -o "\t+([^ ]*)" $(git rev-parse --show-toplevel 2> /dev/null)/go.mod | awk "{print $1}"')
endfunction

" Invoke GoImport with the selected package
function! cpgoimport#put(mode, str)
    call ctrlp#exit()
    silent exec "GoImport " . trim(a:str)
endfunction

" Register the extension
call add(g:ctrlp_ext_vars, {
	\ 'init': 'cpgoimport#init()',
	\ 'accept': 'cpgoimport#put',
	\ 'lname': 'import go.mod package',
	\ 'sname': 'goimport',
	\ 'type': 'line',
	\ 'sort': 1,
	\ })

" Give the extension an ID
let s:cpgoimport_id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! cpgoimport#id()
	return s:cpgoimport_id
endfunction

command! CtrlPGoImport call ctrlp#init(cpgoimport#id())
