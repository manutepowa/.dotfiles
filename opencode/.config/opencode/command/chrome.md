---
description: Controla Chrome abierto mediante chrome-devtools MCP (--autoConnect)
---

# Chrome DevTools

Controla una instancia de Chrome abierta usando el MCP `chrome-devtools` con `--autoConnect`. El agente tiene acceso a las herramientas CDP (Chrome DevTools Protocol) para navegar, inspeccionar, extraer datos y automatizar acciones en el navegador.

## Requisitos

- Chrome 144+ ejecutándose con remote debugging habilitado (`chrome://inspect#remote-debugging`)
- MCP `chrome-devtools` habilitado en `opencode.json` (propiedad `enabled: true`)
- La primera vez Chrome pedirá permiso — el usuario debe hacer clic en "Allow"

## Uso

`/chrome $ARGUMENTS`

El argumento describe qué hacer en el navegador: navegar a una URL, hacer clic en un elemento, extraer información, tomar screenshot, etc.

## Herramientas del MCP disponibles

### Navegación
- `list_pages` — lista todas las pestañas abiertas
- `navigate_page` — navega a una URL
- `new_page` — abre una nueva pestaña
- `select_page` — cambia a una pestaña específica
- `close_page` — cierra la pestaña actual
- `wait_for` — espera a que ocurra un evento (selector, navegación, etc.)

### Input automation
- `click` — hace clic en un elemento por selector CSS
- `fill` — rellena un campo de texto
- `fill_form` — rellena múltiples campos de un formulario de una sola vez
- `hover` — hover sobre un elemento
- `press_key` — presiona una tecla (Enter, Tab, Escape, etc.)
- `type_text` — escribe texto caracter por caracter
- `upload_file` — sube un archivo a un input file
- `handle_dialog` — acepta o cancela un diálogo (alert, confirm, prompt)

### Debugging e inspección
- `evaluate_script` — ejecuta JavaScript arbitrario en la página
- `take_snapshot` — captura el DOM accesible (árbol de accesibilidad)
- `take_screenshot` — captura screenshot de la página visible
- `list_console_messages` — lista mensajes de la consola
- `get_console_message` — obtiene un mensaje específico de consola
- `lighthouse_audit` — ejecuta auditoría Lighthouse

### Network
- `list_network_requests` — lista peticiones de red
- `get_network_request` — obtiene detalle de una petición específica

### Rendimiento
- `performance_analyze_insight` — analiza una traza de rendimiento
- `performance_start_trace` / `performance_stop_trace` — traza de rendimiento

### Emulación
- `emulate` — emula dispositivo, viewport, geolocalización, etc.
- `resize_page` — cambia el tamaño de la ventana

## Flujo de ejecución

1. **Diagnóstico inicial**: ejecutar `list_pages` para ver las pestañas abiertas y confirmar que la conexión con Chrome funciona
2. **Ejecutar la acción** según lo que pida `$ARGUMENTS`:
   - Si es navegar: `navigate_page` + opcional `wait_for`
   - Si es interactuar: `click` / `fill` / `fill_form` + verificar con snapshot
   - Si es extraer datos: `evaluate_script` o `take_snapshot`
   - Si es debugging: `list_console_messages`, `list_network_requests`
   - Si es captura visual: `take_screenshot`
3. **Reportar**: devolver el resultado al usuario (texto extraído, screenshot, console output, etc.)

## Reglas

- Usar `--autoConnect` — NO iniciar una nueva instancia de Chrome
- Verificar que la conexión está activa antes de ejecutar acciones
- **NUNCA tomar `take_screenshot` a menos que el usuario lo pida explícitamente** — usa siempre `take_snapshot` (accessibility tree) en su lugar
- Preferir `take_snapshot` (accesibility tree) sobre `evaluate_script` para entender el estado del DOM
- Usar `wait_for` para sincronización (esperar selector, esperar navegación)
- Si una acción requiere múltiples pasos (ej: login), secuenciarlos con verificaciones intermedias
- Si el MCP no responde, indicar al usuario que verifique:
  - `chrome://inspect#remote-debugging` está activado
  - El MCP `chrome-devtools` está habilitado en `opencode.json`
  - Chrome 144+ está en ejecución
