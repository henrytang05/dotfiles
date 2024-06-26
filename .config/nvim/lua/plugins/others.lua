return {
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
  --   lazy = true,
  --   opts = {
  --     ...,
  --   },
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
      { "nvim-telescope/telescope.nvim" },
    },
    config = function()
      require("neoclip").setup({
        history = 1000,
        enable_persistent_history = false,
        length_limit = 1048576,
        continuous_sync = false,
        db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
        filter = nil,
        preview = true,
        prompt = nil,
        default_register = '"',
        default_register_macros = "q",
        enable_macro_history = true,
        content_spec_column = false,
        disable_keycodes_parsing = false,
        on_select = {
          move_to_front = false,
          close_telescope = true,
        },
        on_paste = {
          set_reg = false,
          move_to_front = false,
          close_telescope = true,
        },
        on_replay = {
          set_reg = false,
          move_to_front = false,
          close_telescope = true,
        },
        on_custom_action = {
          close_telescope = true,
        },
        keys = {
          telescope = {
            i = {
              select = "<cr>",
              paste = "<c-j>",
              paste_behind = "<c-k>",
              replay = "<c-q>", -- replay a macro
              delete = "<c-d>", -- delete an entry
              edit = "<c-e>", -- edit an entry
              custom = {},
            },
            n = {
              select = "<cr>",
              paste = "p",
              --- It is possible to map to more than one key.
              -- paste = { 'p', '<c-p>' },
              paste_behind = "P",
              creplay = "q",
              delete = "d",
              edit = "e",
              custom = {},
            },
          },
        },
      })

      vim.keymap.set("n", "<leader>o", "<cmd>Telescope neoclip<CR>", { desc = "Telescope Neoclip" })
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
    "tpope/vim-obsession",
    lazy = true,
  },

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
      disabled_filetypes = { "lazy", "help", "text", "markdown", "dashboard" },
      custom_colorcolumn = {},
      scope = "file",
    },
  },
}
