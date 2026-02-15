-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","
vim.api.nvim_set_keymap("i", "jj", "<ESC>", { noremap = true, silent = true, desc = "Exit Insert Mode" })

-- Terminal mode mappings
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
vim.keymap.set("t", "jj", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Save file
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", { desc = "Save file" })

-- Window Navigation Mappings
-- Move to the top window
vim.keymap.set("n", "<leader>th", "<C-w>t<C-w>H", { desc = "Move window to top/left" })
-- Move to the bottom window
vim.keymap.set("n", "<leader>tk", "<C-w>t<C-w>K", { desc = "Move window to bottom/right" })

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "th", ":tabfirst<CR>", opts)
vim.api.nvim_set_keymap("n", "tj", ":tabnext<CR>", opts)
vim.api.nvim_set_keymap("n", "tk", ":tabprev<CR>", opts)
vim.api.nvim_set_keymap("n", "tl", ":tablast<CR>", opts)
vim.api.nvim_set_keymap("n", "td", ":tabclose<CR>", opts)
