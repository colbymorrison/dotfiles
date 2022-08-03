if exists('g:vscode')
    let mapleader=","
	" vscode-neovim mappings to get as close to terminal nvim with my plugins
	" as possible
	nmap <silent> <leader>c :noh<cr>
	nmap <C-x> :close<cr>
	nmap <leader>s :so ~/.vimrc<cr>
	nmap <Enter> O<Esc>
	nmap <silent> <leader>c :noh<cr>
	" Go no next/prev method name in python
	nmap [w [mw
	nmap ]w ]mw
	nmap <leader>tj :tabp<cr>
	nmap <leader>tk :tabn<cr>
	nmap <leader>tt :tabnew<cr>
	nmap <leader>td :tabc<cr>
    nmap <leader>y :call system('xclip -selection clipboard', @0)<CR>

	nmap gr :call VSCodeNotify("editor.action.goToReferences")<cr>
	nmap <leader>j :call VSCodeNotify("editor.action.marker.next")<cr>
	nmap <leader>k :call VSCodeNotify("editor.action.marker.prev")<cr>
	nmap <leader>d :close<cr>
	nmap <leader>f :call VSCodeNotify("editor.action.formatDocument")<cr>
	nmap <leader>n :call VSCodeNotify("editor.action.rename")<cr>
	nmap <leader>w :call VSCodeNotify("buck.lsp.open_nearest_buck_file")<cr>
	nmap [c :call VSCodeNotify("workbench.action.editor.nextChange")<cr>
	nmap ]c :call VSCodeNotify("workbench.action.editor.previousChange")<cr>
	nmap <leader>hu :call VSCodeNotify("fb-hg.revertHunk")<cr>
	nmap <leader>hp :call VSCodeNotify("editor.action.dirtydiff.next")<cr>
	nmap <C-w>v :call VSCodeNotify("workbench.action.splitEditorRight")<cr>
	nmap <C-w>s :call VSCodeNotify("workbench.action.splitEditorDown")<cr>
	nmap <C-k> :call VSCodeNotify("workbench.action.focusAboveGroup")<cr>
	nmap <C-j> :call VSCodeNotify("workbench.action.focusBelowGroup")<cr>
	nmap <C-h> :call VSCodeNotify("workbench.action.focusLeftGroup")<cr>
	nmap <C-l> :call VSCodeNotify("workbench.action.focusLeftGroup")<cr>
	command A call VSCodeNotify("cpp:switch-header-source")<cr>
else
	set runtimepath^=~/.vim runtimepath+=~/.vim/after
	let &packpath = &runtimepath
	source ~/.vimrc
endif

lua require('config')
