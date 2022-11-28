if !has('ide') 
	let g:polyglot_disabled = ['autoindent', 'sensible']
	call plug#begin('~/.vim/plugged')
	Plug 'vim-scripts/a.vim'
	Plug 'vim-airline/vim-airline'
	" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'tpope/vim-fugitive'
	Plug 'junegunn/fzf' 
	Plug 'junegunn/fzf.vim' 
	Plug 'preservim/nerdtree'
	Plug 'lifepillar/pgsql.vim'
	Plug 'sheerun/vim-polyglot'
	Plug 'mhinz/vim-signify'
	Plug 'sainnhe/sonokai'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'mfussenegger/nvim-jdtls'
	Plug 'neovim/nvim-lspconfig'
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }

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
set visualbell		      " no beeps

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
color sonokai


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
	"let g:deoplete#enable_at_startup = 1
	"" Use <tab> to continue completion 
	"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
	"let g:python3_host_prog='/usr/bin/python3'

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

	let g:Hexokinase_highlighters = ['backgroundfull']

	source ~/.vim/autoload/comment.vim
	set completeopt=menu,menuone,noselect
	lua <<EOF
  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Set up lspconfig.
  local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')['tsserver'].setup {
    capabilities = capabilities
  }
EOF
endif

if has('ide')
	set clipboard+=unnamed
	nmap gr <Action>(FindUsages)
	nmap <leader>z <Action>(RecentFiles)
	nmap <C-p> <Action>(GotoFile)
	nmap <C-t> <Action>(SearchEverywhere)
	nmap <leader>j <Action>(GotoNextError)
	nmap <leader>k <Action>(GotoPreviousError)
	nmap <C-h> <Action>(PrevSplitter)
	nmap <C-l> <Action>(NextSplitter)
	nmap ]c <Action>(VcsShowNextChangeMarker)
	nmap [c <Action>(VcsShowPrevChangeMarker)
endif
