"========================================
"       .__                       
" ___  _|__| ____________   ____  
" \  \/ /  |/     \_  __ \_/ ___\ 
"  \   /|  |  Y Y  \  | \/\  \___ 
"   \_/ |__|__|_|  /__|    \___  >
"                \/            \/ 
"========================================

" todo :

" NeoBundle {{{
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
    \ }}

NeoBundleLazy 'scrooloose/nerdtree', {
    \ 'autoload' : {
    \ 'commands' : 'NERDTreeToggle'
    \ }}

NeoBundleLazy 'Buffergator', {
    \ 'autoload' : {
    \ 'commands' : 'BuffergatorOpen'
    \ }}

NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'scrooloose/nerdcommenter'
"NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'tomasr/molokai'
"NeoBundle 'twilight256.vim'
"NeoBundle 'twilight'

call neobundle#end()

filetype plugin indent on

" いつか入れるかも
"neocom
"shipmate
"syntax
"powerline
"tagsk
" }}}

" basic {{{
syntax enable

set nobackup
set noswapfile
set autoread
set clipboard=unnamed
"set clipboard=unnamedplus
set backspace=indent,eol,start
set whichwrap=b,s
set showmatch
set hidden
set ambiwidth=double
set vb t_vb=
set foldmethod=marker
set history=50
set t_Co=256
set notitle "Vimを使ってくれてありがとう(呪)
set matchpairs+=<:>
colorscheme molokai

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
set cmdheight=2

" statusline
set laststatus=2 "常時表示
"if winwidth(0) >= 120
"set statusline=
set statusline=%<%f\ %m%h%r%w "<切り詰め f相対パス m修正フラグ hヘルプ r読専 wプレビュー
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'} "文字コードと、改行コード
set statusline+=%=[%l,%v][%p%%] " =右寄せ lカーソルの位置(行）

" indent
set autoindent
set smartindent "k
set expandtab "タブをスペースに展開
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set smarttab
"set cindent
"set cinoptions+=:0

" search
set ignorecase
set smartcase
set incsearch
set hlsearch
"set wrapscan "ループ

" complete
"set complete=.,w,b,u,t,i
set wildmenu
set wildchar=<tab>
set wildmode=list:longest,full
"set pumheight=20 "ポップアップ数 0で無制限
"}}}

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

nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

inoremap <silent> <Esc><Esc>:set iminsert=0<CR>

nnoremap <C-p> "0p
" }}}

" Plugin {{{
" nerdtree
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>N :NERDTreeClose<CR>
let bundle = neobundle#get('nerdtree')
function! bundle.hooks.on_source(bundle)
    let g:NERDTreeShowBookmarks=1
    let g:NERDTreeShowHidden=1
"    let g:NERDTreeBookmarksFile='~/.vim/.cache/NERDTreeBookmarks'
endfunction

" BufferGator
" for Lazy
nnoremap <silent> <Leader>b :BuffergatorOpen<CR>
nnoremap <silent> <Leader>B :BuffergatorClose<CR>
let bundle = neobundle#get('Buffergator')
function! bundle.hooks.on_source(bundle)
    let g:buffergator_viewport_split_policy="B"
    let g:buffergator_suppress_keymaps=1 "not map
    "let g:buffergator_hplit_size=20
    "let g:buffergator_split_size=40 "でふぉると40
endfunction

" nerdcommenter

" molokai
"let g:molokai_original = 1

" }}}

