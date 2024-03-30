ln -s $HOME/dotfiles/.ideavimrc $HOME/.ideavimrc
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.gitignore $HOME/.gitignore

brew install fzf the_silver_searcher nvim croc 

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
cargo install zoxide --locked

eval "$(zoxide init zsh)"

git config --global push.autoSetupRemote true
