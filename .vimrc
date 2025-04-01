" --- vimrc ---
" For neovim 
" Lua config lives at ~/.config/nvim/lua/config

" -- Plugins -- 
if !has('ide') 
	let g:polyglot_disabled = ['autoindent', 'sensible']
	call plug#begin('~/.vim/plugged')
	Plug 'vim-scripts/a.vim'
	" Plug 'vim-airline/vim-airline'
	Plug 'junegunn/fzf' 
	Plug 'junegunn/fzf.vim' 
	Plug 'preservim/nerdtree'
	Plug 'lifepillar/pgsql.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'mhinz/vim-signify'
	Plug 'sainnhe/sonokai'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'neovim/nvim-lspconfig'
	Plug 'L3MON4D3/LuaSnip', {'tag': 'v1.*'}
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'psf/black', { 'branch': 'stable' }

	" Completion
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'hrsh7th/vim-vsnip'

	call plug#end()
endif

" --- Vanilla vim settings ---
if !has("nvim") && filereadable("~/scripts/vim/nvim-defaults.vim")
   source ~/scripts/vim/nvim-defaults.vim
endif


" -- General settings -- 
filetype indent plugin on           
syntax enable
let mapleader=","
set nocompatible              			" be iMproved
set number                    			" line numbers
set nolist                    			" hide EOL chars
set path+=**                  			" goto fbcode files
set shellslash                			" fileslash by OS
set nofixendofline            			" add EOL at end of file
set noerrorbells              			" no terminal bells
set tags=tags;/               			" search up directory tree for tags
set undolevels=10000          			" number of undos stored 
set viminfo='50,"50           			" number of marks and registers saved
set modelines=0               			" no modelines
set scrolloff=8               			" show 8 lines below cursor
set linebreak                 			" break on words
set nocursorbind              			" don't scroll splits together
set inccommand=nosplit        			" highlight substitute commands
set t_Co=256 					" use 256 colors
set autoindent					" autoindent
set mouse=a					" use mouse
set spelllang=en_us             		" spelling
set spellfile=$HOME/.vim/spell/en.utf-8.add	" spellfile
set switchbuf+=usetab,newtab  			" open quickfix in newtab unless already open
set visualbell		              		" no beeps
set completeopt=menu,menuone,noselect 		" completion config. Show menu when >= 1 option and force user to select
set incsearch                 			" search with typeahead
set hlsearch                  			" hilight all searches 
set scrolljump=5              			" scroll five lines at a time vertically when at bottom
set sidescroll=10             			" minumum columns to scroll horizontally
set notermguicolors				" Neovim was making colors look wierd without this

" -- Mappings --
nmap <Enter> O<Esc>
nmap <silent> <leader>c :noh<cr>
nmap <leader>s :so ~/.vimrc<cr>
nmap <leader>pa :set invpaste<CR>
nmap <leader>r :set invrelativenumber<CR> 
nmap <C-f> :Rg<cr>
imap <leader>f {<Esc>o}<Esc>O
" Go no next/prev method name in python
nmap [w [mw
nmap ]w ]mw
" Tabs
nmap <leader>tj :tabp<cr>
nmap <leader>tk :tabn<cr>
nmap <leader>tt :tabnew<cr>
nmap <leader>td :tabc<cr>
" Copy current path
nmap <leader>py :let @" = expand("%");call system($CPY_PRG, @0)<cr>
nmap <silent> <leader>y :call system($CPY_PRG, @0)<cr>
nnoremap <F9> :!Black %<cr>


" -- Color --
set background=dark
color sonokai

" -- Intellij -- 
if has('ide')
	set clipboard+=unnamed
	nmap gr <Action>(FindUsages)
	nmap <leader>z <Action>(RecentFiles)
	nmap <C-p> <Action>(GotoFile)
	nmap <C-t> <Action>(FindInPath)
	nmap <C-a> <Action>(GotoAction)
	nmap <leader>j <Action>(GotoNextError)
	nmap <leader>k <Action>(GotoPreviousError)
	nmap <C-h> <Action>(PrevSplitter)
	nmap <C-l> <Action>(NextSplitter)
	nmap ]c <Action>(VcsShowNextChangeMarker)
	nmap [c <Action>(VcsShowPrevChangeMarker)
	finish
endif

" -- Xcode (via https://github.com/mickael-menu/ShadowVim) --
if exists('g:shadowvim')
 	" Naviagtion
 	map gd <Cmd>SVPress <LT>C-D-j><CR>
 	map gr <Cmd>SVPress <LT>C-S-D-f><CR>
 	map <C-o> <Cmd>SVPress <LT>C-D-Left><CR>
 	map <C-i> <Cmd>SVPress <LT>C-D-Right><CR>
	
	" Search
	map <C-p> <Cmd>SVPress <LT>C-p><CR>
	map <C-q> <Cmd>SVPress <LT>C-D-j><CR>
	map <C-w> <Cmd>SVPress <LT>C-D-j><CR>
 
 	" Window management
 	map <C-w>v <Cmd>SVPress <LT>C-D-t><CR>
 	map <C-w>s <Cmd>SVPress <LT>C-M-D-t><CR>
 	map <C-w>h <Cmd>SVPress <LT>D-j><CR><Cmd>SVPress h<CR><Cmd>SVPress <LT>CR><CR>
 	map <C-w>j <Cmd>SVPress <LT>D-j><CR><Cmd>SVPress j<CR><Cmd>SVPress <LT>CR><CR>
 	map <C-w>k <Cmd>SVPress <LT>D-j><CR><Cmd>SVPress k<CR><Cmd>SVPress <LT>CR><CR>
 	map <C-w>l <Cmd>SVPress <LT>D-j><CR><Cmd>SVPress l<CR><Cmd>SVPress <LT>CR><CR>
 	map <C-w>w <Cmd>SVPress <LT>C-`><CR>
 
 	" ZZ
 	map zz <Cmd>SVPress <LT>C-M-S-D-l><CR>
 
 	" Folding
 	map zc <Cmd>SVPress <LT>M-D-Left><CR>
 	map zo <Cmd>SVPress <LT>M-D-Right><CR>
 	map zM <Cmd>SVPress <LT>M-S-D-Left><CR>
 	map zR <Cmd>SVPress <LT>M-S-D-Right><CR>
endif

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
endif

"--- Plugin Configs ----
" NERDTree
let g:NERDTreeWinSize=50
nnoremap <leader>e :NERDTreeToggle %<CR>

" Signify
set updatetime=100
let g:signify_sign_delete = '-'
nmap <leader>hu :SignifyHunkUndo<cr>
nmap <leader>hp :SignifyHunkDiff<cr>

" Airline
let g:airline#extensions#hunks#enabled=0

" Vim-latex-suite
set grepprg=grep\ -nH\ $* 
let g:tex_flavor='latex'
let g:tex_no_error=1
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf = 'zathura'
let g:Tex_PromptedEnvironments='equation,equation*,align,align*,enumerate,itemize,figure,table,theorem,lemma,tikzpicture'
let g:Tex_GotoError=0 
imap <C-g> <Plug>IMAP_JumpForward
nmap <C-g> <Plug>IMAP_JumpForward

" FZF
if !exists("g:shadowvim")
	nmap <silent> <leader>z :History<cr>
	nmap <silent> <leader>b :Buffers<cr>
	nmap <C-p> :Files<CR>
endif

" Pgsql
let g:sql_type_default = 'pgsql'
source ~/.vim/autoload/comment.vim
