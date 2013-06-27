"========================================
"       .__                       
" ___  _|__| ____________   ____  
" \  \/ /  |/     \_  __ \_/ ___\ 
"  \   /|  |  Y Y  \  | \/\  \___ 
"   \_/ |__|__|_|  /__|    \___  >
"                \/            \/ 
"========================================
" todo

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

"neocom?
"syntax
"powerline

NeoBundleLazy 'scrooloose/nerdtree', {
    \ 'autoload' : {
    \ 'commands' : ['NERDTreeToggle']
    \ }}

NeoBundle 'Smooth-Scroll'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'tomasr/molokai'
NeoBundle 'rgarver/Kwbd.vim'
NeoBundle 'vim-scripts/buftabs'
"NeoBundle 'fholgado/minibufexpl.vim'
"NeoBundle 'tomtom/tcomment_vim'
" }}}

" Options {{{

filetype plugin indent on
syntax enable

set clipboard+=unnamed
set hidden "ファイルを編集中でも他のバッファを開けるように
set backspace=indent,eol,start
set whichwrap=b,s "<BS>と<Space>が行頭行末で止まらない
set ambiwidth=double
set nowritebackup
set vb t_vb= "ビープは消毒
set showmatch
set foldmethod=marker
set history=50
set timeout
set timeoutlen=500 "default:1000
colorscheme molokai

" encoding
set fileformats=unix,dos,mac
set encoding=UTF-8
"set fileencoding=UTF-8

" file
set nobackup
set noswapfile
set autoread "他の場所でファイルの内容が変えられた場合、読み直す

" indent {{{
set autoindent
set smartindent "k
set expandtab "タブをスペースに展開
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
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
"set wildmenu
"set wildchar=<tab>
"set wildmode=
"set history=
set pumheight=20 "ポップアップ数
" }}}

" ui {{{
set number
set title
set nowrap "折り返さない
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
"set statusline=%<%f\ %m%h%r%w
"set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
"set statusline+=%=%l/%L%8P
set statusline=%<%f\ %m%h%r%w
set statusline=%=\ [%{(&fenc!=''?&fenc:&enc)}:%{&ff}]\[%04l,%04v][%p%%]
" }}}
" listchars {{{
set list
set listchars=tab:»-,trail:-,nbsp:%,eol:↲ "タブと全半角と改行
" }}}
" command {{{
set showcmd
set showmode
set cmdheight=2
" }}}
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
nnoremap <silent> <Space>d :Kwbd<CR>
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
"
" Plugin {{{
" nerdtree
nnoremap <silent> <Leader>n :NERDTreeToggle<CR>

" buftabs
let g:buftabs_only_basename=1
let g:buftabs_active_highlight_group="Visual"
let g:buftabs_in_statusline=1

"minibuf
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBuffs = 1
" }}}

