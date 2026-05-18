---
descripción: Generar nombre de rama y mensaje de commit
model: "opencode-go/deepseek-v4-flash"
---

# Commit

Analiza los cambios en git y devuelve ÚNICAMENTE dos líneas: una rama NUEVA sugerida y el mensaje de commit. Sin explicaciones, sin notas, sin etiquetas, sin output adicional.

## Flujo

1. Ejecutar `git status --porcelain`
2. Ejecutar `git diff --cached` (o `git diff` si no hay staging)
3. Ejecutar `git branch --show-current`
4. Analizar los cambios para determinar tipo y propósito
5. Devolver SOLO dos líneas en este formato exacto:

```
feat/add-user-auth
feat: add user authentication system
```

## Tipos válidos

feat | fix | docs | style | refactor | perf | test | chore

## Reglas

- Idioma: inglés
- Descripción del commit: concisa, modo imperativo, bajo 72 caracteres
- Rama: debe ser SIEMPRE una rama NUEVA sugerida, nunca la rama actual
- Rama: nunca devolver `main`, `master`, `develop`, `dev`, `staging`, `production` ni ninguna rama protegida o genérica
- Rama: debe derivarse de los cambios analizados, no del nombre de la rama actual
- Rama: usar formato `<tipo>/<descripción-corta>` donde `<tipo>` sea uno de los tipos válidos
- Rama: minúsculas, kebab-case, bajo 40 caracteres
- Si la rama actual ya parece correcta, aun así proponer una rama nueva más específica; no repetirla
- Si no hay cambios suficientes para inferir propósito, usar `chore/update-workspace` como fallback, nunca `main`
- Sin output adicional de ningún tipo
