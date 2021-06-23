#!/bin/sh

sudo apt install vim zsh tmux python3-pip ruby-full build-essential zlib1g-dev \
ffmpeg -y

chsh -s /bin/zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# install fzf (click yes to enable fzf-tmux and shell shortcuts)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

## vim
# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins from .vimrc using command line
vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"

# create simlinks
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/jupyter ~/.jupyter
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/zshrc ~/.zshrc

# python, virtualenv and lots of libs
pip install virtualenv
cd ~
virtualenv venv
source venv/bin/activate
pip install numpy matplotlib scipy librosa essentia
deactivate


# ruby, jekyll and etc
echo '# Install Ruby Gems to ~/gems' >> ~/.zshrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.zshrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

sudo gem install jekyll bundler
