fpath=($ZDOTDIR/external $fpath)

source "$XDG_CONFIG_HOME/zsh/aliases"

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
