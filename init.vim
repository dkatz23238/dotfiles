" Basics
set hidden lazyredraw showmode novisualbell number ttyfast

" Whitespace configuration
set nowrap tabstop=2 shiftwidth=2 softtabstop=2 expandtab smartindent nofixendofline

" Menu stuff
set wildmode=list:full
set wildignore+=*.d.ts,*.o,*.obj,.git,*.rbc,*.class,.svn,vendor/gems/*
set wildignore+=deploy/**,dist/**,release/**,*.min.js,*.js.map

" Search
set hlsearch incsearch ignorecase smartcase

" better colors
set termguicolors

" Use modeline overrides
set modeline modelines=10

set mouse=a

" Undo and backup
set undofile
set nobackup
set nowritebackup
set undodir=~/.config/nvim/undo
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/swp

let mapleader=" "

set clipboard=unnamedplus

set diffopt=vertical,iwhiteall

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

autocmd FileType gitcommit setlocal tw=72 | set spell | set colorcolumn=50

call plug#begin('~/.config/nvim/plugged')

""""""""""""""""""""""""""""""""""""""
" general
""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-ragtag'
Plug 'wellle/targets.vim'

Plug 'tpope/vim-commentary'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

""""""""""""""""""""""""""""""""""""""
" Rust/toml
""""""""""""""""""""""""""""""""""""""
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'

""""""""""""""""""""""""""""""""""""""
" JavaScript / tsx
""""""""""""""""""""""""""""""""""""""
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'

""""""""""""""""""""""""""""""""""""""
" Git
""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'int3/vim-extradite'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'elzr/vim-json'

Plug 'crusoexia/vim-monokai'
Plug 'tomasr/molokai'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'honza/vim-snippets'
Plug 'joaohkfaria/vim-jest-snippets'

Plug 'easymotion/vim-easymotion'

Plug 'antoinemadec/coc-fzf'
Plug 'neoclide/coc-python'


" NerdTree
Plug 'preservim/nerdtree'
Plug 'severin-lemaignan/vim-minimap'
call plug#end()

let g:coc_global_extensions = [ 'coc-snippets', 'coc-json',   'coc-rls', 'coc-eslint', 'coc-tsserver', 'coc-css', 'coc-stylelint', 'coc-prettier', 'coc-git', 'coc-python' ]
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#buffer_idx_mode = 1

nnoremap <leader>f :FZF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <silent> <expr> <leader>e g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"

map , <Plug>(easymotion-prefix)

let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'
set background=dark


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
