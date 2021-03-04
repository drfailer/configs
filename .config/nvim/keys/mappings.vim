" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Ib hate escape more than anything else
" inoremap jk <Esc>
inoremap kj <Esc>
inoremap kl <Esc>la

" Easy CAPS
inoremap <c-u> <ESC>viwUea

" navigate threw buffers
nnoremap <Leader>nb :bnext<CR>
nnoremap <Leader>bp :bprevious<CR>
" navigate threw tabs
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>nt :tabnext<CR>
nnoremap <Leader>tp :tabprevious<CR>

" Use control-c instead of escape
nnoremap <C-c> <Esc>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" jump points:
inoremap ,<tab> <Esc>/<++><Enter>"_c4l

" Map replace all :
nnoremap S :%s//g<Left><Left>
vnoremap S :s//g<Left><Left>
