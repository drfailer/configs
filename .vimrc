"        _       __       _ _           
"     __| |_ __ / _| __ _(_) | ___ _ __ 
"    / _` | '__| |_ / _` | | |/ _ \ '__|
"   | (_| | |  |  _| (_| | | |  __/ |   
"    \__,_|_|  |_|  \__,_|_|_|\___|_|

"basic settings
syntax on
set number
set shiftround
set ignorecase

"tabs
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set autoindent
set backspace=indent,eol,start
set listchars=tab:\|\

"Theme
packadd! onedark.vim
packadd! dracula
syntax enable
" colorscheme dracula
colorscheme onedark

"Light line
set laststatus=2
"export TERM=xterm-256color
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }
set noshowmode

"NerdTree
map <C-n> :NERDTreeToggle<CR>

if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
