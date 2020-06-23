zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/chandler/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

# uncomment for vim keybindings
#bindkey -v
bindkey -e
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# https://stackoverflow.com/a/38980986
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export EDITOR=vim

for dir in $HOME/.local/bin $HOME/bin; do
	export PATH=$dir:$PATH
done

# https://wiki.archlinux.org/index.php/Zsh#Prompts
autoload -Uz promptinit
promptinit
prompt redhat

# Allow running `pipenv` from directories below the root-2.
export PIPENV_MAX_DEPTH=10

export PIPENV_HIDE_EMOJIS=true
