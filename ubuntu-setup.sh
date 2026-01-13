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
get bat
get silversearch-ag
# Python stuff
get python3-pip
get pipx
# nvim stuff
get neovim
pipx install pynvim # Ensure pynvim is up to date
# Ocaml stuff
# Grab the latest opam, apt version is old
bash -c "sh <(curl -fsSL https://opam.ocaml.org/install.sh)"
opam -y install merlin
# Rust stuff
get rustup
rustup default stable
