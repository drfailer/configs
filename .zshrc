PATH="$HOME/.cargo/bin${PATH:+:${PATH}}"

# Path to your oh-my-zsh installation.
export ZSH="/home/drfailer/.oh-my-zsh"

# Uncomment the following line to enable command auto-correction.
 ENABLE_CORRECTION="true"

# Plugins :
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

#################################################################################
#                                 vi mode                                       #
#################################################################################
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

#################################################################################
#                                 Alias :                                       #
#################################################################################
# generals:
alias la='ls -A'
alias ll='exa -al --color=always --group-directories-first'
alias pdf='pandoc -V geometry:margin=1in -o'
alias processing='/home/drfailer/Programming/processing-3.5.4/processing'

# book marks:
alias gc='cd ~/Desktop/cours/cours_s4/'
alias gC='cd ~/.config/'

# configs:
alias vs='nvim ~/.zshrc'
alias vc='nvim ~/.config/nvim/general/settings.vim'

# Scripts:
alias dotf='bash $HOME/.scripts/dotf.sh'
alias cleaner='bash $HOME/.scripts/cleaner.sh'
alias updater='bash $HOME/.scripts/updater.sh'

# Alias for c compilation:
alias ccomp='gcc -Wall -Wextra -o'
# sdl flags
alias SDLA='`sdl-config --cflags --libs`'
# java compilation:
alias jcomp='javac *.java'
alias jcompsb='javac -d build src/**/*.java'
alias jcompclass='javac -Xlint:all'

# For bare repo :
# be sure tu run : config config --local status.showUntrackedFiles no
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'


#################################################################################
#                             customize pfetch:                                 #
#################################################################################
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
 

#################################################################################
#                      Use bat for manual printing:                             #
#################################################################################
alias bat='batcat'
export MANPAGER="sh -c 'col -bx | batcat -l man -p'"
export BAT_THEME="OneHalfDark"


# Starship prompt:
eval "$(starship init zsh)"


# Startup :
pfetch
