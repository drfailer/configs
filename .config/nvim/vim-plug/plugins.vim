"        _                       _             
" __   _(_)_ __ ___        _ __ | |_   _  __ _ 
" \ \ / / | '_ ` _ \ _____| '_ \| | | | |/ _` |
"  \ V /| | | | | | |_____| |_) | | |_| | (_| |
"   \_/ |_|_| |_| |_|     | .__/|_|\__,_|\__, |
"                         |_|            |___/

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    " Theme
    Plug 'joshdick/onedark.vim'
    " aireline
    Plug 'itchyny/lightline.vim'
    " ranger
    Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}    
    " fzf
    " require to install fzf, ripgrep, universal-ctags, silversearcher-ag and
    " fd-find
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'airblade/vim-rooter'
    " start menu
    Plug 'mhinz/vim-startify'
    " which key
    Plug 'liuchengxu/vim-which-key'
    " floating terminal
    Plug 'voldikss/vim-floaterm'
    " goyo
    Plug 'junegunn/goyo.vim'
    " Trigger autocompletion
    Plug 'vim-scripts/AutoComplPop'
    " snippets
    Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
    " coc
    " require npm i -g yarn
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Better java highlight
    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " pretty icons
    Plug 'ryanoasis/vim-devicons'

call plug#end()
