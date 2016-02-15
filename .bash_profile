# load aliases
if [ -f ~/alias ]; then
    source ~/alias
fi

# load prompt
if [ -f ~/prompt ]; then
    source ~/prompt
fi

# load prompt
if [ -f ~/functions ]; then
    source ~/functions
fi

# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Shell prompt based on the Solarized Dark theme.
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
	export TERM='gnome-256color';
elif infocmp xterm-256color >/dev/null 2>&1; then
	export TERM='xterm-256color';
fi;
