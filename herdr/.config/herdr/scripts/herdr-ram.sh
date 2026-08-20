#!/usr/bin/env bash
# RAM usada/total para tab_bar_right de Herdr.
# Herdr muestra la última línea del output exitoso.
# "usada" = MemTotal - MemAvailable (cuenta buff/cache no reclamable, como `free`).
set -euo pipefail

if [[ -r /proc/meminfo ]]; then
  awk '
    /^MemTotal:/     { total = $2 }
    /^MemAvailable:/ { avail = $2 }
    END {
      used = total - avail
      printf " %.1fG/%.0fG\n", used / 1048576, total / 1048576
    }
  ' /proc/meminfo
else
  # Fallback (macOS u otros): free de GNU no existe
  if command -v free >/dev/null 2>&1; then
    free --bytes | awk '/^Mem:/ { u = $2 - $7; printf " %.1fG/%.0fG\n", u / 1073741824, $2 / 1073741824 }'
  else
    echo " n/a"
    exit 1
  fi
fi
