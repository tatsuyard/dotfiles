set encoding=utf-8
set number " 行数表示
set expandtab " タブ文字をスペースに変換する
set tabstop=2
set hlsearch " ハイライトサーチを有効にする
set ignorecase " 大文字小文字を区別しない
set incsearch " インクリメンタルサーチ
set smartcase " 大文字小文字を区別して検索
set laststatus=2 " 常にstatus lineを表示する
set autoindent " 行追加時、カレント行のインデントをキープする
set showcmd " 右下に入力中のコマンドを表示する
set wildmenu " コマンドライン補完が拡張モードになる
set list " 不可視文字を可視化する
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
" Visual選択で選択されたテキストが、自動的にクリップボードレジスタ "*" にコピーされる。
set guioptions+=a
set autoread " vim外部で変更があった時に自動的に再読み込み

" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索する
set wrapscan
set title " タイトル表示
set ttyfast " 高速ターミナル接続
set nowrap " 長い行を折り返さない
" clipboard
set clipboard+=unnamed

" モードによるカーソルの変更 {{{
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif
" }}}

" previm
autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
" NERDTREEを起動する
autocmd VimEnter * execute 'NERDTree'
" 隠しファイルを表示する
let NERDTreeShowHidden=1

" vim-javascript
let g:javascript_plugin_jsdoc = 1

" 検索highlightを消す
nnoremap <ESC><ESC> :nohl<CR>

"インサートモードでも移動
inoremap <c-d> <delete>
inoremap <c-j> <down>
inoremap <c-k> <up>
inoremap <c-h> <left>
inoremap <c-l> <right>
inoremap <c-d> <Del>

" 行頭移動
noremap <S-h> ^
" 行末移動
noremap <S-l> $

noremap Q q

" v2回で行末まで選択
vnoremap v $h
" dein vim {{{
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &compatible
  set nocompatible
endif

" dein installation check
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " .toml file
  let s:rc_dir = expand('~/.vim')
  if !isdirectory(s:rc_dir)
    call mkdir(s:rc_dir, 'p')
  endif
  let s:toml = s:rc_dir . '/dein.toml'

   " read toml and cache
  call dein#load_toml(s:toml, {'lazy': 0})

  call dein#end()
  call dein#save_state()
endif


" plugin installation check
if dein#check_install()
  call dein#install()
endif

" plugin remove check
let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif
" }}}

filetype plugin indent on
let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme solarized

" git gutter {{{
set updatetime=100
let g:gitgutter_highlight_lines = 1
let g:gitgutter_set_sign_backgrounds = 1
let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=black
" }}}
" indent line {{{
let g:indentLine_setColors = 1
highlight LineNr ctermbg=black
let g:indentLine_char ='¦'
" }}}
"
