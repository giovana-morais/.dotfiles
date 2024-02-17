#!/bin/sh

echo "your email for git: "
read git_config_user_email

# install essentials
sudo apt-get update
sudo apt-get install -y \
	build-essential ffmpeg git latexmk neovim tmux \
	python3-pip zathura zsh libssl-dev \
	texlive-full \

# reduce overheating
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install -y tlp tlp-rdw

# configure git
git config --global user.email $git_config_user_email

chsh -s /bin/zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "zsh" >> ~/.bashrc

# install fzf (click yes to enable fzf-tmux and shell shortcuts)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# create simlinks
ln -sf ~/.dotfiles/gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/jupyter ~/.jupyter
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/vim ~/.vim
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/nvim_init ~/.config/init.vim

## vim
# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install plugins from .vimrc using command line
vim +PlugInstall +qall

# install onehalfdark theme for gnome terminal
wget https://raw.githubusercontent.com/sonph/onehalf/master/gnome-terminal/onehalfdark.sh

# ruby, jekyll and etc
# echo '# install Ruby Gems to ~/gems' >> ~/.zshrc
# echo 'export GEM_HOME="$HOME/gems"' >> ~/.zshrc
# echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.zshrc
# source ~/.zshrc

# sudo gem install jekyll bundler

# git configs
git config --global init.defaultBranch main
