# Aliases
alias wpadmin=$HOME/Tools/wpadmin/wpadmin.php
alias bump='$HOME/Tools/package-tools/artisan bump'
alias p='php $HOME/Scripts/playground/artisan'
alias aliases='nvim ~/dotfiles/aliases.zsh && . ~/.zshrc'

# Git
alias gac="git add -A && git commit -v -m"
alias gs="git switch"
alias brush="git commit -v -m \"🧹💨\""
alias gab="git add -A && git commit -v -m \"🧹💨\""
alias gabp="git add -A && git commit -v -m \"🧹💨\" && git push"
alias m="git checkout main"
alias d="git checkout develop"

# Tailorbird
alias tb=$HOME/.composer/vendor/bin/tailorbird

# Laravel
alias pa='php artisan'

# Composer
alias c='composer'

alias week='date "+%Y-%m-%dT%H:%M:%S%z Week %V"'
alias gp1='git push --set-upstream origin $(echo -n `git rev-parse --abbrev-ref HEAD`)'
alias vim=nvim
alias ovim=/usr/bin/vim
alias pstorm=phpstorm

# Laravel
alias a='php artisan'
alias am='php artisan migrate'
alias amf='php artisan migrate:fresh'
alias amr='php artisan migrate:rollback'
alias am:migration='php artisan make:migration'
alias am:view='php artisan make:view'
alias am:component='php artisan make:component --view'
alias am:componentc='php artisan make:component'
alias am:componenti='php artisan make:component --inline'
alias am:command='php artisan make:command'
alias am:model='php artisan make:model'
alias am:controller='php artisan make:model'
alias am:data='php artisan make:data'

# Obsidian
alias o='nvim /Users/eivin-landa/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Obsidian.md'

