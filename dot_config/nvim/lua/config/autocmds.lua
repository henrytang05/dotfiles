-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- -- Add any additional autocmds here
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General Settings
local general = augroup("General Settings", { clear = true })

autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
  group = general,
  desc = "Disable New Line Comment",
})

-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = { "*", "!*.dbout", "!*.tex" },
--   callback = function()
--     -- Convert tabs to spaces (optional, adjust tabstop as needed)
--     vim.cmd([[
--              retab!
--          ]])
--   end,
--   desc = "Retab in valid tabs",
-- })

vim.api.nvim_create_user_command("AutoSave", function()
  vim.api.nvim_create_autocmd({ "InsertLeave", "FocusLost" }, {
    pattern = "*",
    command = "silent! write",
  })
end, {})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.ejs",
  callback = function()
    vim.bo.filetype = "html"
  end,
})

function _G.P(tbl)
  print(vim.inspect(tbl))
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "dbui", "sql" },
  callback = function()
    print("FileType autocmd triggered for dbui or sql")
    vim.keymap.set({ "v", "x" }, "<leader>X", "<Plug>(DBUI_ExecuteQuery)", { buffer = true, desc = "DB execute query" })

    -- Map for visual mode (execute selected query)
    vim.keymap.set("v", "<leader>x", "<Plug>(DBUI_ExecuteQuery)", { desc = "Execute selected SQL query" })

    -- Optional: Map for operator-pending mode (if supported)
    vim.keymap.set(
      "x",
      "<leader>x",
      "<Plug>(DBUI_ExecuteQuery)",
      { desc = "Execute selected query in visual-line mode" }
    )

    vim.keymap.set("n", "<leader>rx", "vip<Plug>(DBUI_ExecuteQuery)", { desc = "Run block of query" })
  end,
})

-- vim.api.nvim_create_autocmd("ColorSchemePre", {
--   pattern = "*",
--   callback = function()
--     print("Color changed")
--     vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
--     vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F", bold = true })
--
--     vim.api.nvim_set_hl(0, "LineNr", { fg = "#b10aef", bold = true })
--     vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#b10aef", bold = true })
--     vim.api.nvim_set_hl(0, "HighlightUndo", { fg = "#1796d1", bold = true })
--     vim.api.nvim_set_hl(0, "HighlightRedo", { fg = "#1796d1", bold = true })
--
--     -- vim.api.nvim_set_hl(0, "MatchParen", { bg = "#a8afd0" })
--   end,
-- })

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
    vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F", bold = true })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#b10aef", bold = true })
    vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#b10aef", bold = true })
    vim.api.nvim_set_hl(0, "HighlightUndo", { fg = "#1796d1", bold = true })
    vim.api.nvim_set_hl(0, "HighlightRedo", { fg = "#1796d1", bold = true })
    -- vim.api.nvim_set_hl(0, "MatchParen", { bg = "#a8afd0" })
  end,
})

vim.api.nvim_create_augroup("RemoveCR", { clear = true })

vim.api.nvim_create_autocmd("BufReadPost", {
  group = "RemoveCR",
  pattern = "*",
  command = "silent! %s/\\r//g",
})
