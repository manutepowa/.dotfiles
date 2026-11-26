#!/bin/sh
# Wait (max 15 s) until Handy has grabbed every keyboard: its passthrough
# devices exist and their count has not changed for 1 s. Always exit 0 so
# xremap still starts (and remaps keys) if Handy is missing or slow.
count() { grep -c '^N: Name="handy-keys passthrough: ' /proc/bus/input/devices; }

prev=-1
stable=0
for _ in $(seq 30); do
  n=$(count)
  if [ "$n" -gt 0 ] && [ "$n" -eq "$prev" ]; then
    stable=$((stable + 1))
    [ "$stable" -ge 2 ] && exit 0
  else
    stable=0
  fi
  prev=$n
  sleep 0.5
done
exit 0
