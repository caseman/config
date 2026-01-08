#!/usr/bin/bash

apt_options="$@"

function get {
    echo ">>>>> INSTALLING: $@"
    sudo apt-get -y $apt_options install $@
}

sudo apt-get update
get git
get hub
get tig
get fzf
get wget
get neovim
get bat
# Python stuff
get python3-pip
# Ocaml stuff
get opam
opam -y install merlin

