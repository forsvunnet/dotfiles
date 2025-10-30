# Root
## Install stuff
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update
sudo apt install zoxide zsh lnav neovim fzf tmux
sudo npm i intelephense -g

## Change users shell
sudo chsh $USERNAME -s /bin/zsh

# User
## Install om-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

## Neovim config
git clone https://github.com/forsvunnet/dotfiles.git $HOME/dotfiles
ln -s $HOME/dotfiles/nvim/ $HOME/.config/nvim

