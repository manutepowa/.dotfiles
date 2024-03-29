#!/usr/bin/env bash
# brew upgrade tmux eza fzf neovim bpytop translate-shell ripgrep
brew upgrade

brew install tmux
brew install eza
brew install fzf
brew install neovim
brew install bpytop
brew install translate-shell
brew install ripgrep
# Remove outdated versions from the cellar.
brew cleanup
