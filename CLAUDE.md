# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository organized using GNU Stow. Each top-level directory represents a tool/application, with configurations stored in a structure that mirrors their target locations (e.g., `tool/.config/tool/`).

The primary development environment consists of:
- **Editor**: Neovim with LazyVim framework
- **Shell**: Zsh with Oh My Zsh
- **Terminal**: Kitty/Ghostty/Wezterm (multi-emulator support)
- **Language**: Node.js managed via fnm (v24.11.1)
- **Git UI**: LazyGit
- **Browser automation**: Vimium/Surfingkeys

## Common Commands

### LazyVim (Neovim Configuration)
```bash
# Format Lua files
cd lazyvim/.config/lazyvim && stylua .

# Validate syntax
cd lazyvim/.config/lazyvim && nvim --headless -c "lua vim.cmd('quitall!')"

# Test plugin loading
cd lazyvim/.config/lazyvim && nvim --headless -c "lua require('config.lazy')"
```

### System Setup (Ubuntu/Debian)
```bash
# Run full system bootstrap
bash scripts/brew.sh
```

### Stow (Configuration Management)
```bash
# Preview symlinks (dry run)
stow -nv <directory>

# Create symlinks
stow <directory>
```

## Architecture

### Directory Organization

Most tools follow the pattern `tool-name/.config/tool-name/`:
- `lazyvim/.config/lazyvim/` - Neovim configuration (Lua)
- `kitty/.config/kitty/` - Kitty terminal emulator
- `ghostty/.config/ghostty/` - Ghostty terminal emulator
- `wezterm/.config/wezterm/` - Wezterm terminal (Lua)
- `starship/.config/starship.toml` - Shell prompt
- `lazygit/.config/lazygit/` - Git UI
- `rofi/.config/rofi/` - Application launcher

Some tools place configs directly in their directory:
- `zsh/.zshrc` - Shell configuration
- `tmux/.tmux.conf` - Terminal multiplexer

### LazyVim Configuration Structure

The LazyVim config is modular:
- `lua/config/` - Core configuration files (autocmds, keymaps, options, lazy loading)
- `lua/plugins/` - Plugin specifications (each file is a separate plugin config)

Plugin configuration pattern:
```lua
return {
  "plugin/name",
  opts = { /* config */ },
}
```

### Neovim App Switching

The config supports multiple Neovim configurations via `NVIM_APPNAME`:
```bash
NVIM_APPNAME=lazyvim nvim
```

### Node.js Version Management

fnm is used for Node.js version management. Version 24.11.1 is the default.

## Code Style (Lua)

- **Indentation**: 2 spaces (enforced by stylua)
- **Line length**: 120 characters max
- **Variables/Functions**: `snake_case`
- **Plugin files**: `kebab-case`
- **Tables**: Trailing commas for multi-line tables

## Key Integrations

### AutoKey
Desktop automation scripts in `autokey/` (Python-based) for custom keybindings.

### Dygma Raise
Keyboard configuration backups stored in `dygma/Dygma/Backups/Raise2/`.
