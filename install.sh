ln -s $HOME/dotfiles/.ideavimrc $HOME/.ideavimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.gitignore $HOME/.gitignore

brew install fzf the_silver_searcher

