#!/usr/bin/env bash
# Launch Google Chrome with remote debugging (CDP on port 9222) by default,
# using a non-default profile directory so Chrome does not block or prompt.
# See README.md in this folder.
set -euo pipefail

SRC_PROFILE="${HOME}/.config/google-chrome"
CDP_PROFILE="${CDP_PROFILE:-${HOME}/.config/google-chrome-cdp}"
PORT="${CDP_PORT:-9222}"
SYSTEM_DESKTOP="/usr/share/applications/google-chrome.desktop"
USER_DESKTOP="${HOME}/.local/share/applications/google-chrome.desktop"

if pgrep -f '/opt/google/chrome/chrome' >/dev/null; then
  echo "Chrome is running. Close it completely first (e.g. killall chrome)." >&2
  exit 1
fi

if [[ ! -f "${SYSTEM_DESKTOP}" ]]; then
  echo "Missing ${SYSTEM_DESKTOP}. Is google-chrome-stable installed?" >&2
  exit 1
fi

if [[ -d "${CDP_PROFILE}" ]]; then
  echo "Profile ${CDP_PROFILE} already exists; leaving it untouched."
elif [[ -d "${SRC_PROFILE}" ]]; then
  echo "Copying ${SRC_PROFILE} -> ${CDP_PROFILE} ..."
  cp -a "${SRC_PROFILE}" "${CDP_PROFILE}"
  rm -f "${CDP_PROFILE}"/Singleton{Lock,Socket,Cookie} "${CDP_PROFILE}/DevToolsActivePort"
else
  echo "No existing profile; Chrome will create ${CDP_PROFILE} on first launch."
fi

mkdir -p "$(dirname "${USER_DESKTOP}")"
sed -E "s#^Exec=/usr/bin/google-chrome-stable#Exec=/usr/bin/google-chrome-stable --user-data-dir=${CDP_PROFILE} --remote-debugging-port=${PORT}#" \
  "${SYSTEM_DESKTOP}" > "${USER_DESKTOP}"
update-desktop-database "$(dirname "${USER_DESKTOP}")" 2>/dev/null || true
xdg-settings set default-web-browser google-chrome.desktop

echo "Done. Exec lines:"
grep '^Exec' "${USER_DESKTOP}"
echo "Open Chrome from its icon, then check: curl -s localhost:${PORT}/json/version"
