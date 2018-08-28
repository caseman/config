#!/bin/bash

# commands to setup a fresh system (needs sudo)

if ! which xcodebuild; then
    echo "install xcode tools first, then rerun this script"
    xcode-select --install
    exit 1
fi
xcodebuild -license accept

# homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install wget
brew cask install docker
brew install hub
brew install node
brew install nvm
brew install yarn
brew install postgres
brew install go
mkdir -p ~/go/bin ~/go/pkg ~/go/src
brew install dep
brew install moreutils
brew install ag

# powerline fonts
mkdir ~/git
git clone https://github.com/powerline/fonts.git ~/git/fonts
~/git/fonts/install.sh

# zsh
brew install zsh
ln -s ./.localrc ~/.localrc
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

mkdir ~/git
git clone https://github.com/powerline/fonts.git ~/git/fonts
git/fonts/install.sh

# vim
brew install macvim --env-std --with-override-system-vim
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/backups
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone https://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible
git clone https://tpope.io/vim/unimpaired.git ~/.vim/bundle/unimpaired
git clone https://github.com/tpope/vim-fugitive.git ~/vim/bundle/vim-fugitive
git clone --depth=1 https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic
git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
git clone https://github.com/ctrlpvim/ctrlp.vim.git  ~/.vim/bundle/ctrlp.vim
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
git clone https://github.com/mbbill/undotree.git ~/.vim/bundle/undotree
git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter
