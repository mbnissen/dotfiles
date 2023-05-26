vim.g.mapleader = " "

vim.keymap.set("n", "<C-d>", "<n-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- fetch keymap
local map = vim.api.nvim_set_keymap

map('n', '<C-n>', ':NvimTreeToggle<CR>', {})
map('n', '<leader>ci', ':TypescriptAddMissingImports<CR>', {noremap=true})
map('n', '<leader>ca', ':TypescriptFixAll<CR>', {noremap=true})
