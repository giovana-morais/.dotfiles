#!/bin/sh

sudo apt update

function install {
	which $1 &> /dev/null

	if [ $? -ne 0 ]; then
		echo "installing ${1}"
		sudo apt install -y $1
	else
		echo "$1 already installed"
	fi
}

install build-essential
install cowsay
install ffmpeg
install latexmk
install nvim
install python3-pip
install ruby-full
install tmux
install zathura
install zsh

# reduce overheating
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw

chsh -s /bin/zsh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

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

# python, virtualenv and lots of libs
cd ~
pip install virtualenv
virtualenv venv
source venv/bin/activate
pip install numpy
pip install matplotlib
pip install scipy
pip install librosa
pip install essentia
deactivate

# ruby, jekyll and etc
echo '# install Ruby Gems to ~/gems' >> ~/.zshrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.zshrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc

sudo gem install jekyll bundler

cowsay -s i guess we are done!
