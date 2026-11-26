# Vicinae en Ubuntu con GNOME y Wayland

Guía para instalar Vicinae como lanzador y usar su historial del portapapeles sin CopyQ. La **aplicación** guarda y muestra el historial; la **extensión de GNOME** le permite detectar lo que copias en otras aplicaciones. Instalar solo la extensión no instala el comando `vicinae`.

## Instalación

1. Instala y activa la [extensión de Vicinae para GNOME](https://extensions.gnome.org/extension/8594/vicinae/).
2. Instala la biblioteca de Ubuntu y usa el [instalador oficial de Vicinae](https://docs.vicinae.com/install/linux) con el prefijo de usuario. Solo `apt` necesita `sudo`:

   ```bash
   sudo apt install libopengl0
   curl -fsSL https://vicinae.com/install -o /tmp/vicinae-install.sh && bash /tmp/vicinae-install.sh --prefix "$HOME/.local"
   ```

3. Inicia Vicinae y habilita el arranque en futuras sesiones:

   ```bash
   systemctl --user daemon-reload
   systemctl --user enable --now vicinae.service
   ```

## Atajo para mostrar u ocultar el lanzador

En **Configuración de Ubuntu → Teclado → Ver y personalizar atajos → Atajos personalizados**, pulsa **+**, escribe `Vicinae` como nombre y elige una combinación libre. No lo configures en *Vicinae Settings → Keybindings*: esos atajos actúan dentro del lanzador.

Para obtener el comando con la ruta correcta en cada equipo, ejecuta esta línea en la terminal y **copia el resultado** al campo **Comando**:

```bash
printf '%s\n' "$HOME/.local/bin/vicinae vicinae://toggle"
```

Si quieres otro atajo que abra directamente el historial, usa la misma ruta al ejecutable y sustituye `vicinae://toggle` por `vicinae://launch/clipboard/history`.

## Copiar desde el historial sin pegar automáticamente

En **Vicinae Settings → Clipboard → Clipboard History**, cambia **Default Action** de **Paste** a **Copy**. Para comprobarlo, copia dos textos distintos, abre *Clipboard History* y elige el primero con `Enter`. No debería insertarse nada hasta que pulses `Ctrl+V` en la aplicación de destino.

## Si no abre

- **`command not found: vicinae`:** comprueba si existe `~/.local/bin/vicinae`. Si existe, usa esa ruta; si no, revisa el paso de instalación de la aplicación.
- **Error de conexión a `vicinae.sock`:** consulta `journalctl --user -u vicinae.service -n 20 --no-pager`. En este equipo faltaba `libOpenGL.so.0`; se resolvió con `sudo apt install libopengl0` y `systemctl --user restart vicinae.service`.
- **El lanzador abre pero no registra copias:** comprueba que la extensión está activa, que el historial no está en pausa y prueba con texto nuevo copiado después de iniciar Vicinae.
