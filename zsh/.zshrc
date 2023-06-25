fpath=($ZDOTDIR/external $fpath)

source "$XDG_CONFIG_HOME/zsh/aliases"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$HOME/dotfiles/zsh/external/bd.zsh"
source "$HOME/dotfiles/zsh/scripts.sh"

unsetopt AUTO_PARAM_SLASH
setopt CASE_GLOB

autoload -U compinit; compinit

# Autocompletado de ficheros ocultos
_comp_options+=(globdots)
source $HOME/dotfiles/zsh/external/completion.zsh

autoload -Uz prompt_purification_setup; prompt_purification_setup

#
# Stack de directorios habituales
#---------------------------------------------------------------

# Push the current directory visited on to the stack.
setopt AUTO_PUSHD
# Do not store duplicate directories in the stack
setopt PUSHD_IGNORE_DUPS
# Do not print the directory stack after using
setopt PUSHD_SILENT

#
# Vi Mode
#---------------------------------------------------------------

bindkey -v export KEYTIMEOUT=1

autoload -Uz cursor_mode && cursor_mode
# Navegacion en las opciones del autocompletado
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd V edit-command-line

#
# Fuzzy Finder
#---------------------------------------------------------------

if [ $(command -v "fzf") ]; then
    source /usr/share/fzf/completion.zsh
    source /usr/share/fzf/key-bindings.zsh
fi

#
# Launch i3
#---------------------------------------------------------------

if [ "$(tty)" = "/dev/tty1" ];
then
    pgrep i3 || exec startx "$XDG_CONFIG_HOME/X11/.xinitrc"
fi
