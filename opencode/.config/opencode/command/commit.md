---
descripción: Crear mensajes de commit convencionales y bien redactados
---

# Comando Commit

Eres un agente de IA que ayuda a crear mensajes de commit convencionales, sigue estas instrucciones exactamente.
## Instrucciones para el Agente

Cuando el usuario ejecute este comando, ejecuta el siguiente flujo de trabajo:

1. **Verificar modo de comando**:
   - Si el usuario tiene $ARGUMENTS que es simple, salta al paso 3

2. **Analizar estado de git**:
   - Ejecutar `git status --porcelain` para verificar cambios
   - Si los archivos ya están en staging, proceder solo con esos archivos
   
3. **Obtener nombre de rama**:
   - Ejecutar `git branch --show-current` para obtener el nombre de la rama actual
   
4. **Analizar los cambios**:
   - Ejecutar `git diff --cached` para ver qué será commiteado
   - Analizar el diff para determinar el tipo de cambio principal (feat, fix, docs, etc.)
   - Identificar el alcance principal y propósito de los cambios
   
5. **Generar mensaje de commit y nombre de rama**:
   - Elegir tipo apropiado de la referencia de abajo
   - Crear mensaje siguiendo el formato: `<tipo>: <descripción>`
   - Generar nombre de rama sugerido en formato: `<tipo>/<descripción-corta-kebab-case>`
   - Mantener la descripción concisa, clara y en modo imperativo
   - Mostrar ambos al usuario: el mensaje de commit y el nombre de rama sugerido
   - **IMPORTANTE**: El output debe mostrar AMBOS elementos claramente etiquetados

## Directrices para Mensajes de Commit

Al generar mensajes de commit, sigue estas reglas:

- **Commits atómicos**: Cada commit debe contener cambios relacionados que sirvan a un solo propósito
- **Modo imperativo**: Escribir como comandos (ej. "agregar funcionalidad" no "agregué funcionalidad")
- **Primera línea concisa**: Mantener bajo 72 caracteres
- **Formato convencional**: Usar `<tipo>: <descripción>` donde tipo es uno de:
  - `feat`: Una nueva funcionalidad
  - `fix`: Una corrección de error
  - `docs`: Cambios en documentación
  - `style`: Cambios de estilo de código (formato, etc.)
  - `refactor`: Cambios de código que no arreglan errores ni agregan funcionalidades
  - `perf`: Mejoras de rendimiento
  - `test`: Agregar o arreglar pruebas
  - `chore`: Cambios al proceso de build, herramientas, etc.
- **Tiempo presente, modo imperativo**: Escribir mensajes de commit como comandos
- **Primera línea concisa**: Mantener la primera línea bajo 72 caracteres

## Referencia: Buenos Ejemplos de Commit

Usa estos como ejemplos al generar mensajes de commit:
- feat: add user authentication system
- fix: resolve memory leak in rendering process
- docs: update API documentation with new endpoints
- refactor: simplify error handling logic in parser
- fix: resolve linter warnings in component files
- chore: improve setup process for development tools
- feat: implement business logic for transaction validation
- fix: address minor style inconsistency in header
- fix: patch critical security vulnerability in auth flow
- style: reorganize component structure for better readability
- fix: remove deprecated legacy code
- feat: add input validation for user registration form
- fix: resolve failing tests in CI pipeline
- feat: implement analytics tracking for user engagement
- fix: strengthen authentication password requirements
- feat: improve form accessibility for screen readers

Ejemplo de secuencia de commits:
- feat: agregar sistema de autenticación de usuario
- fix: resolver fuga de memoria en proceso de renderizado  
- docs: actualizar documentación de API con nuevos endpoints
- refactor: simplificar lógica de manejo de errores en parser
- fix: resolver advertencias de linter en archivos de componentes
- test: agregar pruebas unitarias para flujo de autenticación

## Referencia: Nombres de Rama

Al generar nombres de rama sugeridos, usa este formato:
- Formato: `<tipo>/<descripcion-corta>` en kebab-case
- Mantener descripción bajo 30-40 caracteres
- Usar solo minúsculas, números y guiones
- Ser descriptivo pero conciso

Ejemplos de nombres de rama:
- feat/add-user-auth
- fix/memory-leak-render
- docs/api-new-endpoints
- refactor/error-handling
- fix/linter-warnings
- test/auth-flow-tests
- feat/input-validation
- fix/ci-pipeline-tests
- feat/analytics-tracking
- fix/password-requirements
- feat/form-accessibility

## Notas de Comportamiento del Agente

- **IMPORTANTE**: Generar AMBOS elementos: mensaje de commit y nombre de rama sugerido, claramente etiquetados
- **Idioma**: Siempre en inglés tanto el commit como el nombre de rama
- **Manejo de errores**: Si la validación falla, dar al usuario opción de proceder o arreglar problemas primero  
- **Calidad**: Asegurar que mensaje de commit y nombre de rama sean claros, concisos y sigan formato convencional
