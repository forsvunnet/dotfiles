# Loaded by every interactive shell, on a Mac and on a server alike. Every line
# below has to survive a machine where the thing it configures is missing.

source $HOME/dotfiles/path-config.zsh

[ -d "$HOME/.oh-my-zsh" ] && source $HOME/dotfiles/oh-my-zsh-config.zsh

source $HOME/dotfiles/aliases.zsh

# zoxide, provides z
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# fzf, provides ctrl-r history search and ctrl-t file search
command -v fzf >/dev/null && source <(fzf --zsh)

# nvm, from Homebrew on a Mac and from its own installer on a server
export NVM_DIR="$HOME/.nvm"
[ -s /opt/homebrew/opt/nvm/nvm.sh ] && source /opt/homebrew/opt/nvm/nvm.sh
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"

# pyenv
command -v pyenv >/dev/null && eval "$(pyenv init - zsh)"

# rust
[ -s "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Anything true of this machine only, kept out of the repo
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
