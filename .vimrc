" 基本設定 {{{1

    "タブ {{{2
        set tabstop=4
        set shiftwidth=4
        set softtabstop=4
        "タブ文字の表示/非表示
        set nolist
    "}}}2
    "検索 {{{2
        "インクリメンタル検索設定
        set incsearch
        "検索結果をハイライトして表示
        set hlsearch
        "小文字だけで検索すると小文字と大文字を区別しない
        "大文字を含めて検索すると小文字と大文字の区別を有効にする
        set ignorecase
        set smartcase
        "検索がファイル末尾まで進んだら，ファイル先頭から再び検索する
        set wrapscan
    "}}}2
    "コマンドラインモードにおける補完機能 {{{2
        set wildmenu
        set wildmode=list:longest
    "}}}2
    "スワップファイルが見つかった場合にROで開く {{{2
    augroup swapchoice-readonly
        autocmd!
        autocmd SwapExists * let v:swapchoice = 'o'
    augroup END
    "}}}2
    " モードラインを有効にする
    set modeline
    "3行目までをモードラインとして検索する
    set modelines=3
    "行数表示
    set number
    "ヘルプの日本語化
    set helplang=ja
    "undo履歴の永続化"
    set undofile
    set undodir=/home/daisaku/.vimundo
    "折り畳み"
    set foldmethod=marker
    "上下の視界確保
    set scrolloff=8
    " 入力したコマンドを表示
    set showcmd
    " 保存していない場合に確認を取る
    set confirm 
    " ステータスラインを常に表示する
    set laststatus=2
    "ルーラーを有効化
    set ruler
    "履歴の追加"
    set history=200
    "一行の文字数が多くても表示
    set display=lastline
    "netrw"
    filetype plugin on
"テンプレート {{{1
    "tex
    autocmd BufNewFile *.tex 0r $HOME/.vim/template/tex.txt
"マッピング {{{1
    "記法　nnoremap 設定したいコマンド <C-u>既存のコマンド<CR>
    map <Space> [Space]
    noremap [Space] <Nop>
    "Y(行全体をヤンク)を行末までヤンクに変更
    nnoremap Y y$
    nnoremap Q <Nop>
    nnoremap ZZ <Nop>
    nnoremap ZQ <Nop>
    nnoremap <Space>w :<C-u>w<CR>
    nnoremap <Space>q :<C-u>q<CR>
    nnoremap <Space>Q :<C-u>q!<CR>
    nnoremap <silent> [b :bprevious<CR>
    nnoremap <silent> ]b :bnext<CR>
    nnoremap <silent> [B :bfirst<CR>
    nnoremap <silent> ]B :blast<CR>
"カラースキーム {{{1
    syntax on
    set cursorline  "カーソルが存在するラインの強調
    set background=dark
    set t_Co=256

"NeoBundle {{{1

filetype off

if has('vim_starting')
    set nocompatible
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

    "Shougo/unite.vim {{{2
        NeoBundle 'Shougo/unite.vim'
        
            " 入力モードで開始する
            let g:unite_enable_start_insert=1
            "バッファ一覧
            noremap <C-P> :Unite buffer<CR>
            "ファイル一覧
            noremap <C-N> :Unite -buffer-name=file file<CR>
            "最近使ったファイルの一覧
            noremap <C-Z> :Unite file_mru<CR>
            "sourcesを「今開いているファイルのディレクトリ」とする
            noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
            "ウィンドウを分割して開く
            au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
            au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
            "ウィンドウを立てに分割して開く
            au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
            au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
            "ESCキーを二回押すと終了する
            au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
            au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
    "Shougo/neomru.vim {{{2
        " Unite.vimで最近使ったファイルを表示できるようにする
        NeoBundle 'Shougo/neomru.vim'
    "Shougo/neobundle.vim {{{2
        NeoBundleFetch 'Shougo/neobundle.vim'
    "Shougo/vimproc {{{2
        NeoBundle 'Shougo/vimproc'
    "Shougo/vimshell {{{2
        NeoBundle 'Shougo/vimshell'
            let g:neocomplete#enable_at_startup = 1
    "Shougo/neosnippet {{{2
        NeoBundle 'Shougo/neosnippet'
    "Shougo/vimfiler.vim {{{2
        NeoBundle 'Shougo/vimfiler.vim'
    "thinca/vim-quickrun {{{2
        NeoBundle 'thinca/vim-quickrun'
            let g:quickrun_config = {}
            let g:quickrun_config['markdown'] = {
                \   'outputter': 'browser'
                \ }
    "tpope/vim-commentary {{{2
        "コメント化補助"
        NeoBundle 'tpope/vim-commentary'
    "tpope/vim-surround {{{2
        "記号で囲む　を簡単にする"
        NeoBundle 'tpope/vim-surround'
    "xolox/vim-misc {{{2
        NeoBundle 'xolox/vim-misc'
    "xolox/vim-notes {{{2
        NeoBundle 'xolox/vim-notes'
    "vim-scripts/javacomplete {{{2
        NeoBundle 'vim-scripts/javacomplete'
        autocmd FileType java :setlocal omnifunc=javacomplete#Complete
        autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo
    "vim-scripts/Align" {{{2
        NeoBundle 'vim-scripts/Align'
    "vim-scripts/Vim-R-plugin" {{{2
        NeoBundle 'vim-scripts/Vim-R-plugin'
    "tyru/open-browser.vim" {{{2
        NeoBundle 'tyru/open-browser.vim'
    "kannokanno/previm" {{{2
        NeoBundle 'kannokanno/previm'
            augroup PrevimSettings
                autocmd!
                autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
            augroup END
            let g:previm_open_cmd = 'firefox'
    "VimClojure {{{2
        NeoBundle 'VimClojure'
    "scrooloose/syntastic {{{2
        NeoBundle 'scrooloose/syntastic'
    "katono/rogue.vim {{{2
        NeoBundle 'katono/rogue.vim'
    "mattn/emmet-vim {{{2
        NeoBundle 'mattn/emmet-vim'
    "altercation/vim-colors-solarized {{{2
        NeoBundle 'altercation/vim-colors-solarized'
    "bling/vim-airline {{{2
        NeoBundle 'bling/vim-airline'
            if !exists('g:airline_symbols')
                let g:airline_symbols = {}
                let g:airline_left_sep = '▶'
                let g:airline_right_sep = '◀'
                let g:airline_symbols.branch = '⎇ '
            endif
    "LeafCage/foldCC.vim {{{2
        NeoBundle 'LeafCage/foldCC.vim'
        set foldtext=FoldCCtext()
        set fillchars=fold:\ ,vert:\|
        set foldcolumn=10
        let g:foldCCtext_head = ''
        let g:foldCCtext_tail = 'printf(" %s[%4d lines Lv%-2d]%s", v:folddashes, v:foldend-v:foldstart+1, v:foldlevel, v:folddashes)'

    "fuenor/JpFormat.vim {{{2
        NeoBundle 'fuenor/JpFormat.vim'
        let ExtViewer_txt = "call system('evince %f &')"
        let EV_toFenc_txt = ''
    "kana/vim-textobj-user {{{2
        NeoBundle 'kana/vim-textobj-user'
    "vim-jp/vim-go-extra {{{2
        NeoBundle 'vim-jp/vim-go-extra'
    "sudo.vim" {{{2
        NeoBundle 'sudo.vim'
    "}}}2


call neobundle#end()

filetype plugin indent on   

if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : '
        \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
endif

" セキュリティ {{{1
    :set cryptmethod=blowfish
"}}}1

"vim: foldmethod=marker
"vim: foldlevel=0
