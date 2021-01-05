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
set encoding=utf-8
set t_Co=16

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
set expandtab
set shiftwidth=4
set smartindent
set autoindent
set backspace=indent,eol,start
set listchars=tab:\|\

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
