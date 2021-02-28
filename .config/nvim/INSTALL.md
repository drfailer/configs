# Create vim dir

```sh
mkdir ~/.config/nvim
touch ~/.config/nvim/init.vim
```

Or use the git folder directly.

# Requirements

- ranger
- ripgrep
- fzf
- universal-ctags
- silver-searcher
- fd-find

```sh
sudo apt install fzf
sudo apt install -o Dpkg::Options::="--force-overwrite" ripgrep
sudo apt install universal-ctags
sudo apt install silversearcher-ag
sudo apt install fd-find
```

# Install vim plug

```sh
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

# Coc

It riquire to have nodejs installed.

```sh
sudo apt install -y nodejs
npm i -g yarn
```

IMPORTANT!: dont put **coc-config.json** directly (use coc-config to create it).

Once it's done, install coc extentions:

- coc-json
- coc-tsserver
- coc-clangd
- coc-sh
- coc-python
- coc-explorer

For c, coc riquire clangd but it automatically ask for installing.
For java, may have to download the langage server on:
https://download.eclipse.org/jdtls/milestones/0.57.0/
and replace file in:
*~/.config/coc/extensions/coc-java-data/server*
