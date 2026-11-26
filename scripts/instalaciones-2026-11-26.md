# Instalaciones en Ubuntu — 26 de noviembre de 2026

`dpkg` registró **162 instalaciones de paquetes** (incluidas sus dependencias) y **326 paquetes distintos actualizados**. Las herramientas instaladas por Homebrew, npm/pnpm o scripts no están incluidas en ese recuento.

## Aplicaciones y escritorio

- **Aplicaciones:** Google Chrome, Ghostty, ChatGPT, Discord, Handy y Mailspring.
- **GNOME y Wayland:** GNOME Extension Manager y `wl-clipboard`. Se encontraron archivos de Vicinae, xremap y sus extensiones de GNOME, además de la extensión Vertical Workspaces. Para configurar el lanzador y el portapapeles, consulta la [guía de Vicinae](vicinae.md).
- **AppImage:** Neovim se instaló en `/opt/nvim` con un enlace en `/usr/local/bin/nvim`. Bazecor 1.12.0 se ejecutó directamente, sin instalación de paquete registrada.

## Desarrollo y terminal

- **Paquetes de Ubuntu:** Git, `build-essential` (GCC, G++ y Make), `curl`, Zsh, GNU Stow, `gdebi-core`, `socat` y `sshpass`.
- **Contenedores:** Docker Engine, su cliente, `containerd`, Docker Compose, Buildx y DDEV.
- **Homebrew:** `bat`, `btop`, `eza`, `fd`, `fnm`, `fzf`, `gh`, `glab`, `herdr`, `imagemagick`, `jq`, `lazygit`, `ripgrep`, `starship` y `translate-shell`. Codex también aparece en `Caskroom`.
- **Node y herramientas de IA:** Node.js 24.22.1 mediante `fnm`. El historial recoge la instalación global de pnpm y Pi Coding Agent y la ejecución del instalador de Claude Code. También se encontraron ejecutables de Engram y Herdr creados ese día.

## Sistema y actualizaciones

- Se instaló el kernel `7.0.0-44` con sus módulos y cabeceras y se retiró el `7.0.0-30`. Para el arranque UEFI se instalaron GRUB EFI, `efibootmgr` y `shim-signed`.
- Se añadieron códecs multimedia (`ubuntu-restricted-addons`), el diccionario de inglés británico (`wbritish`) y bibliotecas como `libopengl0`.
- Snap registró una actualización automática de cuatro snaps, no cuatro instalaciones nuevas.

**Fuentes:** registros de APT y `dpkg`, cambios de Snap, recibos de Homebrew, historial de Bash/Zsh y archivos instalados. No se desglosan las dependencias locales de cada proyecto de pnpm.
