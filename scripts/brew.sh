#!/usr/bin/env bash

brew upgrade

brew install tmux
brew install exa
brew install fzf
brew install neovim
brew install bpytop
brew install translate-shell
brew install ripgrep
# Remove outdated versions from the cellar.
brew cleanup
