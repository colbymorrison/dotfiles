" --- vimrc ---
" For neovim 
" Lua config lives at ~/.config/nvim/lua/config

" -- Plugins -- 
if !has('ide') 
	let g:polyglot_disabled = ['autoindent', 'sensible']
	call plug#begin('~/.vim/plugged')
	Plug 'vim-scripts/a.vim'
	Plug 'vim-airline/vim-airline'
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
	nmap <leader>j <Action>(GotoNextError)
	nmap <leader>k <Action>(GotoPreviousError)
	nmap <C-h> <Action>(PrevSplitter)
	nmap <C-l> <Action>(NextSplitter)
	nmap ]c <Action>(VcsShowNextChangeMarker)
	nmap [c <Action>(VcsShowPrevChangeMarker)
	finish
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
nmap <silent> <leader>z :History<cr>
nmap <silent> <leader>b :Buffers<cr>
nmap <C-p> :Files<CR>

" Pgsql
let g:sql_type_default = 'pgsql'
source ~/.vim/autoload/comment.vim
