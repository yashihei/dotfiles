"========================================
"       .__                       
" ___  _|__| ____________   ____  
" \  \/ /  |/     \_  __ \_/ ___\ 
"  \   /|  |  Y Y  \  | \/\  \___ 
"   \_/ |__|__|_|  /__|    \___  >
"                \/            \/ 
"========================================

" color
syntax enable
"colorscheme molokai
set t_Co=256

" editor
"set clipboard=unnamed
set clipboard=unnamedplus
set vb t_vb=
set history=50
set notitle
set matchpairs+=<:>
set foldmethod=marker

" cursor
set backspace=indent,eol,start
set whichwrap=b,s
"set scrolloff=8

" file
set nobackup
set noswapfile
set hidden
set autoread

" encoding
set fileformats=unix,dos,mac
set encoding=utf-8
scriptencoding utf-8

" view
set number
set title
set nowrap
set list
set listchars=tab:»-,trail:-,nbsp:%,eol:↲ 
set showcmd
set showmode
set showmatch
set cmdheight=2
set ambiwidth=double

" statusline
set laststatus=2
"if winwidth(0) >= 120
"<切り詰め f相対パス m修正フラグ hヘルプ r読専 wプレビュー
set statusline=%<%f\ %m%h%r%w
"文字コードと、改行コード
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
"=右寄せ lカーソルの位置(行）
set statusline+=%=[%l,%v][%p%%]

" indent
set autoindent
set smartindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
"set smarttab
"set cindent
"set cinoptions+=:0

" search
set ignorecase
set smartcase
set incsearch
set hlsearch
"set wrapscan

" complete
"set complete=.,w,b,u,t,i
set wildmenu
set wildchar=<tab>
set wildmode=list:longest,full
"set pumheight=20

" Keymap {{{
" editvimrc
nnoremap <silent> <Space>eg :edit $MYGVIMRC<CR>
nnoremap <silent> <Space>ev :edit $MYVIMRC<CR>
nnoremap <silent> <Space>rv :source $MYVIMRC<CR>
nnoremap <silent> <Space>rg :source $MYGVIMRC<CR>

" バッファ操作
nnoremap <silent> <Space>n :bn<CR>
nnoremap <silent> <Space>p :bp<CR>

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap <silent> sv :vs<CR>
nnoremap <silent> ss :sp<CR>

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap j gj
nnoremap k gk

nnoremap ; :

nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

inoremap <silent> <Esc><Esc>:set iminsert=0<CR>

nnoremap <C-p> "0p
" }}}

