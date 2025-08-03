# Agent Guidelines for LazyVim Configuration

## Build/Lint/Test Commands
- **Format**: `stylua .` (Lua formatting using stylua.toml config: 2 spaces, 120 columns)
- **Lint**: No specific linter configured; rely on lua_ls LSP for validation
- **Test**: No test framework configured; this is a Neovim configuration repository
- **Check config**: `nvim --headless -c "lua vim.cmd('quitall!')"` to validate syntax

## Code Style Guidelines

### Imports
- Use `require()` for dependencies, prefer local variables for modules
- Group requires at top of file: `local plugin = require("plugin.name")`

### Formatting
- **Indentation**: 2 spaces (enforced by stylua)
- **Line length**: 120 characters max
- **Tables**: Trailing commas preferred for multi-line tables

### Naming Conventions
- **Variables**: snake_case (`local my_variable`)
- **Functions**: snake_case (`local function setup_plugin()`)
- **Files**: kebab-case for plugin files (`file-name.lua`)

### Error Handling
- Use `pcall()` for potentially failing operations
- Return early on errors: `if not ok then return end`

### Plugin Configuration Pattern
```lua
return {
  "plugin/name",
  opts = {
    -- configuration here
  },
}
```