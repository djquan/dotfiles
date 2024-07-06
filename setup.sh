#!/bin/bash

for file in .*
do
  if [ "$file" = "." ] || [ "$file" = ".." ] || [ ${file: -4} = ".swp" ] || [ "$file" = ".git" ];
  then
    continue
  fi

  if [ ! -f $HOME/$file ];
  then
    echo "Symlinking $PWD/$file to $HOME/$file"
    ln -s $PWD/$file $HOME/$file
  else
    cmp --silent $PWD/$file $HOME/$file || echo "$HOME/$file exists and is different than $PWD/$file"
  fi
done

./setup_languages.sh
./sync_nvim.sh

curl -sS https://starship.rs/install.sh | sh -s -- -y
