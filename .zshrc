if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export RUBYOPT='-W:no-deprecated -W:no-experimental' # suppress experimental RoR server warnings.

PROMPT='%~ '

# Aliases 

alias 'reload=source ~/.zshrc'
alias '..=cd ..'
alias 'lsa=ls -a'
alias 'code=cd ~/code'

# Git Aliases 

alias 'g=git'

# Rails aliases

alias 'rs=rails server'
alias 'rc=rails console'
alias 'migrate=rails db:migrate'

# Middleman aliases

alias 'mms=middleman server'
alias 'mma=middleman article'

# Hledger aliases

alias 'hl=hledger'

# Functions

function mkd() { mkdir -p "$@" && cd "$_"; }
