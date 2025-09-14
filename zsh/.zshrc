# Prompt
PROMPT='%n:~$ '

# Aliases 
alias 'reload=source ~/.zshrc'
alias '..=cd ..'
alias 'lsa=ls -a'

# Git Aliases 
alias 'g=git'

# Rails aliases
alias 'rs=rails server'
alias 'rc=rails console'
alias 'migrate=rails db:migrate'

# Middleman aliases
alias 'mms=middleman server'

# Enable chruby
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh

# Auto-switch Ruby versions based on .ruby-version
source /opt/homebrew/opt/chruby/share/chruby/auto.sh

chruby ruby-3.4.4
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
