#!/usr/bin/env bash
set -euo pipefail

battery=$(find /sys/class/power_supply -maxdepth 1 -name 'BAT*' -print -quit)

if [[ -n "$battery" && -r "$battery/capacity" ]]; then
  printf 'BAT %s%%\n' "$(<"$battery/capacity")"
else
  exit 1
fi
