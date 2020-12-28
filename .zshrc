PATH="$HOME/.cargo/bin${PATH:+:${PATH}}"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

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

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Alias :
alias lll='exa -al --color=always --group-directories-first'
alias joke='fortune | cowsay | lolcat'
alias pdf='pandoc -V geometry:margin=1in -o $1.pdf $1.md'

alias vc='vim ~/.vimrc'

eval "$(starship init zsh)"

# xrandr --output HDMI-0 --primary --left-of DVI-D-0 --output DVI-D-0 --auto
pfetch


# For bear repo :
# be sure tu run : config config --local status.showUntrackedFiles no
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
