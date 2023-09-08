# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
. "$HOME/.config/zsh/exports.zsh"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

## nnn config
export EDITOR="nvim"

# Flameshot
export QT_QPA_PLATFORM="wayland"

ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
    docker
    npm
    zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias m3ssh="cd /home/manuel/Desarrollo/m3ssh/ && ./m3ssh.sh"
alias devtest="cd /home/manuel/Desarrollo/devtest"
alias v="nvim"
alias genpass='f() { cat /dev/urandom | strings | grep -Eoa "[a-zA-Z0-9@$%&_]*" | head -n 10  | tr -d "\n" | cut -c1-$1 };f'
alias cat='bat --style=plain'

# EZA alias
alias l='eza' #   list, size, type
alias ll='eza -la' # long, all
alias la='eza -lbhHigUmuSa' # all list
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
# Speed keyboard
xset r rate 220 40

NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"
export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# TMUX
if [ "$TMUX" = "" ]; then tmux; fi

bindkey '^[l' forward-word # Move next word in line
bindkey '^H' backward-kill-word
bindkey "^[h" backward-char
bindkey "^[k" up-line-or-history
bindkey "^[j" down-line-or-history
bindkey "^[p" paste

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zsh-vi-mode config
ZVM_VI_INSERT_ESCAPE_BINDKEY=kj
ZVM_VI_HIGHLIGHT_BACKGROUND=#519e97
ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE
function zvm_after_init() {
  zvm_bindkey viins '^[[Z' autosuggest-accept
  zvm_bindkey viins '^[^?' backward-kill-word
  zvm_bindkey viins '^[l' forward-word
  zvm_bindkey viins '^[h' backward-char
  zvm_bindkey viins '^[p' paste
}
