# Chrome con CDP (puerto 9222) para agent-browser

Objetivo: que el Chrome de siempre (con sesiones, extensiones y contraseñas) arranque
por defecto con `--remote-debugging-port=9222`, para que `agent-browser --cdp 9222`
se conecte sin avisos ni permisos.

## Por qué hace falta

Desde Chrome 136, `--remote-debugging-port` no se activa sobre el perfil por defecto
(`~/.config/google-chrome`), por seguridad. Solo funciona con un
`--user-data-dir` distinto. La solución es:

1. Copiar el perfil a otra carpeta: `~/.config/google-chrome-cdp`.
2. Sobrescribir el lanzador `google-chrome.desktop` en `~/.local/share/applications/`
   (mismo nombre que el del sistema, así que tiene prioridad) para que añada
   `--user-data-dir=... --remote-debugging-port=9222`.

El icono del dock, el navegador por defecto y los enlaces abiertos desde otras apps
pasan a usar ese lanzador. Las sesiones se conservan porque las cookies se cifran con
el llavero de GNOME, no con la ruta del perfil.

## Montarlo en un equipo nuevo

```bash
killall chrome            # Chrome tiene que estar cerrado del todo
~/.dotfiles/chrome/setup-cdp.sh
```

El script:

- Copia `~/.config/google-chrome` a `~/.config/google-chrome-cdp` (si no existe ya)
  y borra los ficheros de bloqueo `Singleton*` y `DevToolsActivePort`.
- Genera `~/.local/share/applications/google-chrome.desktop` a partir del del sistema,
  insertando los flags en todas las líneas `Exec=`.
- Fija `google-chrome.desktop` como navegador por defecto.

Variables opcionales: `CDP_PROFILE` (ruta del perfil) y `CDP_PORT` (puerto).

## Comprobar que funciona

Abre Chrome desde el icono y:

```bash
curl -s localhost:9222/json/version      # debe devolver "Browser": "Chrome/..."
agent-browser --cdp 9222 tab list         # lista las pestañas abiertas
```

No debe salir ningún aviso en Chrome y las sesiones deben seguir iniciadas.

## A tener en cuenta

- Lanzar `google-chrome` **desde la terminal** sin flags usa el perfil antiguo
  (`~/.config/google-chrome`), no el de CDP. Usa siempre el icono, o
  `gtk-launch google-chrome`.
- El perfil original queda como respaldo; puedes borrarlo cuando estés seguro.
- Si una actualización de Chrome cambia el `.desktop` del sistema (nuevas acciones,
  iconos), vuelve a ejecutar el script con Chrome cerrado: no toca el perfil si ya existe.
- Con el puerto abierto, cualquier proceso local puede controlar el navegador.
  Es el precio de no tener avisos; el puerto solo escucha en `localhost`.
