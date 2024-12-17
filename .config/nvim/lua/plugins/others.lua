return {

  -- {
  --   "olrtg/nvim-emmet",
  --   config = function()
  --     vim.keymap.set({ "n", "v" }, "<leader>xe", require("nvim-emmet").wrap_with_abbreviation)
  --   end,
  -- },
  -- {
  --   "smoka7/multicursors.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "smoka7/hydra.nvim",
  --   },
  --   opts = {},
  --   cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
  --   keys = {
  --     {
  --       mode = { "v", "n" },
  --       "<Leader>mc",
  --       "<cmd>MCstart<cr>",
  --       desc = "Create a selection for selected text or word under the cursor",
  --     },
  --   },
  -- },
  -- {
  --   "tzachar/highlight-undo.nvim",
  --   opts = {},
  -- },
  { -- color previews & color picker
    "uga-rosa/ccc.nvim",
    lazy = true,
    keys = {
      { "g#", vim.cmd.CccPick, desc = " Color Picker" },
    },
    ft = { "css", "scss", "sh", "lua" },
    config = function()
      vim.opt.termguicolors = true
      local ccc = require("ccc")
      ccc.setup({
        win_opts = { border = vim.g.borderStyle },
        highlighter = {
          auto_enable = true,
          max_byte = 1.5 * 1024 * 1024, -- 1.5 Mb
          lsp = true,
          filetypes = { "css", "scss", "sh", "lua" },
        },
        pickers = {
          ccc.picker.hex,
          ccc.picker.css_rgb,
          ccc.picker.css_hsl,
          ccc.picker.ansi_escape({ meaning1 = "bright" }),
        },
        alpha_show = "hide", -- needed when highlighter.lsp is set to true
        recognize = { output = true },
        inputs = { ccc.input.rgb },
        outputs = {
          ccc.output.hex,
          ccc.output.css_rgb,
          ccc.output.css_hsl,
        },
        mappings = {
          ["<Esc>"] = ccc.mapping.quit,
          ["q"] = ccc.mapping.quit,
          ["L"] = ccc.mapping.increase10,
          ["H"] = ccc.mapping.decrease10,
          ["o"] = ccc.mapping.toggle_output_mode, -- = convert color
        },
      })
    end,
  },
  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
  },
  {
    "AckslD/nvim-neoclip.lua",
    dependencies = {
      { "ibhagwan/fzf-lua" },
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
      vim.keymap.set("n", "<leader>op", "<cmd>Telescope neoclip<CR>", { desc = "Telescope Neoclip" })
    end,
  },
  {
    "RishabhRD/nvim-cheat.sh",
    dependencies = {
      "RishabhRD/popfix",
    },
  },
  -- init.lua

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",

    dependencies = { "HiPhish/rainbow-delimiters.nvim" },

    main = "ibl",
    config = function()
      local highlight = {
        "RainbowOrange",
        "RainbowYellow",
        "RainbowGreen",
        "RainbowCyan",
        "RainbowBlue",
        "RainbowViolet",
        "RainbowRed",
      }
      local hooks = require("ibl.hooks")
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup({ scope = { highlight = highlight, show_start = false, show_end = false } })

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },

  {
    "Aasim-A/scrollEOF.nvim",
    event = "BufRead",
    config = function()
      require("scrollEOF").setup()
    end,
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
    dependencies = { "ibhagwan/fzf-lua", "garymjr/nvim-snippets", "echasnovski/mini.pairs" },
    opts = {
      -- snippetDir = "~/.config/nvim/snippets",
    },
  },
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
}
