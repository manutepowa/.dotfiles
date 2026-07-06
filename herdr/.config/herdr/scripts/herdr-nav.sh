#!/usr/bin/env bash
# herdr-nav <left|down|up|right>
# Navegación vim-aware entre paneles de herdr.
# Si el foreground es (n)vim: reenvía Ctrl+h/j/k/l hacia adentro (para wincmd).
# Si no: mueve el foco de herdr al panel vecino.
set -euo pipefail

dir=${1:?usage: herdr-nav <left|down|up|right>}
case $dir in
  left)  key="ctrl+h" ;;
  down)  key="ctrl+j" ;;
  up)    key="ctrl+k" ;;
  right) key="ctrl+l" ;;
  *)     echo "herdr-nav: bad direction '$dir'" >&2; exit 1 ;;
esac

herdr="${HERDR_BIN_PATH:-herdr}"

# Regex de procesos vim (la misma que usa vim-tmux-navigator)
vim_re='^g?(view|l?n?vim?x?)(diff)?$'
passthrough_re="${HERDR_NAV_PASSTHROUGH_RE:-}"

# Obtenemos info del pane actual y decidimos en un solo pipe
if ! info=$("$herdr" pane process-info --current 2>/dev/null); then
  exec "$herdr" pane focus --direction "$dir" --current
fi

pane_id=$(jq -r '.result.process_info.pane_id // empty' <<<"$info")
if [ -z "$pane_id" ]; then
  exec "$herdr" pane focus --direction "$dir" --current
fi

if echo "$info" \
  | jq -e --arg vim "$vim_re" --arg pass "$passthrough_re" \
    '.result.process_info.foreground_processes[]?.name
     | ascii_downcase
     | select(test($vim) or ($pass != "" and test($pass)))' >/dev/null 2>&1; then
  exec "$herdr" pane send-keys "$pane_id" "$key"
else
  exec "$herdr" pane focus --direction "$dir" --current
fi
