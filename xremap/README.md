# xremap + Handy

[xremap](https://github.com/xremap/xremap) remaps keys system-wide.
[Handy](https://github.com/cjpais/Handy) does speech-to-text with a push-to-talk shortcut (`Shift+Space`).

## Why the start order matters

Both programs grab the keyboards exclusively (`EVIOCGRAB`), and only the first one gets them.

- Handy (`keyboard_implementation: handy_keys`) blocks its shortcut by grabbing each keyboard
  and re-emitting every other key through a virtual `handy-keys passthrough: <name>` device.
- If xremap grabs the keyboards first, Handy can only *detect* the shortcut, not block it.
  Symptom: pressing `Shift+Space` types a space in the focused app before recording starts.

The working chain is:

```text
physical keyboard -> Handy (blocks Shift+Space) -> handy-keys passthrough -> xremap -> apps
```

## Setup

```sh
~/.dotfiles/xremap/install-services.sh
```

It symlinks `systemd/handy.service` and `systemd/xremap.service` into `~/.config/systemd/user/`,
enables both and restarts them in order.

- `xremap.service` starts `After=handy.service` and waits up to 15 s for Handy's passthrough
  of the built-in keyboard; it then starts anyway, so remaps are never lost.
- `PartOf=handy.service` restarts xremap whenever Handy restarts, keeping the order.
- Keep Handy's own "Launch on startup" setting **off**; systemd starts it.

## Gotchas

- Restart Handy with `systemctl --user restart handy`, not from the app menu. Launching it
  by hand while xremap runs brings the stray space back.
- Handy only grabs keyboards at startup or on hotplug. Stopping xremap alone does not fix
  it; Handy must be restarted afterwards.
- Check the chain: `grep '^N:' /proc/bus/input/devices | grep passthrough` should list your
  keyboards, and `journalctl --user -u xremap` shows expected `Resource busy` errors for the
  physical keyboards.
