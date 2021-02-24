"=================================================================================
" C snippets:
"=================================================================================
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
