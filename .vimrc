set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'godlygeek/tabular'
Plugin 'rizzatti/dash.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'derekwyatt/vim-scala'
Plugin 'kien/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rking/ag.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'
Plugin 'shime/vim-livedown'

" navigate tmux with vim keys
Bundle 'christoomey/vim-tmux-navigator'

call vundle#end()            " required
filetype plugin indent on    " required

set clipboard=unnamed " set default to system clipboard

" use 256 colors
set t_Co=256

" display statusbar always
set laststatus=2

" settings from http://dougblack.io/words/a-good-vimrc.html

set showmatch           " highlight matching [{()}]
set number              " show line numbers
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

nnoremap B ^
nnoremap <space> <leader>
let mapleader = "\<Space>"

" remap one leader key to easymotion
map <Leader> <Plug>(easymotion-prefix)

set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.

syntax enable
set background=dark
colorscheme solarized

set autoindent
filetype plugin indent on

" expand tabs
set expandtab
set shiftwidth=2
set softtabstop=2

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" speed up control-p
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'

map , :w <bar> :! pdflatex %

" bind K to grep word under cursor
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>

" more natural splitting
set splitbelow
set splitright

" kill search with leader + /
nnoremap <silent> <Leader>/ :nohlsearch<CR>

" wrap at 80 characters
set textwidth=80

" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1 
