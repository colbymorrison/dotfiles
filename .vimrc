let g:polyglot_disabled = ['autoindent', 'sensible']
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/a.vim'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'mhinz/vim-signify'
Plug 'christoomey/vim-tmux-navigator'
Plug 'hhvm/vim-hack'
Plug 'preservim/nerdtree'

" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'kaicataldo/material.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sickill/vim-monokai'
Plug 'arcticicestudio/nord-vim'
Plug 'sainnhe/sonokai'
Plug 'jsit/toast.vim'
call plug#end()

let is_fb=substitute(system('echo $HOSTNAME | grep facebook.com > /dev/null; echo $?'),"\n","","")

" ---Vanilla vim settings---
if (is_fb == "0")
  let g:fb_default_opts = 0                  " use my settings below
  " read the top of this file for info about local admin scripts
  source $LOCAL_ADMIN_SCRIPTS/master.vimrc   " sets shiftwidth, tabstop, softtabstop, expandtab
endif

if !has("nvim") && filereadable("~/scripts/vim/nvim-defaults.vim")
  source ~/scripts/vim/nvim-defaults.vim
endif

" General settings
set nocompatible              " be iMproved
filetype off                  
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
set autoindent
set mouse=a
set spelllang=en              
set spellfile=$HOME/.vim/spell/en.utf-8.add
set switchbuf+=usetab,newtab  " open quickfix in newtab unless already open


if (is_fb == "0")
  set path+=**,~/fbcode,~/configerator,~/fbcode2        " goto fbcode files
else
    " Indents
    set tabstop=4
    set shiftwidth=4
    "replace all tabs with tabstop spaces
    set expandtab 
endif

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
nmap <leader>py :let @" = expand("%");call system('nc localhost 8377', @0)<cr>


" Autocmds
if (is_fb == "0")
  " go to nearest TARGETS
  nmap <leader>w :tabnew `~/scripts/tgt.sh %`<cr>
  nnoremap <silent> <leader>y :call system('nc localhost 8377', @0)<CR>
  " Arc lint current file on write 
  "autocmd BufWritePost *.py,*.cpp,*.rs,TARGETS,*.thrift silent! exec '!arc lint -a %' | :e 
  " Format TARGETS on save, stolen from P75711758, lots of good stuff here
  autocmd BufWritePost TARGETS silent! exec
        \ '!~/fbsource/tools/third-party/buildifier/run_buildifier.py -i %' | :e
  " In TARGETS files, on go to file (gf), replace //PATH with PATH/TARGETS
  autocmd BufNewFile,BufRead TARGETS setlocal includeexpr=substitute(v:fname,'//\\(.*\\)','\\1/TARGETS','g')
endif

" NERDTree
nnoremap <leader>e :NERDTreeToggle %<CR>

" Colors
set background=dark
colo sonokai


"--- Plugins ----
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
if (is_fb == "0")
  let g:python3_host_prog = "/home/cmorrison/venv/bin/python3"
endif

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


" ALE
" let g:ale_disable_lsp = 1
"let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 1
let g:ale_set_balloons = 1

nmap gd <Plug>(ale_go_to_definition)
nmap gD <Plug>(ale_go_to_definition_in_tab)
nmap gy <Plug>(ale_go_to_type_definition)
nmap gr <Plug>(ale_find_references)

nmap <leader>j <Plug>(ale_next_wrap)
nmap <leader>k <Plug>(ale_previous_wrap)
nmap <leader>v <Plug>(ale_detail)
nmap <leader>f :ALECodeAction<cr>

" FZF
nmap <silent> <leader>z :History<cr>
nmap <silent> <leader>b :Buffers<cr>
nmap <C-p> :Files<CR>

if (is_fb == "0")
  " Disable hh quickfix on save cuz we have lsp
  let g:hack#enable = 0

  " Deoplete
  let g:python3_host_prog = "/home/cmorrison/venv/bin/python3"

  " MYC
  set rtp+=/usr/local/share/myc/vim

  " FZF or MYC depending on dir (stolen P75711758)
  if getcwd() =~ '/fbsource[1-9]*/fbcode$' 
    nmap <leader>a :FBGS<Space>
    nmap <C-p> :MYC<CR>
  elseif getcwd() =~ '/configerator'
    nmap <leader>a :CBGS<Space>
    nmap <C-p> :MYC<CR>
  elseif getcwd() =~ '/www'
    nmap <leader>a :CBGS<Space>
    nmap <C-p> :MYC<CR>
  else
    nmap <Leader>a :Rg<CR>
    nmap <C-p> :Files<CR>
  endif

  " Dispatch
  nmap <leader>d :Dispatch buck 

  "--- Local Admin Scripts ---
  function! BigGrepFzf(query, fullscreen)
    let command_fmt = 'fbgs --ignore-case --stripdir %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  command! -nargs=* -bang Fbgs call BigGrepFzf(<q-args>, <bang>0)

  source $LOCAL_ADMIN_SCRIPTS/vim/pyre.vim
  source $LOCAL_ADMIN_SCRIPTS/vim/toggle_comment.vim
  autocmd BufReadPost *.cinc let b:comment_prefix = "#"
  autocmd BufReadPost *.cconf let b:comment_prefix = "#"
  autocmd BufReadPost *.mcconf let b:comment_prefix = "#"
  source $LOCAL_ADMIN_SCRIPTS/vim/biggrep.vim
endif




function! Redir(cmd, rng, start, end)
	for win in range(1, winnr('$'))
		if getwinvar(win, 'scratch')
			execute win . 'windo close'
		endif
	endfor
	if a:cmd =~ '^!'
		let cmd = a:cmd =~' %'
			\ ? matchstr(substitute(a:cmd, ' %', ' ' . expand('%:p'), ''), '^!\zs.*')
			\ : matchstr(a:cmd, '^!\zs.*')
		if a:rng == 0
			let output = systemlist(cmd)
		else
			let joined_lines = join(getline(a:start, a:end), '\n')
			let cleaned_lines = substitute(shellescape(joined_lines), "'\\\\''", "\\\\'", 'g')
			let output = systemlist(cmd . " <<< $" . cleaned_lines)
		endif
	else
		redir => output
		execute a:cmd
		redir END
		let output = split(output, "\n")
	endif
	vnew
	let w:scratch = 1
	setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
	call setline(1, output)
endfunction

command! -nargs=1 -complete=command -bar -range Redir silent call Redir(<q-args>, <range>, <line1>, <line2>)

function! Hgblame()
  execute "Redir !hgblame %"
  execute "set nonumber"
  execute "vertical resize 30"
  execute "file hg blame"
  execute "windo set cursorbind"
endfunction
nnoremap <leader>hb :call Hgblame()<cr>
