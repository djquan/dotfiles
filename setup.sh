#!/bin/bash

if [ -f $HOME/.bashrc ];
then
  mv $HOME/.bashrc $HOME/.bashrc-old
fi

if [ ! -d $HOME/.asdf ];
then
  git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.5.0
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

source $HOME/.bashrc

for plugin in ruby elixir clojure elm kotlin nodejs racket golang java erlang
do
  asdf plugin-add $plugin || true
done

if ! type rustup > /dev/null 2>&1;
then
  curl https://sh.rustup.rs -sSf | \
    sh -s -- --default-toolchain stable -y
fi

asdf plugin-update --all

if ! gpg -k 94AE36675C464D64BAFA68DD7434390BDBE9B9C5 > /dev/null 2>&1;
then
  bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
fi

asdf install
