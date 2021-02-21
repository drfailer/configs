PATH="$HOME/.cargo/bin${PATH:+:${PATH}}"

# Path to your oh-my-zsh installation.
export ZSH="/home/drfailer/.oh-my-zsh"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Plugins :
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Alias :
alias lll='exa -al --color=always --group-directories-first'
alias joke='fortune | cowsay | lolcat'
alias pdf='pandoc -V geometry:margin=1in -o'
alias processing='/home/drfailer/Programming/processing-3.5.4/processing'

alias vs='vim ~/.zshrc'
alias vc='vim ~/.vimrc'

# Alias for compilation:
alias ccomp='gcc -Wall -Wextra -o'

# sdl flags
alias SDLA='`sdl-config --cflags --libs`'

alias jcomp='javac *.java'
alias jcompsb='javac -d /buid /src/**/*.java'
alias jcomp-class='javac -Xlint:all'

# Starship prompt:
eval "$(starship init zsh)"

# For bare repo :
# be sure tu run : config config --local status.showUntrackedFiles no
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# customize pfetch:
export PF_INFO="ascii title os host kernel uptime pkgs memory"
export PF_SEP=":"
export PF_COLOR=1
export PF_COL1=4
export PF_COL2=3
export PF_COL3=5
export PF_ALIGN="10"
export PF_ASCII="linux"
export USER="drfailer"
export HOSTNAME="drfailer-computer"
export EDITOR="emacs"
export SHELL="zsh"
export XDG_CURRENT_DESKTOP="xmonad"


# Startup :
pfetch
