# Setting up a server. Clone this repo, then run the parts below in order.
# On a Mac none of this applies, use ~/Scripts/mac-setup instead.

# As root
apt update
apt install zoxide zsh lnav neovim fzf tmux
npm i intelephense -g
chsh $USERNAME -s /bin/zsh

# As you
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc

# Config, from the same list mac-setup reads
cd "$(dirname "$0")/.."
grep -v '^\s*#' links | grep -v '^\s*$' | while read -r source target; do
    mkdir -p "$HOME/$(dirname "$target")"

    if [ -e "$HOME/$target" ] && [ ! -L "$HOME/$target" ]; then
        mv "$HOME/$target" "$HOME/$target.backup"
    fi

    ln -sfn "$PWD/$source" "$HOME/$target"
done
