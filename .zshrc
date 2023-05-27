export ZSH="${HOME}/.oh-my-zsh"

# Theme
ZSH_THEME="spaceship"
export SPACESHIP_DIR_TRUNC=0

# Plugins
plugins=(git)

# Aliases
alias amcm="git commit --amend --no-edit"
alias fopu="git push -f origin"
alias gpo="git push -u origin HEAD"
alias so="source ~/.zshrc"

# OMZ
source $ZSH/oh-my-zsh.sh

# Set colors for LS_COLORS
eval `dircolors ~/.dircolors`
