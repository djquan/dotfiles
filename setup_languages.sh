#!/bin/bash

if [ ! -d $HOME/.asdf ];
then
  git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch v0.14.0
fi

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

bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install

