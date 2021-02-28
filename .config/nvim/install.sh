#!/bin/sh

# use by fzf
echo "installing fzf dependancies"
apt install fzf universal-ctags silversearcher-ag fd-find
# if problem with ripgrep, charge the ppa
sudo apt install -o Dpkg::Options::="--force-overwrite" ripgrep


# used for coco it requires alse node
$err = which nodejs
if [[ $err != "/usr/bin/npm" ]]; then
  echo "ERROR: installing nodejs"
  apt install -y nodejs 
fi
echo "installing yarn"
npm i -g yarn


# for coc-java
echo "Do you want to use coc-java ? [y/n]"
read $usrInput
if [[ $usrInput == 'y' ]]; then
  mkdir /usr/local/share/lombok
  wget https://projectlombok.org/downloads/lombok.jar -O /usr/local/share/lombok/lombok.jar
fi

echo "to use coc-java, download:"
echo "https://download.eclipse.org/jdtls/milestones/0.57.0/"
echo "and change files in: ~/.config/coc/extensions/coc-java-data/server"
