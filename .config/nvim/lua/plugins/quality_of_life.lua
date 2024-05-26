return {
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        -- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
        -- Set to false if you still want to use netrw.
        default_file_explorer = true,
        -- Id is automatically added at the beginning, and name at the end
        -- See :help oil-columns
        columns = {
          "icon",
          -- "permissions",
          -- "size",
          -- "mtime",
        },
        -- Buffer-local options to use for oil buffers
        buf_options = {
          buflisted = true,
          bufhidden = "hide",
        },
        -- Window-local options to use for oil buffers
        win_options = {
          wrap = false,
          signcolumn = "no",
          cursorcolumn = false,
          foldcolumn = "0",
          spell = false,
          list = false,
          conceallevel = 3,
          concealcursor = "nvic",
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        prompt_save_on_select_new_entry = false,
        cleanup_delay_ms = 2000,
        experimental_watch_for_changes = false,
        view_options = {
          show_hidden = true,
        },
      })

      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
    end,
  },

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

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 10000,
    },
  },
  {
    "mfussenegger/nvim-dap",
    keys = {
      {
        "<F10>",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<F5>",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
    },
  },
}
