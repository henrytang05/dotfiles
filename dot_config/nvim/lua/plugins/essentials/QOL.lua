-- [surround, subsitute, vim-tmux, undotree, oil]
return {
  -- NOTE: Surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    cond = function()
      return vim.bo.filetype ~= "sql"
    end,
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  -- NOTE:: Subsitute

  {
    "gbprod/substitute.nvim",
    config = function()
      require("substitute").setup()
      -- subsitute nvim
      vim.keymap.set("n", "s", require("substitute").operator, { noremap = true })
      vim.keymap.set("n", "ss", require("substitute").line, { noremap = true })
      vim.keymap.set("n", "S", require("substitute").eol, { noremap = true })
      vim.keymap.set("x", "s", require("substitute").visual, { noremap = true })

      vim.keymap.set("n", "sx", require("substitute.exchange").operator, { noremap = true, silent = true })
      vim.keymap.set("n", "sxx", require("substitute.exchange").line, { noremap = true, silent = true })
      vim.keymap.set("x", "X", require("substitute.exchange").visual, { noremap = true, silent = true })
      vim.keymap.set("n", "sxc", require("substitute.exchange").cancel, { noremap = true, silent = true })
    end,
  },

  -- NOTE: Vim-tmux
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },

  -- NOTE: Undotree
  {
    "mbbill/undotree",
    config = function()
      vim.g.undotree_WindowLayout = 1
    end,
    keys = {
      { "<leader>uu", "<cmd>UndotreeToggle<CR>", { silent = true, remap = true, desc = "Undo Tree" } },
    },
  },
  -- NOTE: Oil
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      keymaps = {
        ["<C-v>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
        ["<C-s>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
        ["q"] = { "actions.close", mode = "n" },
        ["<C-h>"] = false,
        ["<C-l>"] = false,
        ["<C-j>"] = false,
        ["<C-k>"] = false,
      },
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      prompt_save_on_select_new_entry = false,
      cleanup_delay_ms = 2000,
      autosave_changes = false,
      watch_for_changes = true,
      view_options = {
        show_hidden = true,
      },
      float = {
        max_height = 20,
        max_width = 60,
      },
    },

    keys = {
      { "+", "<CMD>Oil<CR>", desc = "Open parent directory" },
      {
        "-",
        function()
          require("oil").toggle_float()
        end,
        desc = "Open parent directory",
      },
    },
  },
}
