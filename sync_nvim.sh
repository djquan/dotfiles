#!/bin/bash

rm -rf ~/.config/nvim || true
mkdir -p ~/.config/nvim/
mkdir -p ~/.config/nvim/plugin
mkdir -p ~/.config/nvim/after/plugin
mkdir -p ~/.config/nvim/lua/plugin

for file in $(find nvim -name "*.vim" -or -name "*.lua")
do
  if [ ! -f $HOME/.config/$file ];
  then
    echo "Symlinking $PWD/$file to $HOME/$file"
    ln -s $PWD/$file $HOME/.config/$file
  else
    cmp --silent $PWD/$file $HOME/.config/$file || echo "$HOME/.config/$file exists and is different than $PWD/$file"
  fi
done
