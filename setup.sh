#!/bin/bash

if [ ! -d ~/.asdf ];
then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.5.0
fi

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

for plugin in ruby elixir clojure elm kotlin nodejs ruby racket golang java
do
  asdf plugin-add $plugin || true
done

asdf plugin-update --all
asdf install
