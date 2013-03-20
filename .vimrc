set nocompatible

""NeoBundle
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/vimproc'

NeoBundle 'Shougo/unite.vim.git'
"NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'scrooloose/nerdtree.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'vim-jp/vimdoc-ja'

filetype plugin indent on

""KeyMap
" てんきーで改行
nnoremap <CR> o<ESC>
" すべて選択
nnoremap <Space>a ggVG
" esc連打でハイライトからおさらば
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
" 行単位で移動
nnoremap j gj
nnoremap k gk
" vimrcを簡単にいじるため
nnoremap <silent> <Space>ev :<C-u>edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg :<C-u>edit $MYGVIMRC<CR>
nnoremap <silent> <Space>rv :<C-u>source $MYVIMRC<CR>
nnoremap <silent> <Space>rg :<C-u>source $MYGVIMRC<CR>

""Encoding
" 文字コードをUTF-8にする
set encoding=UTF-8
" カレントバッファ内の文字コードをUTF-8にする
set fileencoding=UTF-8

" クリップボードを共有
set clipboard=unnamed
" ビープ音やフラッシュを消す
set vb t_vb=

""View
" 行番号を表示する
set number
" カレント行をハイライト
set cursorline
" ルーラーを表示
set ruler
" 長い行を折り返して表示
set wrap
" コマンドラインの高さ (gvimはgvimrcで指定)
set cmdheight=2
" 常にステータス行を表示
set laststatus=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 括弧入力時に対応する括弧を表示
set showmatch
" タブ文字、行末など不可視文字を表示する
set list
" listで表示される文字のフォーマットを指定する
set listchars=tab:^\ ,extends:<

""File
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" ファイル内容が変更されると自動読み込みする
set autoread
" バックアップファイルなんてねえから！
set nobackup
" スワップファイルなんてねえから！
set noswapfile

""Input
" 自動的にインデントする
set autoindent
" C風にインデントする 
set cindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>

""Tab
" Tabを空白に変換しない
set noexpandtab
" ファイルを開いた時のTab文字(<Tab>, \t)を空白何文字分で表示するか
set tabstop=4
" 自動インデントや << or >> で入力されるインデントの幅
set shiftwidth=4
" 入力中にTabキーを押した時、何文字分の空白で表示するか
set softtabstop=4

""Serch
" 検索文字をハイライト
set hlsearch
" インクリメンタルサーチ(ぐーぐる先生もつかってるあれだよ！
set incsearch
" 検索時に大文字小文字を無視
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
" 検索時にファイルの最後まで行ったら最初に戻る
set wrapscan

""unite
" インサートモード
let g:unite_enable_start_insert = 0
 
" カレントディレクトリ下を一気にがーっと検索
nnoremap <silent> <Space>f :<C-u>Unite file_rec<CR>
" 最近使用したファイル一覧
nnoremap <silent> <Space>m :<C-u>Unite file_mru<CR>
" バッファ一覧
nnoremap <silent> <Space>b :<C-u>Unite buffer<CR>

" ウィンドウを分割して開く
autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
 
""vimfiler
" 現在開いているバッファのディレクトリを開く
nnoremap <silent> <Leader>fe :<C-u>VimFilerBufferDir -quit<CR>
" 現在開いているバッファをIDE風に開く
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
 
" デフォルトのキーマッピングを変更
augroup vimrc
  autocmd FileType vimfiler call s:vimfiler_my_settings()
augroup END
function! s:vimfiler_my_settings()
  nmap <buffer> q <Plug>(vimfiler_exit)
  nmap <buffer> Q <Plug>(vimfiler_hide)
endfunction

""neocomplcache
let g:neocomplcache_enable_at_startup = 1

