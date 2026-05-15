---
descripción: Generar nombre de rama y mensaje de commit
model: "opencode-go/deepseek-v4-flash"
---

# Commit

Analiza los cambios en git y devuelve ÚNICAMENTE dos líneas: la rama y el mensaje de commit. Sin explicaciones, sin notas, sin etiquetas, sin output adicional.

## Flujo

1. Ejecutar `git status --porcelain`
2. Ejecutar `git diff --cached` (o `git diff` si no hay staging)
3. Analizar los cambios para determinar tipo y propósito
4. Devolver SOLO dos líneas en este formato exacto:

```
feat/add-user-auth
feat: add user authentication system
```

## Tipos válidos

feat | fix | docs | style | refactor | perf | test | chore

## Reglas

- Idioma: inglés
- Descripción del commit: concisa, modo imperativo, bajo 72 caracteres
- Rama: minúsculas, kebab-case, bajo 40 caracteres
- Sin output adicional de ningún tipo
