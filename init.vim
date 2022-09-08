
call plug#begin("~/.vim/plugged")
	" Plugin Section Plug 'dracula/vim'
	Plug 'preservim/nerdtree'
  Plug 'airblade/vim-gitgutter'
  Plug 'sheerun/vim-polyglot'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'PhilRunninger/nerdtree-buffer-ops'
	Plug 'PhilRunninger/nerdtree-visual-selection'
	Plug 'ryanoasis/vim-devicons'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
  Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': 'TSUpdate'}
  Plug 'nvim-treesitter/playground'
  Plug 'tveskag/nvim-blame-line'
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
  let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-tsserver', 'coc-pairs']
	Plug 'ryanoasis/vim-devicons'
  Plug 'mfussenegger/nvim-jdtls'
  
  "LSP CLIENT AND AUTOINSTALLER "
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'

  Plug 'kdheepak/lazygit.nvim'
  Plug 'justinmk/vim-sneak'
  Plug 'preservim/nerdcommenter'
  Plug 'tpope/vim-fugitive'
  Plug 'Everblush/everblush.nvim', { 'as': 'everblush'}
  Plug 'APZelos/blamer.nvim'
  Plug 'enricobacis/vim-airline-clock'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'justinhj/battery.nvim'
  Plug 'psliwka/vim-smoothie'
  Plug 'norcalli/nvim-colorizer.lua'
call plug#end()
"
"Config Section
 
"Colorscheme options
colorscheme everblush

"NERDTREE stuff-------
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
"
" Automatically close nvim if NERDTree is the only thing left open 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
"open on startup nerdtree
"autocmd VimEnter * NERDTree
"
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
"
"Open on new tab 
"autocmd BufEnter * NERDTreeMirror
"autocmd VimEnter * wincmd w

"reveal in nerdtree
nnoremap <Leader>, :NERDTreeFind<CR> <bar> <C-w>w
:let g:NERDTreeWinSize=50
"--------------------

"Terminal stuff-------
"turn terminal to normal mode with escape 
tnoremap <Esc> <C-\><C-n>

"start terminal in insert mode 
"au BufEnter * if &buftype == 'terminal' | :startinsert | endif

"open terminal on ctrl+n
function! OpenTerminal()
  vsplit term://zsh
  vertical resize 50
endfunction 
nnoremap <c-n> :call OpenTerminal()<CR>
"--------------------

"Nvim options--------
"Search Options
set hlsearch
set ignorecase
set incsearch
set smartcase

"Text rendering options
set display+=lastline
set linebreak
set wrap 

" User Interface OPtions
set laststatus=2
set ruler
set wildmenu
set tabpagemax=50
set cursorline
set number
set relativenumber
set nornu
set noerrorbells
set visualbell
set mouse=a
set title
set clipboard=unnamed,unnamedplus

"Code Folding Options
set nofoldenable

"Open new split panes to right and below 
set splitright
set splitbelow

"Use alt+hjkl to move between split/vsplit panels 
nnoremap ˙ <C-w>h
nnoremap ∆ <C-w>j
nnoremap ˚ <C-w>k
nnoremap ¬ <C-w>l

"Misc
set autoread
set backspace=indent,eol,start
set confirm
set hidden
set history=1000
set nomodeline
set nospell
set relativenumber
set nowrap
set encoding=UTF-8
set autoindent
filetype plugin on
filetype indent off 
set smartindent
set expandtab
set shiftround
set shiftwidth=2
set smarttab
set tabstop=2
set relativenumber
"--------------------

"FZF Stuff-----------
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit',
  \}
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --no-ignore-vcs -g "!node_modules/*" -g "!.git/*" -g "!*.class" -g "!bin/*"'
nnoremap <silent> <C-\> :FzfPreviewProjectFilesRpc<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>d :Lines<CR>

inoremap <expr> <TAB> pumvisible() ? "<C-y>" : "<TAB>"
"--------------------
"
"setup mapping to call :lazygit
nnoremap <silent> <Leader>gg :LazyGit<CR>

"vim sneak stuff
map f <Plug>Sneak_s
map F <Plug>Sneak_S

"Lua requirements 
lua require('init')

"Blamer stuff------- 
let g:blamer_enabled=1
let g:blamer_delay=250
"-------------------

