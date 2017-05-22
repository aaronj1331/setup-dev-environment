set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" theme plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'colepeters/spacemacs-theme.vim'
Plugin 'croaker/mustang-vim'

" clojure plugins
Plugin 'paredit.vim'
Plugin 'tpope/vim-fireplace'

" Python plugins
Plugin 'klen/python-mode'

" generally useful plugins
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'powerline/powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'jpalardy/vim-slime'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""
""" other vimrc stuff
"""

let mapleader = "\<Space>"

filetype on
filetype indent on
filetype plugin on

" backspace stuff
set backspace=indent,eol,start

" whitespace stuff
set tabstop=4 softtabstop=0 shiftwidth=4 smarttab expandtab 

" remove leading " when joining two comment lines
set formatoptions+=j

set spelllang=en_us

" Plugin configurations
let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ":"}
let g:slime_python_ipython = 1


"" my key bindings

" selection key bindings
nnoremap <leader>sa ggVG
nnoremap <leader>say ggVG"*y

" edit, source .vimrc, respectively
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" send something across with vim-slime
inoremap <C-g> <esc>Vy:'<,'>SlimeSend<cr>`>A<cr>
inoremap <C-h> <esc>Vipy:'<,'>SlimeSend<cr>`>A<cr><cr>
nnoremap <C-g> Vy:'<,'>SlimeSend<cr>`><cr>
nnoremap <C-h> Vipy:'<,'>SlimeSend<cr>`>}j
vnoremap <C-g> y:'<,'>SlimeSend<cr>`>
vnoremap <C-h> y:'<,'>SlimeSend<cr>`>

" navigate splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" remap j and k to gj and gk, respectively.  
" This will make j and k work even on long lines that have been wrapped.
nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')
"
" I used to do it like this, but it would advance the curser by one column
" every time I went down a line. The current way solves that problem.
" nnoremap j gj 
" nnoremap k gk

" use jk to exit insert mode. <esc> now does nothing
inoremap jk <esc>
inoremap <esc> <nop>

" visual line mode
nnoremap <Leader><Leader> V

" move lines up and down (mostly for Clojure editing)
nnoremap <Leader>u i<C-w><backspace><esc>l
nnoremap <Leader>d i<cr><esc>k$

" open a NERDTree
nnoremap <Leader>t :NERDTree<cr>

" open file, close buffer
nnoremap <Leader>o :CtrlP<cr>

" buffer keys
nnoremap <Leader>bl :buffers<cr>
nnoremap <Leader>bk :bdelete<cr>

" tab keys
nnoremap <Leader>tN :tabnew<cr>
nnoremap <Leader>tn :tabnext<cr>
nnoremap <Leader>tp :tabprevious<cr>

" toggle relative line numbers
nnoremap <Leader>nr :set relativenumber!<cr>

" save file
" nnoremap <Leader>w :write<cr>
nnoremap <Leader>fs :write<cr>

" toggle show cursor lines
nnoremap <Leader>hc :set cursorcolumn!<cr>
nnoremap <Leader>hl :set cursorline!<cr>

" toggle search highlight
nnoremap <Leader>hs :set hls!<cr>

" toggle syntax highlighting
nnoremap <Leader>hx :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif<cr>

" toggle show column 80
nnoremap <Leader>h8n :set colorcolumn=80<cr>
nnoremap <Leader>h8f :set colorcolumn=<cr>

" toggle spell checking
nnoremap <Leader>hp :set spell!<cr>

"" general display stuff

syntax on          " use syntax highlighting

set bg=dark        " use dark theme
set number         " show line numbers on the left side
set ruler          " show line, column numbers in the status bar
set wrap           " wrap long lines

set t_Co=256       " use 256 colors

" use the Mustang theme if available
colorscheme mustang

"" search options

set incsearch
set ignorecase
set smartcase
set hlsearch
