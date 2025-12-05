# Agent Guidelines for Dotfiles Repository

## Build/Lint/Test Commands
- **Format**: `cd lazyvim/.config/lazyvim && stylua .` (Lua: 2 spaces, 120 columns)
- **Lint**: `cd lazyvim/.config/lazyvim && nvim --headless -c "lua vim.cmd('quitall!')"` (syntax validation)
- **Test**: No test framework; validate configs with `cd lazyvim/.config/lazyvim && nvim --headless -c "lua require('config.lazy')"`
- **Single test**: N/A (configuration repository)

## Code Style Guidelines

### Imports
- Use `require()` for modules, prefer local variables: `local plugin = require("plugin.name")`
- Group requires at top of file

### Formatting
- **Indentation**: 2 spaces (stylua enforced)
- **Line length**: 120 characters max
- **Tables**: Trailing commas for multi-line tables

### Naming Conventions
- **Variables/Functions**: snake_case (`local my_variable`, `function setup_plugin()`)
- **Files**: kebab-case for plugins (`file-name.lua`)
- **Directories**: lowercase with hyphens

### Error Handling
- Use `pcall()` for potentially failing operations
- Return early on errors: `if not ok then return end`

### Plugin Configuration Pattern
```lua
return {
  "plugin/name",
  opts = { /* config */ },
}
```</content>
<parameter name="filePath">AGENTS.md