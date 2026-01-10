#!/usr/bin/bash

apt_options="$@"

function get {
    echo ">>>>> INSTALLING: $@"
    sudo apt-get -y $apt_options install $@
}

sudo apt-get update
get keychain
get git
get hub
get tig
get fzf
get wget
get curl
get neovim
get bat
get silversearch-ag
# Python stuff
get python3-pip
# Ocaml stuff
get opam
opam -y install merlin
# Rust stuff
get rustup
rustup default stable
