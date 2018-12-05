"mozicode
scriptencoding utf-8
set encoding=utf-8


"vimはPOSIX互換シェルのみ
if $SHELL =~ '/fish$'
	set shell=bash
endif
"syntax
syntax on


filetype plugin indent on
syntax enable

"vim衝突 
"行番号の表示
set number
"カーソル行の強調
set cursorline
"右下に表示される行・列の番号を表示する
set ruler
" markdownのハイライトを有効にする
set syntax=markdown
" ステータスライン
set laststatus=2

"color
set t_Co=256

" truecolor
set termguicolors
" 背景色

"操作系"
" 入力モード中に素早くQQと入力した場合はESCとみなす
inoremap jj <Esc>
inoremap <c-]> <Esc>
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
" tabをスペース2個分に
set tabstop=2
"ctrl+jkhlで上下左右
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"tabショートカット
nnoremap st :<C-u>tabnew<CR>
nnoremap sl gt
nnoremap sh gT
" vimが自動で生成するtab幅をスペース2個に
set shiftwidth=2
"" TABキーを押した際にタブ文字の代わりにスペースを入れる
set expandtab

"ポップアップバーの色
hi Pmenu ctermbg=6
hi PmenuSel ctermbg=4
hi PmenuSbar ctermbg=2
hi PmenuThumb ctermfg=3

"GoImports
let g:go_fmt_command = "goimports"

"err syntax
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

"自動tree
"autocmd VimEnter * execute 'NERDTree'
"
"ヤンク＝＞ctrl+v
set clipboard+=unnamed

"backspace 
set backspace=indent,eol,start

"tab表示
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
highlight specialKey ctermfg=darkgray

" dein setup
if &compatible
	set nocompatible 
endif
let deinroot = "~/.config/dein"
let $DEIN_PATH= deinroot . "/.cache/repos/github.com/Shougo/dein.vim"
let s:toml = "~/.config/nvim/dein.toml"

" Required:
set runtimepath+=$DEIN_PATH

if dein#load_state(deinroot)
	call dein#begin(deinroot)
	call dein#add($DEIN_PATH)
  call dein#load_toml(s:toml,{'lazy': 0})

	call dein#end()
	call dein#save_state()
endif

" 未インストールを確認
if dein#check_install()
	call dein#install()
endif

