export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="ys"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Git
alias gac="git add -A && git commit -v -m"
alias gs="git switch"
alias brush="git commit -v -m \"🧹💨\""
alias gab="git add -A && git commit -v -m \"🧹💨\""
alias gabp="git add -A && git commit -v -m \"🧹💨\" && git push"
alias d="git checkout develop"
function m() {
    if git rev-parse --verify main &>/dev/null; then
        git checkout main
    elif git rev-parse --verify master &>/dev/null; then
        git checkout master
    else
        echo -e "\033[31mError: Neither 'main' nor 'master' branch exists.\033[0m"
    fi
}

# Composer
alias c='composer'

alias week='date "+%Y-%m-%dT%H:%M:%S%z Week %V"'
alias gp1='git push --set-upstream origin $(echo -n `git rev-parse --abbrev-ref HEAD`)'
alias vim=nvim
alias ovim=/usr/bin/vim

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
alias q='php artisan queue:work --stop-when-empty'

# Composer
alias cda="composer dump-autoload"

