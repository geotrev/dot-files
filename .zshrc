# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Theme
ZSH_THEME="Soliah"

# Plugins
plugins=(git zsh-nvm zsh-autosuggestions)

# Init OMZ
source $ZSH/oh-my-zsh.sh

# Aliases

alias amcm="git commit --amend --no-edit"
alias fopu="git push -f origin"
alias gpo="git push -u origin HEAD"
alias so="source ~/.zshrc"
