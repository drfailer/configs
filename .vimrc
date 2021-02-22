"        _       __       _ _           
"     __| |_ __ / _| __ _(_) | ___ _ __ 
"    / _` | '__| |_ / _` | | |/ _ \ '__|
"   | (_| | |  |  _| (_| | | |  __/ |   
"    \__,_|_|  |_|  \__,_|_|_|\___|_|

" mapleader:
let mapleader =" "

"basic settings
syntax on
set number relativenumber
set shiftround
set ignorecase
set t_Co=256

" Autocompletion file:
set wildmode=longest,list,full
set wildmenu

" Split fix :
set splitbelow splitright

" Split navigation :
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Spell checking :
map <F6> :setlocal spell! spelllang=en_us<CR>
" map <F7> :set spelllang=fr<CR> need fix

" Map replace all :
map S :%s//g<Left><Left>

"tabs
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set smartindent
set autoindent
set backspace=indent,eol,start
set listchars=tab:\|\
set nobackup
set noswapfile

setglobal termencoding=utf-8 fileencodings=
scriptencoding utf-8
set encoding=utf-8

" Tabbing:
map <leader>t :tabnew<CR>
map <leader><tab> :tabnext<CR>

" Finding file
set path+=**

" AUTOCOMPLITION:
" - ^x^n for just this file
" - ^x^f for file name
" - ^n for just complete
" - ^n and ^p to select

" jump points:
inoremap <tab><tab> <Esc>/<++><Enter>"_c4l

"=================================================================================
" Snippets:
"=================================================================================
" C:
" Loops:
autocmd Filetype c inoremap ,if<tab> if<Space>()<Space>{<CR><++><CR>}<++><Esc>kk0f)i
autocmd Filetype c inoremap ,while<tab> while<Space>()<Space>{<CR><++><CR>}<++><Esc>kk0f)i
autocmd Filetype c inoremap ,for<tab> for<Space>(;<Space><++>;<Space><++>)<Space>{<CR><++><CR>}<++><Esc>kk0f;i
" main:
autocmd Filetype c inoremap ,main<tab> int<Space>main<Space>(int<Space>argc,<Space>char**<Space>argv)<Space>{<Enter>I<Enter>return<Space>0;<Enter>}<Esc>?I<Enter>C
" Libs:
autocmd Filetype c inoremap ,io<tab> #include<Space><stdio.h><Enter>
autocmd Filetype c inoremap ,std<tab> #include<Space><stdlib.h><Enter>
autocmd Filetype c inoremap ,str<tab> #include<Space><string.h><Enter>
autocmd Filetype c inoremap ,icl<tab> #include<Space><><Enter><++><Esc>k0/<<Enter>a
autocmd Filetype c inoremap ,ics<tab> #include<Space>""<Enter><++><Esc>k0/"<Enter>a
" Structures and unions:
autocmd Filetype c inoremap ,struct<tab> struct<Space>{<CR><++><CR>};<Esc>kk0f{i
autocmd Filetype c inoremap ,uni<tab> union<Space>{<CR><++><CR>};<Esc>kk0f{i
" printf and scanf:
autocmd Filetype c inoremap ,pf<tab> printf("\n"<++>);<++><Esc>0f\i
autocmd Filetype c inoremap ,sf<tab> scanf("",<Space><++>);<++><Esc>0f"li
" Curly brackets:
autocmd Filetype c inoremap {{ {<CR>!<CR>}<Esc>kf!C
" stdlib function :
autocmd Filetype c inoremap ,x<tab> exit(0);


  highlight LineNr           ctermfg=8    ctermbg=none    cterm=none
  highlight CursorLineNr     ctermfg=7    ctermbg=8       cterm=none
  highlight VertSplit        ctermfg=0    ctermbg=8       cterm=none
  highlight Statement        ctermfg=2    ctermbg=none    cterm=none
  highlight Directory        ctermfg=4    ctermbg=none    cterm=none
  highlight StatusLine       ctermfg=7    ctermbg=8       cterm=none
  highlight StatusLineNC     ctermfg=7    ctermbg=8       cterm=none
  highlight NERDTreeClosable ctermfg=2
  highlight NERDTreeOpenable ctermfg=8
  highlight Comment          ctermfg=4    ctermbg=none    cterm=none
  highlight Constant         ctermfg=12   ctermbg=none    cterm=none
  highlight Special          ctermfg=4    ctermbg=none    cterm=none
  highlight Identifier       ctermfg=6    ctermbg=none    cterm=none
  highlight PreProc          ctermfg=5    ctermbg=none    cterm=none
  highlight String           ctermfg=12   ctermbg=none    cterm=none
  highlight Number           ctermfg=1    ctermbg=none    cterm=none
  highlight Function         ctermfg=1    ctermbg=none    cterm=none

