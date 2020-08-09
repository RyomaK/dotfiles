
"Plugin Installing
call plug#begin()

Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'Shougo/deoplete.nvim'
Plug 'lighttiger2505/deoplete-vim-lsp'
Plug 'preservim/nerdtree'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

call plug#end()

if empty(globpath(&rtp, 'autoload/lsp.vim'))
  finish
endif


" =========================
" vim-lsp setting
" =========================
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1


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

if has('gui_running')
    set t_Co=16
    let g:solarized_termcolors=16
else
    let g:solarized_termtrans=1
endif
set background=dark
colorscheme solarized

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

" In visual mode, tab means insert <tab> into highlighted block.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" always escape / and ? in search character.
cnoremap <expr> /
            \ getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ?
            \ getcmdtype() == '?' ? '\?' : '?'

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


