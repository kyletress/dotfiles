if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
#export RUBYOPT='-W:no-deprecated -W:no-experimental' # suppress experimental RoR server warnings.

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%F{green} %b'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

#PROMPT='%~ '
PROMPT='%F{blue}%2~%f${vcs_info_msg_0_} %F{reset}%# '

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

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi
