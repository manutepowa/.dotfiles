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

## Restaurar las preferencias con GNU Stow

El paquete [`vicinae`](../vicinae/.config/vicinae/settings.json) es una copia de `~/.config/vicinae/settings.json`: aspecto, idioma, **Alt+A** para *Actions*, favoritos y las reglas del portapapeles, incluida **copiar** como acción del historial. No contiene el contenido del historial, índices ni extensiones. El favorito **Buscar y navegar** requiere instalar File Dive por separado. El atajo global para abrir el lanzador se configura en GNOME.

En un equipo con GNU Stow y la ruta de configuración estándar (`~/.config`), ejecuta lo siguiente **desde la raíz de estos dotfiles**. Si es una instalación nueva, hazlo antes de iniciar Vicinae por primera vez:

```bash
stow --simulate --verbose --no-folding --target="$HOME" vicinae
# Solo si la simulación no muestra conflictos:
stow --no-folding --target="$HOME" vicinae
```

Si ya existe un `~/.config/vicinae/settings.json` que no es el enlace del paquete, detente: Stow no mezcla archivos. Conserva una copia, compara tus preferencias y decide cuáles mantener antes de sustituirlo. No uses `--adopt` para forzar la instalación.

`--no-folding` enlaza solo el archivo, no el directorio. Para sincronizar un cambio entre equipos, edita el JSON del paquete y revisa su diff antes de guardarlo en Git. Si cambias ajustes desde la interfaz, comprueba después con `readlink ~/.config/vicinae/settings.json` que siga siendo un enlace al repositorio y no publiques preferencias privadas añadidas por la aplicación.

## Atajo para mostrar u ocultar el lanzador

En **Configuración de Ubuntu → Teclado → Ver y personalizar atajos → Atajos personalizados**, pulsa **+**, escribe `Vicinae` como nombre y elige una combinación libre. No lo configures en *Vicinae Settings → Keybindings*: esos atajos actúan dentro del lanzador.

Para obtener el comando con la ruta correcta en cada equipo, ejecuta esta línea en la terminal y **copia el resultado** al campo **Comando**:

```bash
printf '%s\n' "$HOME/.local/bin/vicinae vicinae://toggle"
```

Si quieres otro atajo que abra directamente el historial, usa la misma ruta al ejecutable y sustituye `vicinae://toggle` por `vicinae://launch/clipboard/history`.

## Buscar archivos y navegar por carpetas con File Dive

[File Dive](https://github.com/manutepowa/vicinae-file-dive) añade el comando **Buscar y navegar** sin sustituir *Search Files*. Para instalarlo necesitas Vicinae 0.30.1 en ejecución, Node.js 18 o posterior y npm. En este equipo el repositorio ya está clonado. Instala la extensión desde esa copia:

```bash
cd /home/manuel/Desarrollo/opensource/vicinae-file-dive && npm install && npm run build
```

En otro equipo, clona primero el repositorio con `git clone https://github.com/manutepowa/vicinae-file-dive.git` y ejecuta `npm install && npm run build` dentro de la carpeta clonada.

Tras la primera instalación, reinicia el lanzador con `systemctl --user restart vicinae.service`. Abre Vicinae, ejecuta **Buscar y navegar** y escribe el nombre de una carpeta. Selecciónala con las flechas y pulsa `Enter`: su contenido sustituye los resultados en la lista principal, sin abrir el gestor de archivos.

Dentro de una carpeta, escribe para filtrar solo sus archivos y subcarpetas. `Enter` sobre una subcarpeta entra en ella; sobre un archivo, lo abre con la aplicación predeterminada. `Esc` vuelve a la vista anterior y recupera la búsqueda y la selección.

## Abrir todas las aplicaciones con un comando

**Abrir mi sesión** abre WhatsApp Web, Telegram Web, Mailspring, Discord, Google Chrome y Ghostty. No las añade al inicio automático.

Desde la raíz de este repositorio, instala el script en el directorio de Vicinae:

```bash
install -D -m 644 scripts/vicinae/open-my-session.sh \
  "${XDG_DATA_HOME:-$HOME/.local/share}/vicinae/scripts/open-my-session.sh"
```

En Vicinae, ejecuta **Reload Script Directories** y luego busca **Abrir mi sesión**. Si reinstalas WhatsApp Web o Telegram Web en otro perfil de Chrome, comprueba que los identificadores `.desktop` del script siguen correspondiendo a los de ese perfil.

## Copiar desde el historial sin pegar automáticamente

En **Vicinae Settings → Clipboard → Clipboard History**, cambia **Default Action** de **Paste** a **Copy**. Para comprobarlo, copia dos textos distintos, abre *Clipboard History* y elige el primero con `Enter`. No debería insertarse nada hasta que pulses `Ctrl+V` en la aplicación de destino.

## Si no abre

- **`command not found: vicinae`:** comprueba si existe `~/.local/bin/vicinae`. Si existe, usa esa ruta; si no, revisa el paso de instalación de la aplicación.
- **Error de conexión a `vicinae.sock`:** consulta `journalctl --user -u vicinae.service -n 20 --no-pager`. En este equipo faltaba `libOpenGL.so.0`; se resolvió con `sudo apt install libopengl0` y `systemctl --user restart vicinae.service`.
- **El lanzador abre pero no registra copias:** comprueba que la extensión está activa, que el historial no está en pausa y prueba con texto nuevo copiado después de iniciar Vicinae.
