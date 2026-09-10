#!/usr/bin/env bash
# CPU usada (porcentaje) para tab_bar_right de Herdr.
# Herdr muestra la última línea del output exitoso.
# /proc/stat da contadores acumulados desde el boot, así que se toman dos
# muestras separadas por una ventana corta y se calcula el delta ocupado.
# "ocupado" = todo el tiempo total menos (idle + iowait), como `top`/`htop`.
set -euo pipefail

if [[ -r /proc/stat ]]; then
  read -r _ u n s idle iowait irq sirq st _ < /proc/stat
  total1=$((u + n + s + idle + iowait + irq + sirq + st))
  idle1=$((idle + iowait))

  sleep 0.3

  read -r _ u n s idle iowait irq sirq st _ < /proc/stat
  total2=$((u + n + s + idle + iowait + irq + sirq + st))
  idle2=$((idle + iowait))

  dtotal=$((total2 - total1))
  didle=$((idle2 - idle1))

  if ((dtotal <= 0)); then
    echo " CPU  n/a"
    exit 1
  fi

  awk -v dt="$dtotal" -v di="$didle" 'BEGIN { printf " CPU %.0f%%\n", (dt - di) * 100 / dt }'
else
  # Fallback (macOS u otros): top sin ventana propia
  if command -v top >/dev/null 2>&1; then
    top -l 2 -n 0 | awk '/CPU usage/ { v = $3 } END { if (v == "") exit 1; printf " CPU %s\n", v }'
  else
    echo " CPU  n/a"
    exit 1
  fi
fi
