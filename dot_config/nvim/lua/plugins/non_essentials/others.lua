return {

  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
  },
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { "ibhagwan/fzf-lua", "kkharji/sqlite.lua", module = "sqlite" },
    },
    opts = {
      keys = {
        fzf = {
          select = "default",
          paste = "<cr>",
          paste_behind = "ctrl-k",
          custom = {},
        },
      },
    },
    config = function()
      vim.keymap.set("n", "<leader>op", function()
        require("neoclip.fzf")()
      end, { desc = "Neoclip" })
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",

    dependencies = { "HiPhish/rainbow-delimiters.nvim" },

    main = "ibl",
    config = function()
      -- local highlight = {
      --   "CursorColumn",
      --   "Whitespace",
      -- }
      require("ibl").setup({
        -- indent = { highlight = highlight, char = "" },
        -- whitespace = {
        --   highlight = highlight,
        --   remove_blankline_trail = false,
        -- },
        scope = { enabled = false },
      })
      -- local highlight = {
      --   "RainbowRed",
      --   "RainbowYellow",
      --   "RainbowBlue",
      --   "RainbowOrange",
      --   "RainbowGreen",
      --   "RainbowViolet",
      --   "RainbowCyan",
      -- }
      --
      -- local hooks = require("ibl.hooks")
      -- -- create the highlight groups in the highlight setup hook, so they are reset
      -- -- every time the colorscheme changes
      -- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      --   vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
      --   vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
      --   vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
      --   vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      --   vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
      --   vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
      --   vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      -- end)
      --
      -- require("ibl").setup({
      --   indent = {
      --     highlight = highlight,
      --   },
      --
      --   -- scope = { enabled = false },
      -- })
    end,
  },

  {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    opts = {},
  },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = "80",
      disabled_filetypes = { "lazy", "help", "text", "markdown", "snacks_dashboard", "leetcode.nvim" },
      custom_colorcolumn = {},
      scope = "file",
    },
  },

  {
    "chrisgrieser/nvim-scissors",

    opts = {
      -- snippetDir = "~/.config/nvim/snippets",
    },
  },
  -- {
  --   "abecodes/tabout.nvim",
  --   lazy = false,
  --   config = function()
  --     require("tabout").setup({
  --       tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
  --       backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
  --       act_as_tab = true, -- shift content if tab out is not possible
  --       act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
  --       default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
  --       default_shift_tab = "<C-d>", -- reverse shift default action,
  --       enable_backwards = true, -- well ...
  --       completion = false, -- if the tabkey is used in a completion pum
  --       tabouts = {
  --         { open = "'", close = "'" },
  --         { open = '"', close = '"' },
  --         { open = "`", close = "`" },
  --         { open = "(", close = ")" },
  --         { open = "[", close = "]" },
  --         { open = "{", close = "}" },
  --         { open = "<", close = ">" },
  --       },
  --       ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
  --       exclude = {}, -- tabout will ignore these filetypes
  --     })
  --   end,
  --   event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
  -- },
  -- { "artemave/workspace-diagnostics.nvim" },
  -- {
  --   "HiPhish/rainbow-delimiters.nvim",
  --   config = function()
  --     require("rainbow-delimiters.setup").setup({
  --       strategy = {
  --         -- ...
  --       },
  --       query = {
  --         -- ...
  --       },
  --       highlight = {
  --         "RainbowDelimiterOrange",
  --         "RainbowDelimiterYellow",
  --         "RainbowDelimiterGreen",
  --         "RainbowDelimiterCyan",
  --         "RainbowDelimiterBlue",
  --         "RainbowDelimiterViolet",
  --         -- "RainbowDelimiterRed",
  --       },
  --     })
  --   end,
  -- }
  { "vimpostor/vim-lumen" },

  {
    "github/copilot.vim",
  },
}
