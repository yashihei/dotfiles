set nocompatible

"========================================
" NeoBundle
"========================================
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim.git'
NeoBundle 'Shougo/vimproc'

NeoBundle 'Shougo/unite.vim.git'
NeoBundle 'Shougo/vimshell.git'
NeoBundle 'Shougo/vimfiler.git'
NeoBundle 'Shougo/neocomplcache.git'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'tomtom/tcomment_vim'

filetype plugin indent on

"========================================
" KeyMap
"========================================
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
nnoremap <silent> <Space>ev :edit $MYVIMRC<CR>
nnoremap <silent> <Space>eg :edit $MYGVIMRC<CR>
nnoremap <silent> <Space>rv :source $MYVIMRC<CR>
nnoremap <silent> <Space>rg :source $MYGVIMRC<CR>
" バッファ周り
" nnoremap <Space>b :ls<CR>
nnoremap <silent> <Space>n :bn<CR>
nnoremap <silent> <Space>p :bp<CR>
nnoremap <silent> <Space>d :bdelete<CR>
nnoremap <silent> <Space>D :bdelete!<CR>

"========================================
" Encoding
"========================================
" 文字コードをUTF-8にする
set encoding=UTF-8
" カレントバッファ内の文字コードをUTF-8にする
set fileencoding=UTF-8

"========================================
" View
"========================================
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
"ステータスラインに表示
" 常にステータス行を表示
set laststatus=2
" コマンドをステータス行に表示
set showcmd
" タイトルを表示
set title
" 括弧入力時に対応する括弧を表示
set showmatch " タブ文字、行末など不可視文字を表示する
"set list
" listで表示される文字のフォーマットを指定する
"set listchars=tab:^\ ,extends:<

"========================================
" File
"========================================
" 変更中のファイルでも、保存しないで他のファイルを表示
set hidden
" ファイル内容が変更されると自動読み込みする
set autoread
" バックアップファイルなんてねえから！
set nobackup
" スワップファイルなんてねえから！
set noswapfile

"========================================
" Input
"========================================
" 自動的にインデントする
set autoindent
" C風にインデントする 
set cindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" カーソルキーで行末／行頭の移動可能に設定
set whichwrap=b,s,[,],<,>

"========================================
" Tab
"========================================
" Tabを空白に変換しない
set noexpandtab
" ファイルを開いた時のTab文字(<Tab>, \t)を空白何文字分で表示するか
set tabstop=4
" 自動インデントや << or >> で入力されるインデントの幅
set shiftwidth=4
" 入力中にTabキーを押した時、何文字分の空白で表示するか
set softtabstop=4

"========================================
" Serch
"========================================
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

"========================================
" Etc
"========================================
" クリップボードを共有
set clipboard=unnamed,autoselect
" ビープ音やフラッシュを消す
set vb t_vb=

"========================================
" unite
"========================================
" インサートモード
let g:unite_enable_start_insert = 0
" バッファ一覧
nnoremap <silent> <Space><Space> :<C-u>Unite buffer<CR>
" カレントディレクトリ下を一気にがーっと検索
nnoremap <silent> <Leader>uf :<C-u>Unite file_rec<CR>
" カレントバッファなんとかをひらく
nnoremap <silent> <Leader>uc :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
" 最近使用したファイル一覧
nnoremap <silent> <Leader>um :<C-u>Unite file_mru<CR>
" れじすた
nnoremap <silent> <Leader>ur :<C-u>Unite register<CR>
" ウィンドウを分割して開く
autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
autocmd FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

"========================================
" vimfiler
"========================================
" vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
" セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default = 0
" 現在開いているバッファのディレクトリを開く
nnoremap <silent> <Leader>f :<C-u>VimFiler<CR>
" IDE風になる
" nnoremap <silent> <Leader>fi :<C-u>VimFilerExplorer<CR>

"========================================
" neocomplcache
"========================================
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
" なんかおおもじでいいことになるらしい 
" let g:neocomplcache_enable_camel_case_completion = 1
" アンダーバー
let g:neocomplcache_enable_underbar_completion = 1
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

""vimshell
nnoremap <silent> <Leader>s :VimShellBufferDir<CR>

""syntastic
nnoremap <silent> <Leader>e :Error<CR>

