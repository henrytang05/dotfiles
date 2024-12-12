return {
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
        "<F11>",
        function()
          require("dap").step_out()
        end,
        desc = "Step out",
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
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    --   jump = {
    --     -- automatically jump when there is only one match
    --     autojump = true,
    --   },
    -- modes = {
    --   char = {
    --     multi_line = false,
    --   },
    -- },
    -- },
    opts = {
      modes = {
        char = {
          multi_line = false,

          highlight = { backdrop = false },
        },
      },
    },

    keys = {
      { "s", mode = { "n", "x", "o" }, false },
      { "S", mode = { "n", "o", "x" }, false },
      {
        "<leader>j",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "<leader>J",
        mode = { "n", "o", "x" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vimdoc",
        "luadoc",
        "vim",
        "lua",
        "markdown",

        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        -- "markdown_inline",
        "python",
        "query",
        "regex",
        "vim",
        "yaml",
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {

      dashboard = {
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
          {
            text = "",
            pane = 2,
            padding = 5,
          },
          {
            section = "terminal",
            cmd = "pokemon-colorscripts -n giratina --no-title; sleep .1",
            pane = 2,
            indent = 15,
            height = 20,
            align = "center",
          },
        },
      },
    },
    keys = {
      {
        "<C-.>",
        function()
          Snacks.terminal.toggle(nil, {
            win = {
              width = 0.6,
              border = "rounded",
              height = 0.5,
              style = "float",
              keys = {
                q = "hide",
              },
            },
          })
        end,
        mode = { "n", "t" }, -- Works in normal and terminal modes
        desc = "Toggle Scratch Buffer",
      },
    },
  },
}
