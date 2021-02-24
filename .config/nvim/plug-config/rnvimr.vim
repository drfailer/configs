" Make Ranger replace netrw and be the file explorer
let g:rnvimr_ex_enable = 1
let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}
let g:rnvimr_enable_bw = 1

nmap <space>r :RnvimrToggle<CR>

" Map Rnvimr action
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
