#!/usr/bin/env bash

mkdir -p ~/.ssh
mkdir -p ~/.virtualenvs

for file in .bash_profile .vimrc .ssh/config .pypirc; do
    rm ~/$file
    ln -s ~/git/config/$file ~/$file
done

file=".github_tokens.sh"
if [ ! -f ~/$file ]; then
     cp ~/git/config/$file ~/$file
     chmod 600 ~/$file
fi

