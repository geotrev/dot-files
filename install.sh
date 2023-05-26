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

install_fira

# move custom Soliah theme 
echo "Installing Soliah theme..."
OMZ_DIR="${HOME}/.oh-my-zsh"
mv -f Soliah.zsh-theme $OMZ_DIR/themes/Soliah.zsh-theme
echo "Soliah theme created"

echo "Moving zshrc to root dir..."
# Move zshrc to codespaces home
cat .zshrc > $HOME/.zshrc
echo "zshrc moved"
