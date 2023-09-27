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
#export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export EDITOR=vim

for dir in $HOME/.local/bin $HOME/bin $HOME/.local/share/go/bin; do
	[ -d $dir ] && export PATH=$dir:$PATH
done

# https://wiki.archlinux.org/index.php/Zsh#Prompts
export PROMPT="%(?..%F{red}[%?]%f )%F{green}%n%f@%F{magenta}%m%f %F{blue}%B%~%b%f %# "
export RPROMPT='[%F{yellow}%*%f]'

# Allow running `pipenv` from directories below the root-2.
export PIPENV_MAX_DEPTH=10

export PIPENV_HIDE_EMOJIS=true

if [ -f ~/.config/zsh/by_hostname/`hostname`.sh ]; then
	source ~/.config/zsh/by_hostname/`hostname`.sh
fi

if [ -f ~/.config/zsh/private/zsh ]; then
	source ~/.config/zsh/private/zsh
fi

source ~/.config/zsh/search

export EDITOR=vim

alias ls="ls --color=auto"
command -v atuin >/dev/null && eval "$(atuin init --disable-up-arrow zsh)"
