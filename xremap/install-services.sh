#!/usr/bin/env bash
# Link the Handy and xremap user services from the dotfiles and enable them.
set -euo pipefail

src="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/systemd"
dst="$HOME/.config/systemd/user"
mkdir -p "$dst"

for unit in handy.service xremap.service; do
  ln -sfn "$src/$unit" "$dst/$unit"
done

systemctl --user daemon-reload
systemctl --user enable handy.service xremap.service
systemctl --user restart handy.service
systemctl --user restart xremap.service
