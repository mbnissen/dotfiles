# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a Neovim configuration built on [LazyVim](https://lazyvim.github.io/) (a Neovim distro using lazy.nvim as the plugin manager). All configuration is in Lua.

## Architecture

- `init.lua` — Entry point, loads `config.lazy`
- `lua/config/lazy.lua` — Bootstraps lazy.nvim and sets up LazyVim with plugin specs from `lua/plugins/`
- `lua/config/options.lua` — Custom Neovim options (loaded before plugins)
- `lua/config/keymaps.lua` — Custom keymaps (loaded on VeryLazy event)
- `lua/config/autocmds.lua` — Custom autocommands (loaded on VeryLazy event)
- `lua/plugins/*.lua` — Plugin specs; every file here is auto-loaded by lazy.nvim
- `snippets/` — LuaSnip snippet files (javascript, typescript, markdown)

## Enabled LazyVim Extras

Configured in `lazyvim.json`: luasnip, nvim-cmp, docker, elixir, json, markdown, typescript.

## Customizations (in `lua/plugins/core.lua`)

- Colorscheme: **gruvbox** (via `ellisonleao/gruvbox.nvim`)
- Telescope: horizontal layout, ascending sort, `<C-p>` mapped to file finder, `<leader>fp` browses plugin files

## Formatting

Lua files are formatted with [StyLua](https://github.com/JohnnyMorganz/StyLua) — 2-space indent, 120 column width (see `stylua.toml`).

## Adding Plugins

Create or edit a file in `lua/plugins/`. Return a table of lazy.nvim plugin specs. To override a LazyVim default, use the same plugin name and merge opts. See `lua/plugins/example.lua` for patterns (disabled by default via early return).
