let g:polyglot_disabled = ['autoindent', 'sensible']
call plug#begin('~/.vim/plugged')
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mhinz/vim-signify'
Plug 'vim-airline/vim-airline'
Plug 'dense-analysis/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-dispatch'
Plug 'vim-scripts/a.vim'
Plug 'sheerun/vim-polyglot'
" Colorscheme
Plug 'morhetz/gruvbox'
Plug 'kaicataldo/material.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sainnhe/sonokai'
Plug 'jsit/toast.vim'
Plug 'arcticicestudio/nord-vim'
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
let mapleader=','
set number                    ",line numbers
set nolist                    " hide EOL chars
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

if (is_fb == "0")
  set path+=**,~/fbcode,~/configerator,~/fbcode2        " goto fbcode files
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
nmap <leader>p :set invpaste<CR>
nmap <leader>r :set invrelativenumber<CR> 
" Fbgs word under cursor
nmap <leader>g :Fbgs <C-R><C-W><CR>   
imap <leader>f {<Esc>o}<Esc>O
" Go no next/prev method name in python
nmap [w [mw
nmap ]w ]mw
" arc lint current file
nnoremap <leader>l :exec '!arc lint -a %'<cr>
nmap <leader>tj :tabp<cr>
nmap <leader>tk :tabn<cr>
nmap <leader>tt :tabnew<cr>
nmap <leader>td :tabc<cr>
" go to nearest TARGETS
nmap <leader>w :tabnew !~/bin/tgt.sh<cr>
nnoremap <silent> <leader>y :call system('nc localhost 8377', @0)<CR>


" Autocmds
if (is_fb == "0")
  " Arc lint current file on write 
  "autocmd BufWritePost *.py,*.cpp,*.rs,TARGETS,*.thrift silent! exec '!arc lint -a %' | :e 
  " Format TARGETS on save, stolen from P75711758, lots of good stuff here
  autocmd BufWritePost TARGETS silent! exec
        \ '!~/fbsource/tools/third-party/buildifier/run_buildifier.py -i %' | :e
  " In TARGETS files, on go to file (gf), replace //PATH with PATH/TARGETS
  autocmd BufNewFile,BufRead TARGETS setlocal includeexpr=substitute(v:fname,'//\\(.*\\)','\\1/TARGETS','g')
endif

" Netrw
nnoremap <leader>e :Lexplore<cr>
let g:netrw_liststyle = 3
let g:netrw_banner = 0
let g:netrw_winsize = 25

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

if (is_fb == "0")
  " MYC
  set rtp+=/usr/local/share/myc/vim

  " FZF or MYC depending on dir (stolen P75711758)
  if getcwd() =~ '/fbsource[1-9]*/fbcode$'
    nnoremap <leader>a :Fbgs<Space>
    nnoremap <C-p> :MYC<CR>
  elseif getcwd() =~ '/configerator'
    nnoremap <leader>a :CBGS<Space>
    nnoremap <C-p> :Files<CR>
  else
    nnoremap <Leader>a :Rg<CR>
    nnoremap <C-p> :Files<CR>
  endif
endif

" Deoplete
let g:deoplete#enable_at_startup = 1
if (is_fb == "0")
  let g:python3_host_prog = "/home/cmorrison/venv/bin/python3"
endif
" Use <tab> to continue completion 
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" ALE
let g:ale_disable_lsp = 1
"let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 1
let g:ale_set_balloons = 1

nmap gd <Plug>(ale_go_to_definition)
nmap gy <Plug>(ale_go_to_type_definition)
nmap gr <Plug>(ale_find_references)

nmap <leader>j <Plug>(ale_next_wrap)
nmap <leader>k <Plug>(ale_previous_wrap)
nmap <leader>v <Plug>(ale_detail)
nmap <leader>f :ALEFix<cr>

" FZF
nmap <silent> <leader>z :History<cr>
nmap <silent> <leader>b :Buffers<cr>

if (is_fb == "0")
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
  noremap <leader>m :call ToggleComment()<CR>
endif



