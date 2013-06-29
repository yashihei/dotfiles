"========================================
"       .__                       
" ___  _|__| ____________   ____  
" \  \/ /  |/     \_  __ \_/ ___\ 
"  \   /|  |  Y Y  \  | \/\  \___ 
"   \_/ |__|__|_|  /__|    \___  >
"                \/            \/ 
"========================================

" todo :
" まーかー関係
" (encoding)

" NeoBundle {{{
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))
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

"できなさそう…
"NeoBundleLazy 'scrooloose/nerdcommenter', {
    "\ 'autoload' : {
    "\ 'mappings' : [['nvo', '<Plug>NERDCommenter']]
    "\ }}
NeoBundle 'scrooloose/nerdcommenter'

"NeoBundleLazy 'Shougo/neocomplcache', {
    "\ 'autoload' : {
    "\ 'insert' : 1,
    "\ }}

"NeoBundleLazy 'Shougo/neosnippet', {
    "\ 'autoload' : {
    "\ 'insert' : 1,
    "\ }}

NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'tomasr/molokai'

"neocom
"shipmate
"syntax
"powerline

"NeoBundle 'rgarver/Kwbd.vim'
"NeoBundle 'vim-scripts/buftabs'
"NeoBundle 'fholgado/minibufexpl.vim'
" }}}

" Options {{{

" general {{{
filetype plugin indent on
syntax enable

" encoding
set fileformats=unix,dos,mac
set encoding=utf-8 "一応明示
scriptencoding utf-8
"set fileencoding=utf-8 "encodingと同じ
"set fileencodings=

" file
set nobackup
set noswapfile

set autoread "他の場所でファイルの内容が変えられた場合、読み直す
set clipboard=unnamed
"set clipboard=unnamedplus
set backspace=indent,eol,start
set whichwrap=b,s "<BS>と<Space>が行頭行末で止まらない
set showmatch "対応する括弧にわずかにジャンプ
set hidden "ファイルを編集中でも他のバッファを開けるように
set ambiwidth=double "○とかでくずれない
set vb t_vb= "ビープは消毒
set foldmethod=marker "マーカーで折りたたみを指定
set history=50
"set notimeout
"set timeoutlen=1000 "default:1000
set matchpairs+=<:> "括弧に<>を追加する
colorscheme molokai

"set spell "スペルチェック
"set autowrite "自動保存的な
"set mouse=a "まうす…おいしい？
"set shortmess+= "でふぉ:filnxtToO
"set virtualedit=
"set scrolloff=0
"set scrolljump=5
" }}}

" ui {{{
set number
set title
set nowrap "折り返さない
" listchars
set list
set listchars=tab:»-,trail:-,nbsp:%,eol:↲ "タブと全半角と改行
" command
set showcmd
set showmode
set cmdheight=2
" statusline {{{
set laststatus=2 "常時表示される
set ruler
"< 切り詰め
"f 相対パス
"F 絶対パス
"m 修正フラグ
"h ヘルプバッファフラグ
"r 読み取り専用フラグ
"w プレビューフラグ
"= 左寄せと右寄せの区切り
"l 何行目にカーソルがあるか
"L バッファ内の総行数
"c 何列目にカーソルがあるか
"P 表示テキストがファイルの何%の位置にあるか
"if winwidth(0) >= 120
"set statusline=
set statusline=%<%f\ %m%h%r%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=[%l,%v][%p%%]
"set statusline=%<%f\ %m%h%r%w
"set statusline=%=\ [%{(&fenc!=''?&fenc:&enc)}:%{&ff}]\[%04l,%04v][%p%%]
" }}}
" }}}

" indent {{{
set autoindent
set smartindent "k
set expandtab "タブをスペースに展開
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set smarttab
"set cindent
"set cinoptions+=:0
if has("autocmd")
    autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2
    autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
endif
" }}}

" search {{{
set ignorecase
set smartcase
set incsearch
set hlsearch
"set wrapscan "ループ
" }}}

" complete {{{
"set complete=.,w,b,u,t,i
set wildmenu
set wildchar=<tab>
set wildmode=list:longest,full
"set pumheight=20 "ポップアップ数 0で無制限
" }}}

"}}}

" Keymap {{{
" editvimrc
nnoremap <silent> <Space>ev :edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg :edit $MYGVIMRC<CR>
nnoremap <silent> <Space>rv :source $MYVIMRC<CR>
nnoremap <silent> <Space>rg :source $MYGVIMRC<CR>

" バッファ操作
nnoremap <silent> <Space>n :bn<CR>
nnoremap <silent> <Space>p :bp<CR>

" from http://nanasi.jp/articles/vim/kwbd_vim.html
"com! Kwbd let kwbd_bn= bufnr("%")|enew|exe "bdel ".kwbd_bn|unlet kwbd_bn 
"nnoremap <silent> <Space>d :Kwbd<CR>
"nnoremap <silent> <Space>d :wincmd c<CR>
"nnoremap <silent> <Space>d :bdelete<CR>
"nnoremap <silent> <Space>D :bdelete!<CR>

nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

nnoremap j gj
nnoremap k gk

nnoremap <silent> <Esc><Esc> :nohlsearch<CR>

inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
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
"let g:NERDCreateDefaultMappings=1
"map <Leader>t <Plug>NERDCommenterToggle
"let bundle = neobundle#get('nerdcommenter')
"function! bundle.hooks.on_source(bundle)
"    map <Leader>c <Plug>NERDCommenterToggle
"    let g:NERDCreateDefaultMappings=0
"endfunction

" neocomplcache
"let g:neocomplcache_enable_at_startup=1
"let bundle = neobundle#get('neocomplcache')
"function! bundle.hooks.on_source(bundle)
    "let g:neocomplcache_enable_smart_case=0 "大文字小文字を無視(大文字が入力されるまで)
    "let g:neocomplcache_enable_camel_case_completion=0
    "let g;neocomplcache_enable_underbar_completion=0
    "let g:neocomplcache_enable_fuzzy_completion=0
    "let g:neocomplcache_min_syntax_length=3 "補完を始める文字数
"endfunction

" buftabs
"let g:buftabs_only_basename=1
"let g:buftabs_active_highlight_group="Visual"
"let g:buftabs_in_statusline=1

" }}}

