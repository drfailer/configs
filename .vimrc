"        _       __       _ _           
"     __| |_ __ / _| __ _(_) | ___ _ __ 
"    / _` | '__| |_ / _` | | |/ _ \ '__|
"   | (_| | |  |  _| (_| | | |  __/ |   
"    \__,_|_|  |_|  \__,_|_|_|\___|_|

"basic settings
syntax on
set number relativenumber
set shiftround
set ignorecase
set encoding=utf-8

" Autocompletion :
set wildmode=longest,list,full

" Split fix :
set splitbelow splitright

" Split navigation :
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Map replace all :
map S :%s//g<Left><Left>

"tabs
set tabstop=4
set expandtab
set shiftwidth=4
set smartindent
set autoindent
set backspace=indent,eol,start
set listchars=tab:\|\

"NerdTree
map <C-n> :NERDTreeToggle<CR>


" Snippets :
