" CTRL-P Extension to fuzzy search registers for put

" Return the registers as a list
function! cpregisters#init()
    redir => l:regs
    silent registers
    redir END
    return split(l:regs, '\n')[1:]
endfunction

" Put the selected register content
function! cpregisters#put(mode, str)
    call ctrlp#exit()
    let l:parts = split(a:str, "  ")
    exec "norm " . l:parts[1] . "p"
endfunction

" Register the extension
call add(g:ctrlp_ext_vars, {
	\ 'init': 'cpregisters#init()',
	\ 'accept': 'cpregisters#put',
	\ 'lname': 'search registers to put',
	\ 'sname': 'registers',
	\ 'type': 'line',
	\ 'sort': 0,
	\ })

" Give the extension an ID
let s:cpregisters_id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! cpregisters#id()
	return s:cpregisters_id
endfunction

command! CtrlPRegisters call ctrlp#init(cpregisters#id())
