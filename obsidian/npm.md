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
