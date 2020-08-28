
let g:no_vimrc_example=1

let g:loaded_gzip               = 1
let g:loaded_tar                = 1
let g:loaded_tarPlugin          = 1
let g:loaded_zip                = 1
let g:loaded_zipPlugin          = 1
let g:loaded_rrhelper           = 1
let g:loaded_vimball            = 1
let g:loaded_vimballPlugin      = 1
let g:loaded_getscript          = 1
let g:loaded_getscriptPlugin    = 1
let g:loaded_netrw              = 1
let g:loaded_netrwPlugin        = 1
let g:loaded_netrwSettings      = 1
let g:loaded_netrwFileHandlers  = 1
let g:did_install_default_menus = 1
let g:skip_loading_mswin        = 1
let g:deoplete#enable_at_startup = 1


" git commit 時にはプラグインは読み込まない
if $HOME != $USERPROFILE && $GIT_EXEC_PATH != ''
  finish
end

let deinroot = "~/.cache/dein"
let $DEIN_PATH= deinroot . "/repos/github.com/Shougo/dein.vim"
let s:toml = "~/.config/nvim/dein.toml"
let s:lazy_toml = "~/.config/nvim/dein_lazy.toml"

" Required:
set runtimepath+=$DEIN_PATH
" Required:
if dein#load_state(deinroot)
  call dein#begin(deinroot)
  call dein#add($DEIN_PATH)
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
   call dein#install()
endif

" Required:
  filetype plugin indent on
  syntax enable

