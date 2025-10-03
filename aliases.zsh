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
alias q='php artisan queue:work --stop-when-empty'

# Composer
alias cda="composer dump-autoload"

# Obsidian
alias o='nvim /Users/eivin-landa/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Obsidian.md'

# Notes
check_file_exists() {
  local file_path="$1"
  if [[ ! -f "$file_path" ]]; then
    echo -e "\033[31mError: File '$file_path' does not exist.\033[0m"
    echo "To create the file, run the following commands:"
    echo -e "\033[32mmkdir -p $(dirname "$file_path")\033[0m"
    echo -e "\033[32mtouch $file_path\033[0m"
    return 1
  fi
}

no() {
  # Define the file path
  local file_path="notes/nb_no.txt"

  # Check if a message was provided
  if [[ -z "$1" ]]; then
    echo -e "\033[33mUsage: no <MESSAGE>\033[0m"
    echo -e "\033[32mExample: no \"This is a note.\"\033[0m"
    return 1
  fi

  # Check if the file exists
  check_file_exists "$file_path" || return 1

  # Append the message to the file
  echo "$1" >> "$file_path"

  # Output the file contents
  echo -e "\033[36mContents of '$file_path':\033[0m"
  cat "$file_path"
}

nocopy() {
  # Define the file path
  local file_path="notes/nb_no.txt"

  # Check if the file exists
  check_file_exists "$file_path" || return 1

  # Copy the contents of the file to the clipboard
  pbcopy < "$file_path"
  echo -e "\033[34mContents of '$file_path' copied to clipboard.\033[0m"
  cat "$file_path"
}

noclear() {
  # Define the file path
  local file_path="notes/nb_no.txt"

  # Check if the file exists
  check_file_exists "$file_path" || return 1

  # Clear the contents of the file
  echo "" > "$file_path"
  echo -e "\033[34mContents of '$file_path' cleared.\033[0m"
}

alias yoff='launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/com.koekeishiya.yabai.plist'
alias yon='launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.koekeishiya.yabai.plist'
