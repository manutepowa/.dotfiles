---
title: Prueba Render Markdown
tags: [test, draft, markdown, nvim, development]
---

# Prueba Render Markdown

# Prueba de Configuración Render Markdown

Este es un documento completo para probar todas las características del plugin render-markdown.nvim.

## Headers de Diferentes Niveles

### Nivel 3: Desarrollo
#### Nivel 4: Testing
##### Nivel 5: Documentación
###### Nivel 6: Notas finales

## Callouts y Contenedores

> [!NOTE]
> Esta es una nota importante que debes recordar.

> [!TIP]
> Usa `Ctrl+Shift+P` para abrir la paleta de comandos.

> [!WARNING]
> Cuidado con este comando, puede eliminar archivos.

> [!CAUTION]
> No ejecutes esto en producción sin pruebas.

> [!IMPORTANT]
> Esta funcionalidad es crítica para el sistema.

> [!SUCCESS]
> ¡La configuración se aplicó correctamente!

> [!TODO]
> Pendiente: Implementar validación de formularios

> [!BUG]
> Error conocido: La función no maneja arrays vacíos

> [!EXAMPLE]
> Ejemplo de uso correcto del API

> [!QUOTE]
> "La simplicidad es la máxima sofisticación" - Leonardo da Vinci

## Listas y Checkboxes

### Lista simple con bullets
- Primer elemento
- Segundo elemento
  - Sub-elemento nivel 2
  - Otro sub-elemento
    - Sub-elemento nivel 3
    - Más elementos anidados
      - Nivel 4 de anidación

### Lista numerada
1. Configurar el entorno
2. Instalar dependencias
3. Ejecutar pruebas
   1. Pruebas unitarias
   2. Pruebas de integración
   3. Pruebas E2E

### Checkboxes y estados custom
- [x] Tarea completada
- [ ] Tarea pendiente
- [-] Tarea en progreso
- [!] Tarea importante
- [/] Tarea parcialmente completada

## Código y Syntax Highlighting

### Inline code
Usa `console.log()` para debug y `npm install` para instalar paquetes.

### Bloques de código

```javascript
// Función para calcular factorial
function factorial(n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

const result = factorial(5);
console.log(`Factorial de 5: ${result}`);
```

```python
# Clase para manejar usuarios
class Usuario:
    def __init__(self, nombre, email):
        self.nombre = nombre
        self.email = email
    
    def saludar(self):
        return f"Hola, soy {self.nombre}"

usuario = Usuario("Manuel", "manuel@example.com")
print(usuario.saludar())
```

```bash
# Scripts de instalación
#!/bin/bash
sudo apt update
sudo apt install neovim
nvim --version
```

```json
{
  "name": "mi-proyecto",
  "version": "1.0.0",
  "scripts": {
    "dev": "vite dev",
    "build": "vite build",
    "test": "vitest"
  },
  "dependencies": {
    "react": "^18.0.0",
    "typescript": "^5.0.0"
  }
}
```

## Enlaces y Referencias

### Enlaces básicos
- [GitHub](https://github.com)
- [Documentación oficial](https://neovim.io)
- [Mi perfil](https://github.com/manuel)

### Enlaces específicos
- [Repositorio en GitHub](https://github.com/user/repo)
- [Sitio web](https://example.com)
- [Email de contacto](mailto:test@example.com)

### Imágenes
![Logo de Neovim](https://neovim.io/logos/neovim-mark-flat.png)

## Tablas

| Herramienta | Lenguaje | Propósito | Estado |
|-------------|----------|-----------|--------|
| Neovim | Lua | Editor | ✅ Activo |
| LazyVim | Lua | Configuración | ✅ Activo |
| Render Markdown | Lua | Plugin | 🔧 Testing |
| Tmux | Shell | Multiplexor | ✅ Activo |

### Tabla con alineación
| Izquierda | Centro | Derecha |
|:----------|:------:|--------:|
| Texto | Centrado | 100€ |
| Más texto | También | 250€ |
| Final | Centrado | 1,000€ |

## Separadores y Elementos Especiales

---

### Citas
> "La perfección se alcanza, no cuando no hay nada más que añadir, sino cuando no hay nada más que quitar."
> — Antoine de Saint-Exupéry

### Texto con formato
**Texto en negrita** y *texto en cursiva*.

~~Texto tachado~~ y `código inline`.

### Escape de caracteres
Para mostrar \*asteriscos\* literales usa backslash.

## Listas de Tareas del Proyecto

### Backend
- [x] Configurar base de datos
- [x] Crear modelos de datos
- [-] Implementar API REST
- [ ] Añadir autenticación JWT
- [!] Revisar seguridad endpoints
- [/] Testing de endpoints

### Frontend
- [x] Configurar React
- [-] Implementar componentes
- [ ] Integrar con API
- [!] Optimizar rendimiento
- [ ] Testing unitarios

### DevOps
- [x] Configurar CI/CD
- [-] Setup Docker
- [ ] Deploy a producción
- [!] Monitoreo y logs

---

*Documento creado para probar render-markdown.nvim - Manuel 2025*
