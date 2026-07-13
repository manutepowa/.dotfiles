---
description: Generar nombre de rama y mensaje de commit
---

# Commit

Analiza los cambios actuales de Git y devuelve ÚNICAMENTE dos líneas:

1. Una rama NUEVA sugerida.
2. Un mensaje de commit.

Ejemplo:

```
feat/add-user-auth
feat: add user authentication system
```

## Flujo

1. Ejecuta `git status --porcelain`.
2. Ejecuta `git diff --cached`; si no hay cambios staged, usa `git diff`.
3. Ejecuta `git branch --show-current`.
4. Analiza los cambios.
5. Devuelve únicamente las dos líneas solicitadas.

## Reglas

- Idioma: inglés.
- Commit imperativo y menor de 72 caracteres.
- Tipos válidos: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `chore`.
- La rama siempre debe ser nueva.
- Formato: `<tipo>/<descripción-corta>`.
- Minúsculas, kebab-case, menos de 40 caracteres.
- Nunca usar `main`, `master`, `develop`, `dev`, `staging` o `production`.
- Si no hay cambios suficientes: `chore/update-workspace`.
- Sin explicaciones ni output adicional.
