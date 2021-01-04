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

alias vb='vim ~.zshrc'
alias vc='vim ~/.vimrc'

eval "$(starship init zsh)"

# For bare repo :
# be sure tu run : config config --local status.showUntrackedFiles no
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

# Startup :
pfetch
