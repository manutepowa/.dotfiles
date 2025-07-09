# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
. "$HOME/.config/zsh/exports.zsh"

eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(starship init zsh)"

## nnn config
export EDITOR="nvim"
export SNACKS_GHOSTTY=true

# Flameshot
export QT_QPA_PLATFORM="wayland"

# ZSH_THEME="robbyrussell"


# fzf key bindings for vi mode
VI_MODE_SET_CURSOR=true

bindkey '^[l' forward-word # Move next word in line
# bindkey '^H' backward-kill-word
bindkey "^[h" backward-char
bindkey "^[k" up-line-or-history
bindkey "^[j" down-line-or-history

# vi-mode
bindkey -M viins '^[^?' backward-kill-word
bindkey -M viins 'kj' vi-cmd-mode

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z docker npm vi-mode fzf zsh-autosuggestions zsh-syntax-highlighting)


alias m3ssh="cd /home/manuel/Desarrollo/m3ssh/ && ./m3ssh.sh"
alias devtest="cd /home/manuel/Desarrollo/devtest"

# Add git editor with lazyvim: git config --global core.editor "NVIM_APPNAME=lazyvim nvim"
alias v="NVIM_APPNAME=lazyvim nvim"
alias vl="nvim"
# alias genpass='f() { cat /dev/urandom | strings | grep -Eoa "[a-zA-Z0-9@$%&_]*" | head -n 10  | tr -d "\n" | cut -c1-$1 };f'
alias cat='bat --style=plain'

alias dds='ddev start' # all list
alias ddp='ddev poweroff' # all list
alias dde='ddev ssh' # all list
alias ddr='ddev restart' # all list
alias ddx='ddev xdebug' # all list
alias ddm='ddev mailpit' # all list

# Bazecore
alias bb='/home/manuel/Descargas/NEWDEB/Bazecor-1.6.5-x64.AppImage' # all list

alias pn='pnpm'
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

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/run/user/1000/fnm_multishells/42814_1730096383842/bin":$PATH
export FNM_MULTISHELL_PATH="/run/user/1000/fnm_multishells/42814_1730096383842"
export FNM_VERSION_FILE_STRATEGY="local"
export FNM_DIR="/home/manuel/.local/share/fnm"
export FNM_LOGLEVEL="info"
export FNM_NODE_DIST_MIRROR="https://nodejs.org/dist"
export FNM_COREPACK_ENABLED="false"
export FNM_RESOLVE_ENGINES="false"
export FNM_ARCH="x64"
rehash


# fzf key bindings for zsh
export FZF_DEFAULT_OPTS='--bind=alt-k:up,alt-j:down'

source $ZSH/oh-my-zsh.sh

# EZA alias
alias l='eza -l --icons' #   list, size, type
alias ll='eza --icons -la' # long, all
alias la='eza -lbhHigUmuSa' # all list

# Turso
export PATH="/home/manuel/.turso:$PATH"

# opencode
export PATH=/home/manuel/.opencode/bin:$PATH
