#!/bin/bash
#

##
# NeoVim
##-----------------------------------------------
# directorios NeoVim
mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"

ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim/init.vim"

# install neovim plugin manager
[ ! -f "$DOTFILES/nvim/autoload/plug.vim" ] \
    && curl -fLo "$DOTFILES/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p "$XDG_CONFIG_HOME/nvim/autoload"
ln -sf "$DOTFILES/nvim/autoload/plug.vim" "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"

# Install (or update) all the plugins
nvim --noplugin +PlugUpdate +qa

#
# X11
##-----------------------------------------------
#rm -rf "$XDG_CONFIG_HOME/X11"
#ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME/X11"
rm -rf "$XDG_CONFIG_HOME/X11"
ln -s "$DOTFILES/X11" "$XDG_CONFIG_HOME"

# i3
##-----------------------------------------------
rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME/i3"

# resolucion de pantalla
##-----------------------------------------------
ln -sf "$DOTFILES/screenlayout" "$HOME/.screenlayout"

#
# ZSH
##-----------------------------------------------

mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"
rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"

#
# Fonts
##-----------------------------------------------

mkdir -p "$XDG_DATA_HOME"
cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

#
# Notifications: dunst
##-----------------------------------------------

mkdir -p "$XDG_DATA_HOME/dunst"
cp -rf "$DOTFILES/dunst/dunstrc" "$XDG_DATA_HOME/dunst/dunstrc"

# UI style GTK3
##-----------------------------------------------
rm -rf "$XDG_CONFIG_HOME/gtk-3.0"
ln -s "$DOTFILES/gtk-3.0" "$XDG_CONFIG_HOME/gtk-3.0"

# Git
##-----------------------------------------------
rm -rf "$XDG_CONFIG_HOME/git"
ln -s "$DOTFILES/git" "$XDG_CONFIG_HOME/git"
