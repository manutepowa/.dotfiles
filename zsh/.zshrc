# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
. "$HOME/.config/zsh/exports.zsh"

eval "$(/home/linuxbrew/.linuxbrew/bin/fnm env --use-on-cd --shell zsh)"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(starship init zsh)"

## nnn config
export NVIM_APPNAME="lazyvim"
export SNACKS_GHOSTTY=true
export EDITOR="nvim"

# Flameshot
export QT_QPA_PLATFORM="wayland"

export COLORTERM=truecolor

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z docker npm fzf zsh-autosuggestions zsh-syntax-highlighting)

alias m3ssh="cd /home/manuel/Desarrollo/m3ssh/ && ./m3ssh.sh"
alias devtest="cd /home/manuel/Desarrollo/devtest"

# Add git editor with lazyvim: git config --global core.editor "NVIM_APPNAME=lazyvim nvim"
# alias v="NVIM_APPNAME=lazyvim nvim"
alias v="nvim"
alias vl="nvim"
# alias genpass='f() { cat /dev/urandom | strings | grep -Eoa "[a-zA-Z0-9@$%&_]*" | head -n 10  | tr -d "\n" | cut -c1-$1 };f'
alias cat='bat --style=plain'

alias dds='ddev start' # all list
alias ddp='ddev poweroff' # all list
alias dde='ddev ssh' # all list
alias ddr='ddev restart' # all list
alias ddx='ddev xdebug' # all list
alias ddm='ddev mailpit' # all list

# claude code
alias cc='claude' # all list
alias oc='opencode'

# Bazecore
alias bb='/home/manuel/Downloads/NEWDEB/Bazecor-1.8.3-x64.AppImage --no-sandbox' # all list

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

# Turso
export PATH="/home/manuel/.turso:$PATH"

# HERDR — auto-attach o crear sesión persistente
# Descomentar para que herdr se lance automáticamente al abrir terminal
if [ -z "$HERDR_ENV" ] && [ -n "$PS1" ] && [[ "$TERM_PROGRAM" != "vscode" ]] && [[ -z "$SSH_CONNECTION" ]]; then
    herdr
fi

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# fzf key bindings for zsh
export FZF_DEFAULT_OPTS='--bind=alt-k:up,alt-j:down'

source $ZSH/oh-my-zsh.sh

# Native Zsh vi mode
bindkey -v

# Reduce key sequence delay for mappings like "kj".
export KEYTIMEOUT=1

# Cursor shape per mode:
# - vi command mode: block cursor
# - insert mode: beam cursor
function zle-keymap-select {
  case $KEYMAP in
    vicmd)
      echo -ne '\e[2 q'
      ;;
    viins|main)
      echo -ne '\e[6 q'
      ;;
  esac
}

function zle-line-init {
  zle -K viins
  echo -ne '\e[6 q'
}

function zle-line-finish {
  echo -ne '\e[0 q'
}

zle -N zle-keymap-select
zle -N zle-line-init
zle -N zle-line-finish

# Insert mode mappings
bindkey -M viins 'kj' vi-cmd-mode
bindkey -M viins '^[^?' backward-kill-word

# Vim-like movement without leaving insert mode: Alt+h/j/k/l
bindkey -M viins '^[h' backward-char
bindkey -M viins '^[j' down-line-or-history
bindkey -M viins '^[k' up-line-or-history
bindkey -M viins '^[l' forward-word

# EZA alias
alias l='eza -l --icons' #   list, size, type
alias ll='eza --icons -la' # long, all
alias la='eza -lbhHigUmuSa' # all list


PATH=~/.console-ninja/.bin:$PATH

# opencode
export PATH=/home/manuel/.opencode/bin:$PATH

# bun completions
[ -s "/home/manuel/.bun/_bun" ] && source "/home/manuel/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Created by `pipx` on 2026-06-04 11:30:00
export PATH="$PATH:/home/manuel/.local/bin"

# pnpm
export PNPM_HOME="/home/manuel/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# ~/.zshrc
autoload -Uz add-zsh-hook
function _herdr_auto_tab_name {
  herdr tab rename "$HERDR_TAB_ID" "${PWD##*/}" &>/dev/null
}
add-zsh-hook chpwd _herdr_auto_tab_name
_herdr_auto_tab_name  # nombre inicial al abrir el tab
