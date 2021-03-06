#!/bin/bash
set -e

# commands to setup a fresh system (needs sudo)

#  if ! which xcodebuild; then
#      echo "install xcode tools first, then rerun this script"
#      xcode-select --install
#      exit 1
#  fi
#  xcodebuild -license accept

# homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install wget
brew install telnet
brew cask install docker
brew install hub
brew install node
brew install nvm
brew install yarn
brew install postgres
brew install go
brew install python
mkdir -p ~/go/bin ~/go/pkg ~/go/src
brew install rbenv
brew install --HEAD universal-ctags/universal-ctags/universal-ctags
brew install moreutils
brew install ag
brew install jq
brew install fzf
brew install rlwrap
brew install up
brew install bat
brew install grpcurl
brew install cmake
brew install kitty
brew install pidof
brew install pstree
brew install bazelisk
pip3 install localstack
pip3 install awscli-local


# powerline fonts
mkdir ~/git
git clone https://github.com/powerline/fonts.git ~/git/fonts
~/git/fonts/install.sh

# zsh
brew install zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "~/.zprezto"
dir=$(git rev-parse --show-toplevel)
ln -s $dir/macos/.localrc ~/.localrc
ln -s $dir/.zshrc ~/.zshrc
ln -s $dir/.aliases ~/.aliases
ln -s $dir/.inputrc ~/.inputrc
ln -s $dir/.minimal ~/.minimal
chsh -s $(which zsh)

# alacritty
#git clone https://github.com/jwilm/alacritty.git ~/git/alacritty
#curl https://sh.rustup.rs -sSf | sh
#source $HOME/.cargo/env
#rustup override set stable
#rustup update stable
#(
#    cd alacritty;
#    make app;
#    cp -r target/release/osx/Alacritty.app /Applications/
#)

# tmux
brew install tmux
brew install reattach-to-user-namespace
(
    cd
    git clone https://github.com/gpakosz/.tmux.git
    ln -s -f .tmux/.tmux.conf
    ln -s -f git/config/.tmux.conf.local
)

# neovim
brew install neovim
mkdir -p ~/.config/nvim
ln -s $dir/.vimrc ~/.vimrc
ln -s $dir/.vimrc ~/.config/nvim/vim.init
# vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

#  # vim
#  ln -s $dir/.vimrc ~/.vimrc
#  brew install macvim --env-std --with-override-system-vim
#  mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/backups
#  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
#  git clone https://github.com/tpope/vim-sensible.git ~/.vim/bundle/vim-sensible
#  git clone https://tpope.io/vim/unimpaired.git ~/.vim/bundle/unimpaired
#  git clone https://github.com/tpope/vim-fugitive.git ~/vim/bundle/vim-fugitive
#  git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin
#  git clone https://github.com/ctrlpvim/ctrlp.vim.git  ~/.vim/bundle/ctrlp.vim
#  git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
#  git clone https://github.com/vim-airline/vim-airline-themes ~/.vim/bundle/vim-airline-themes
#  git clone https://github.com/mbbill/undotree.git ~/.vim/bundle/undotree
#  git clone https://github.com/airblade/vim-gitgutter.git ~/.vim/bundle/vim-gitgutter
#  git clone https://github.com/miyakogi/conoline.vim.git ~/.vim/bundle/conoline
#  git clone https://github.com/kshenoy/vim-signature.git  ~/.vim/bundle/vim-signature
#  git clone https://github.com/fatih/vim-go.git ~/.vim/bundle/vim-go
#  git clone https://github.com/dense-analysis/ale.git ~/.vim/bundle/ale
#  git clone https://github.com/tacahiroy/ctrlp-funky.git ~/.vim/bundle/ctrlp-funky
#  git clone https://github.com/AndrewRadev/splitjoin.vim ~/.vim/bundle/splitjoin
#  vim +GoInstallBinaries

