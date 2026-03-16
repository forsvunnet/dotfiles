mkdir $HOME/.claude

ln -s $HOME/dotfiles/.ideavimrc $HOME/.ideavimrc
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.gitignore $HOME/.gitignore
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/skills $HOME/.claude/skills
ln -s $HOME/dotfiles/claude.settings.json $HOME/.claude/settings.json

brew install fzf the_silver_searcher nvim croc tmux

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update
cargo install zoxide --locked

eval "$(zoxide init zsh)"

git config --global push.autoSetupRemote true
