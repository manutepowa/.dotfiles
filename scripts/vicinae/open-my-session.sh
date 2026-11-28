#!/bin/sh
# @vicinae.schemaVersion 1
# @vicinae.title Abrir mi sesión
# @vicinae.mode compact
# @vicinae.keywords ["inicio", "sesion", "startup"]

failed=0
for desktop_id in \
    google-chrome.desktop \
    chrome-hnpfjngllnobngcgfapefoaidbinmjnm-Default.desktop \
    chrome-majiogicmcnmdhhlgmkahaleckhjbmlk-Default.desktop \
    Mailspring.desktop \
    discord.desktop \
    com.mitchellh.ghostty.desktop
do
    case "$desktop_id" in
        discord.desktop)
            # Electron can keep logging after Vicinae closes the launcher's pipes.
            gtk-launch "$desktop_id" </dev/null >/dev/null 2>&1 || failed=1
            ;;
        *)
            gtk-launch "$desktop_id" || failed=1
            ;;
    esac
done

if [ "$failed" -eq 0 ]; then
    printf '%s\n' 'Aplicaciones enviadas para abrir.'
else
    printf '%s\n' 'No se pudieron abrir todas las aplicaciones.'
fi
exit "$failed"
