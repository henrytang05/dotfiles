require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

local opts = { noremap = true, silent = true }
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("n", "<leader>qq", "<cmd>qall<CR>", { desc = "Escape all" })

-- Select all

map("n", "J", "5j", { desc = "Move down 5 lines", noremap = true })
map("n", "L", "<cmd>bnext<CR>", { desc = "Next buffer", noremap = true })
map("n", "H", "<cmd>bprev<CR>", { desc = "Previous buffer", noremap = true })

map("n", "<C-d>", "5j", { desc = "Move down 5 lines", noremap = true })
map("n", "<C-u>", "5k", { desc = "Move up 5 lines", noremap = true })

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- better register behavior
map("n", "x", '"_x', opts)
map("n", "c", '"_c', opts)

map("o", "iq", 'i"', opts)
map("o", "aq", 'a"', opts)

map("o", "iQ", "i'", opts)
map("o", "aQ", "a'", opts)

-- insert semicolon at the end

map("n", "Q", "<nop>")
map("n", "U", "<nop>")
map("n", "<BS>", "<nop>")
map("n", "<C-s>", "<nop>")

-- resize windows
map("n", "<leader>=", "<C-w>=")
map("n", "<C-Right>", ":vertical resize -3<CR>", opts)
map("n", "<C-Left>", ":vertical resize +3<CR>", opts)
map("n", "<C-Up>", ":resize +3<CR>", opts)
map("n", "<C-Down>", ":resize -3<CR>", opts)

map("n", "<leader>|", "<C-w>|", { desc = "Maximize window", silent = true })
map("n", "<leader>-", "<C-w>-", { desc = "Maximize window", silent = true })

map("n", "<leader>tv", "<C-w>t<C-w>K")

map("n", "B", "^")
map("n", "E", "$")

map("o", "B", "^")
map("o", "E", "$")

map("i", "<C-j>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
  noremap = true,
  silent = true,
})
vim.g.copilot_no_tab_map = true
-- vim.b.copilot_enabled = true
map("i", "<C-H>", "<C-W>", { noremap = true })
map("v", "<leader>cs", "<cmd>CodeSnap<CR>", { desc = "Code Snap" })

-- oil.nvim
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- subsitute nvim
map("n", "s", require("substitute").operator, { noremap = true })
map("n", "ss", require("substitute").line, { noremap = true })
map("n", "S", require("substitute").eol, { noremap = true })
map("x", "s", require("substitute").visual, { noremap = true })

map("n", "sx", require("substitute.exchange").operator, { noremap = true, silent = true })
map("n", "sxx", require("substitute.exchange").line, { noremap = true, silent = true })
map("x", "X", require("substitute.exchange").visual, { noremap = true, silent = true })
map("n", "sxc", require("substitute.exchange").cancel, { noremap = true, silent = true })

-- vim.cmd([[SmoothCursorFancyOn]])

vim.keymap.set("n", "<leader><leader>", function()
  require("telescope").extensions.smart_open.smart_open()
end, { noremap = true, silent = true })
  vim.keymap.set("x", "<leader>rc", ":SnipRun<CR>", { noremap = true, silent = true, desc = "Run code" })
