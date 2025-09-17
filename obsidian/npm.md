---
id: npm
aliases: []
tags:
  - npm
  - monorepo
  - packages
  - development
  - pnpm
---

# NPM and Package Management

## TIPS Monorepo
- npm run build:watch -w crossword
- npm i -D postcss autoprefixer -w crossword

### Only root package.json
ncu -i --format group
### workspace
ncu -i --format group --workspace=crossword

### Publicar npm packages.
- Si se usa pnpm, publicar con pnpm.
- pnpm publish --> Hace cosas diferentes a npm publish

### Link local project
- necesita "link" y apuntar al dist
```js
"payload-plugin-masquerade": "link:../../home/manuel/Desarrollo/opensource/payload-plugin-masquerade/dist",
```

## pnpm Workspaces y Monorepos

pnpm tiene soporte nativo para workspaces (monorepos) a través de su estructura de `pnpm-workspace.yaml`.

### Configuración básica

1. Crear archivo `pnpm-workspace.yaml` en la raíz:
```yaml
packages:
  - 'packages/*'
  - 'apps/*'
  - '!**/test/**'
```

2. O en `package.json`:
```json
{
  "workspaces": [
    "packages/*",
    "apps/*"
  ]
}
```

### Características clave

#### 1. **Almacenamiento eficiente**
- Las dependencias se guardan en un store global
- Se usa hard linking para evitar duplicados
- Mucho más eficiente en disco que npm/yarn

#### 2. **Estricto control de dependencias**
- Solo puedes usar lo que declaras
- Evita dependencias fantasmas
- Mejor consistencia entre paquetes

#### 3. **Comandos de workspace**

```bash
# Instalar en workspace específico
pnpm add lodash --filter my-app

# Instalar en todos los workspaces
pnpm add typescript -r

# Ejecutar script en workspace específico
pnpm run build --filter my-app

# Ejecutar script en todos los workspaces
pnpm run build -r
```

#### 4. **Dependencias internas**

```json
// packages/app/package.json
{
  "dependencies": {
    "@my-monorepo/ui": "workspace:*"
  }
}
```

#### 5. **Protocolos de workspace**

```json
{
  "dependencies": {
    "@my-monorepo/utils": "workspace:*",           // Última versión
    "@my-monorepo/utils": "workspace:^1.0.0",      // Compatible con 1.x
    "@my-monorepo/utils": "workspace:~1.0.0",      // Compatible con 1.0.x
    "@my-monorepo/utils": "workspace:1.0.0"       // Exacta
  }
}
```

### Ejemplo práctico

```
my-monorepo/
├── pnpm-workspace.yaml
├── package.json
├── packages/
│   ├── ui/
│   │   ├── package.json
│   │   └── src/
│   └── utils/
│       ├── package.json
│       └── src/
└── apps/
    ├── web/
    │   ├── package.json
    │   └── src/
    └── mobile/
        ├── package.json
        └── src/
```

### Comandos útiles

```bash
# Ver estructura de workspaces
pnpm ls --depth=-1

# Filtrar por patrón
pnpm run build --filter "./packages/*"

# Instalar dependencia en múltiples workspaces
pnpm add jest --filter my-app --filter my-lib

# Actualizar dependencias internas
pnpm update --interactive --recursive
```

### Ventajas sobre otras soluciones

1. **Velocidad**: Más rápido que npm/yarn workspaces
2. **Espacio**: Usa symlinks y store global
3. **Consistencia**: Estructura de node_modules más predecible
4. **Seguridad**: No permite hoisting inesperado
5. **Lockfile**: Único lockfile para todo el monorepo
