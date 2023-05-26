#!/bin/bash

function install_fira() {
  echo "Installing Fira Code..."

  fonts_dir="${HOME}/.local/share/fonts"
  if [ ! -d "${fonts_dir}" ]; then
      echo "mkdir -p $fonts_dir"
      mkdir -p "${fonts_dir}"
  else
      echo "Found fonts dir $fonts_dir"
  fi

  version=5.2
  zip=Fira_Code_v${version}.zip
  curl --fail --location --show-error https://github.com/tonsky/FiraCode/releases/download/${version}/${zip} --output ${zip}
  unzip -o -q -d ${fonts_dir} ${zip}
  rm ${zip}

  echo "fc-cache -f"
  fc-cache -f

  echo "Fira Code install"
}

function install_theme() {
  echo "Installing Soliah theme..."
  omz_dir="${HOME}/.oh-my-zsh"

  if [ ! -d "${omz_dir}" ]; then
    mv -f .soliah.zsh-theme $omz_dir/themes/Soliah.zsh-theme
    echo "Soliah theme created"
  else
    echo "OMZ directory doesn't exist, skipping"
  fi
}

function install_zshrc() {
  echo "Installing autosuggestions..."                
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  echo "Autosuggestions installed"

  echo "Moving zshrc to root dir..."
  cat .zshrc > $HOME/.zshrc
  echo "zshrc moved"
}

install_fira
install_theme
install_zshrc
