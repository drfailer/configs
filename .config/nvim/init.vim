" Plug
source $HOME/.config/nvim/vim-plug/plugins.vim

" settings
source $HOME/.config/nvim/general/settings.vim

" mappings
source $HOME/.config/nvim/keys/mappings.vim

" themes
source $HOME/.config/nvim/themes/onedark.vim
source $HOME/.config/nvim/themes/airline.vim

" some plugins
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/keys/which-key.vim
source $HOME/.config/nvim/plug-config/floaterm.vim

" coc
source $HOME/.config/nvim/plug-config/coc.vim

" java colors (treesitter)
" source /home/drfailer/.config/nvim/general/java-colors.vim

" treesitter java
" require'nvim-treesitter.configs'.setup {
"   ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
"   highlight = {
"     enable = true,              -- false will disable the whole extension
"   },
" }
