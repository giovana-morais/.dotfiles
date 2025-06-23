#!/bin/sh

echo "your email for git: "
read git_config_user_email

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

# ruby, jekyll and etc
# echo '# install Ruby Gems to ~/gems' >> ~/.zshrc
# echo 'export GEM_HOME="$HOME/gems"' >> ~/.zshrc
# echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.zshrc
# source ~/.zshrc

# sudo gem install jekyll bundler

# git configs
git config --global init.defaultBranch main
