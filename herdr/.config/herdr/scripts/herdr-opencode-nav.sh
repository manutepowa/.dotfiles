#!/usr/bin/env bash
# herdr-opencode-nav <up|down|left|right|h|j|k|l>
# Si opencode está en foreground, envía la tecla de navegación hacia dentro.
# Si no, pasa la tecla Alt+original al panel.
set -euo pipefail

dir=${1:?usage: herdr-opencode-nav <up|down|left|right|h|j|k|l>}
case $dir in
down)
  key=Down
  orig="alt+j"
  ;;
up)
  key=Up
  orig="alt+k"
  ;;
left)
  key=Left
  orig="alt+h"
  ;;
right)
  key=Right
  orig="alt+l"
  ;;
*)
  echo "herdr-opencode-nav: bad direction '$dir'" >&2
  exit 1
  ;;
esac

info=$(herdr pane process-info --current)
pane_id=$(jq -r '.result.process_info.pane_id' <<<"$info")

# opencode puede aparecer como "opencode" (proceso raíz) o "opencode"
if jq -r '.result.process_info.foreground_processes[] | .name, (.argv[]?)' <<<"$info" |
  grep -iqF opencode; then
  herdr pane send-keys "$pane_id" "$key"
else
  herdr pane send-keys "$pane_id" "$orig"
fi
