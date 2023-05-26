#!/bin/bash

create_symlinks() {
    # Get the directory in which this script lives.
    script_dir=$(dirname "$(readlink -f "$0")")

    # Get a list of all files in this directory that start with a dot.
    files=$(find -maxdepth 1 -type f -name ".*")

    # Create a symbolic link to each file in the home directory.
    for file in $files; do
        name=$(basename $file)
        echo "Creating symlink to $name in home directory."
        rm -rf ~/$name
        ln -s $script_dir/$name ~/$name
    done
}

create_symlinks

# Install Fira Code

dl_and_install_fira() {
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
}

# Use Soliah Zsh Theme

ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
mv -f Soliah.zsh-theme $ZSH_CUSTOM/themes/Soliah.zsh-theme

create_symlinks
dl_and_install_fira
zsh
