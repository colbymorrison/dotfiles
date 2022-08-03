if !has('ide') 
	let g:polyglot_disabled = ['autoindent', 'sensible']
	call plug#begin('~/.vim/plugged')
	Plug 'vim-scripts/a.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'tpope/vim-fugitive'
	Plug 'junegunn/fzf' 
	Plug 'junegunn/fzf.vim' 
	Plug 'preservim/nerdtree'
	Plug 'lifepillar/pgsql.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'mhinz/vim-signify'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'mfussenegger/nvim-jdtls'
	Plug 'neovim/nvim-lspconfig'

	" Colorscheme
	Plug 'morhetz/gruvbox'
	Plug 'kaicataldo/material.vim'
	Plug 'dracula/vim', { 'as': 'dracula' }
	Plug 'arcticicestudio/nord-vim'
	Plug 'sainnhe/sonokai'
	call plug#end()
endif

" ---Vanilla vim settings---
if !has("nvim") && filereadable("~/scripts/vim/nvim-defaults.vim")
   source ~/scripts/vim/nvim-defaults.vim
endif

" General settings
set nocompatible              " be iMproved
" filetype off                  
filetype indent plugin on           
syntax enable
let mapleader=","
set number                    " line numbers
set nolist                    " hide EOL chars
set path+=**                  " goto fbcode files
set shellslash                " fileslash by OS
set nofixendofline            " add EOL at end of file
set noerrorbells              " no terminal bells
set tags=tags;/               " search up directory tree for tags
set undolevels=10000          " number of undos stored 
set viminfo='50,"50           " number of marks and registers saved
set modelines=0               " no modelines
set scrolloff=8               " show 8 lines below cursor
set linebreak                 " break on words
set nocursorbind              " don't scroll splits together
set inccommand=nosplit        " highlight substitute commands
set t_Co=256
set autoindent
set mouse=a
set spelllang=frc             
set spellfile=$HOME/.vim/spell/en.utf-8.add
set switchbuf+=usetab,newtab  " open quickfix in newtab unless already open

" Search
set incsearch                 " search with typeahead
set hlsearch                  " hilight all searches 

" Scrolling
set scrolljump=5              " scroll five lines at a time vertically when at bottom
set sidescroll=10             " minumum columns to scroll horizontally
" Mappings
nmap <Enter> O<Esc>
nmap <silent> <leader>c :noh<cr>
nmap <C-x> :close<cr>
nmap <leader>s :so ~/.vimrc<cr>
nmap <leader>pa :set invpaste<CR>
nmap <leader>r :set invrelativenumber<CR> 
" Fbgs word under cursor
nmap <leader>g :FBGS <C-R><C-W><CR>   
imap <leader>f {<Esc>o}<Esc>O
" Go no next/prev method name in python
nmap [w [mw
nmap ]w ]mw
" arc lint current file
nnoremap <leader>l :exec '!arc lint -a %'<cr>
" Tabs
nmap <leader>tj :tabp<cr>
nmap <leader>tk :tabn<cr>
nmap <leader>tt :tabnew<cr>
nmap <leader>td :tabc<cr>
" Copy current path
nmap <leader>py :let @" = expand("%");call system($CPY_PRG, @0)<cr>
nmap <silent> <leader>y :call system($CPY_PRG, @0)<CR>

nnoremap <leader>e :NERDTreeToggle %<CR>

" Colors
set background=dark
colo sonokai


"--- Plugins ----
if !has('ide')
	" NERDTree
	let g:NERDTreeWinSize=50

	" Signify
	set updatetime=100
	nmap <leader>hu :SignifyHunkUndo<cr>
	nmap <leader>hp :SignifyHunkDiff<cr>
	let g:signify_sign_delete = '-'

	" Airline
	let g:airline#extensions#hunks#enabled=0

	" Deoplete
	let g:deoplete#enable_at_startup = 1
	" Use <tab> to continue completion 
	inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
	let g:python3_host_prog='/usr/bin/python3'

	" Vim-latex-suite
	set grepprg=grep\ -nH\ $* 
	let g:tex_flavor='latex'
	let g:tex_no_error=1
	let g:Tex_DefaultTargetFormat='pdf'
	let g:Tex_ViewRule_pdf = 'zathura'
	imap <C-g> <Plug>IMAP_JumpForward
	nmap <C-g> <Plug>IMAP_JumpForward
	let g:Tex_PromptedEnvironments='equation,equation*,align,align*,enumerate,itemize,figure,table,theorem,lemma,tikzpicture'
	let g:Tex_GotoError=0 

	" FZF
	nmap <silent> <leader>z :History<cr>
	nmap <silent> <leader>b :Buffers<cr>
	nmap <C-p> :Files<CR>

	" Pgsql
	let g:sql_type_default = 'pgsql'

	source ~/.vim/autoload/comment.vim
endif

if has('ide')
	nmap gr <Action>(FindUsages)
	nmap <C-p> <Action>(GotoFile)
	nmap <C-t> <Action>(GotoAction)
	nmap <leader>j <Action>(GotoNextError)
	nmap <leader>k <Action>(GotoPreviousError)
	nmap <C-h> <Action>(PrevSplitter)
	nmap <C-l> <Action>(NextSplitter)
	nmap ]c <Action>(VcsShowNextChangeMarker)
	nmap [c <Action>(VcsShowPrevChangeMarker)
endif
