-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "gj", "5j", { desc = "Move down 5 lines", noremap = true })
keymap.set("n", "gk", "5k", { desc = "Move up 5 lines", noremap = true })
keymap.set("n", "J", "5j", { desc = "Move down 5 lines", noremap = true })
keymap.set("n", "M", "5k", { desc = "Move up 5 lines", noremap = true })
keymap.set("n", "L", "<cmd>bnext<CR>", { desc = "Next buffer", noremap = true })
keymap.set("n", "H", "<cmd>bprev<CR>", { desc = "Previous buffer", noremap = true })
-- terminal
keymap.set("n", "<leader>`", ":20sp|term<CR>", opts)

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move down 5 lines", noremap = true })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move up 5 lines", noremap = true })

keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- better register behavior
keymap.set("n", "x", '"_x', opts)
keymap.set("n", "c", '"_c', opts)

keymap.set("n", "Q", "<nop>")
keymap.set("n", "U", "<nop>")
keymap.set("n", "<BS>", "<nop>")
keymap.set("n", "<C-s>", "<nop>")

-- resize windows
keymap.set("n", "<leader>=", "<C-w>=")
keymap.set("n", "<C-Right>", ":vertical resize -3<CR>", opts)
keymap.set("n", "<C-Left>", ":vertical resize +3<CR>", opts)
keymap.set("n", "<C-Up>", ":resize +3<CR>", opts)
keymap.set("n", "<C-Down>", ":resize -3<CR>", opts)

keymap.set("n", "<leader>|", "<C-w>|", { desc = "Maximize window", silent = true })
keymap.set("n", "<leader>-", "<C-w>-", { desc = "Maximize window", silent = true })

keymap.set("n", "<leader>th", "<C-w>t<C-w>H")
keymap.set("n", "<leader>tv", "<C-w>t<C-w>K")

keymap.set("n", "B", "^")
keymap.set("n", "E", "$")

keymap.set("o", "B", "^")
keymap.set("o", "E", "$")

vim.keymap.set("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
  noremap = true,
  silent = true,
})
vim.g.copilot_no_tab_map = true
-- vim.b.copilot_enabled = true
keymap.set("i", "<C-H>", "<C-W>", { noremap = true })