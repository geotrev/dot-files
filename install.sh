#!/bin/bash

# move custom Soliah theme 
OMZ_DIR="${HOME}/.oh-my-zsh"
mv -f Soliah.zsh-theme $OMZ_DIR/themes/Soliah.zsh-theme

# Move zshrc to codespaces home
cat .zshrc > $HOME/.zshrc

zsh
