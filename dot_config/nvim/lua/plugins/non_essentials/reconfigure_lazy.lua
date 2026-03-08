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
        "<F9>",
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
        "query",
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "embedded_template",
        -- "markdown_inline",
        "python",
        "regex",
        "vim",
        "yaml",
      },
    },
  },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true,
          },
        },
      },
      indent = { enabled = false },
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
        "<C-t>",
        function()
          Snacks.terminal.toggle(nil, {
            win = {
              width = 0.6,
              border = "rounded",
              height = 0.5,
              position = "float",
              backdrop = 60,
              title = "Floating terminal🛟",
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
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        mode = "tabs",
        show_tab_indicators = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      sources = {
        default = { "dadbod" },
        providers = {
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
      },
    },
    dependencies = {
      "kristijanhusak/vim-dadbod-completion",
    },
  },
  {
    "gbprod/yanky.nvim",
    dependencies = { "folke/snacks.nvim" },
    keys = {
      {
        "<leader>p",
        function()
          Snacks.picker.yanky()
        end,
        mode = { "n", "x" },
        desc = "Open Yank History",
      },
    },
  },
}
