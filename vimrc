"==========================
"init
"==========================
set modelines=5

let mapleader = ","

set tabstop=4
set expandtab
set softtabstop=0
set shiftwidth=4
set smarttab
set number
set title
set scrolloff=5
set ambiwidth=double

"==========================
"display
"==========================

set t_Co=256

"color schema
syntax enable
set background=dark
colorscheme iceberg

" vimrc :h xterm-true-color
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

if v:version >= 700
    set cursorline
endif

set cmdheight=2

" highlight each language in markdown
" http://mattn.kaoriya.net/software/vim/20140523124903.htm
let g:markdown_fenced_languages = [
\  'css',
\  'go',
\  'javascript',
\  'js=javascript',
\  'json=javascript',
\  'ruby',
\  'sass',
\  'xml',
\  'erlang',
\  'sql',
\  'perl',
\  'php',
\]

" クリップボードからペーストのときインデントしない
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"
  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
" escape遅いの回避
set ttimeoutlen=10 

"==========================
"Searching and Moving
"==========================
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
set wrapscan
" display tab space 
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%


" In visual mode, tab means insert <tab> into highlighted block.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" always escape / and ? in search character.
cnoremap <expr> /
            \ getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?
            \ getcmdtype() == '?' ? '\?' : '?'

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" backspace
set nocompatible
set whichwrap=b,s,h,l,<,>,[,]
set backspace=indent,eol,start
"==========================
"language
"==========================
set encoding=utf-8
source $HOME/.vim/encode.vim

set fileformats=unix,dos,mac


"==========================
"clipboard
"==========================
set clipboard+=autoselect


"==========================
"Backup
"==========================
set autowrite
set hidden
set backup
set backupdir=$HOME/.vimback
set directory=$HOME/.vimtmp
set history=10000
set updatetime=500

"==========================
"Status Line
"==========================
set showcmd "ステータスラインにコマンドを表示
set laststatus=2 "ステータスラインを常に表示

"==========================
"Window
"==========================
set splitright "Window Split時に新Windowを右に表示
set splitbelow "Window Split時に新windowを下に表示

"==========================
"short cut
"==========================
"Split window
nmap ss :split<Return><C-w>w
nmap vs :vsplit<Return><C-w>w

" Move window
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l

" Switch tab
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

"==========================
"load setting vimrc
"==========================

runtime! _config/*.vim
