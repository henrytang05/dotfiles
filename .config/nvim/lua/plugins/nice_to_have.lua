return {

  {
    "LunarVim/bigfile.nvim",
    event = "BufReadPre",
    opts = {
      pattern = function(bufnr, filesize_mib)
        if filesize_mib > 2 then
          return true
        end
        local file_lines = vim.fn.readfile(vim.api.nvim_buf_get_name(bufnr))
        if #file_lines > 5000 then
          return true
        end
        for _, line in ipairs(file_lines) do
          if #line > 1000 then
            return true
          end
        end
      end,
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
    "mistricky/codesnap.nvim",
    event = "VeryLazy",
    build = "make",
    opts = {
      has_breadcrumbs = true,
      watermark = "Henry Tăng",
    },
    keys = {
      { "<leader>cs", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
      -- { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
  },

  {
    "brenoprata10/nvim-highlight-colors",
    opts = function()
      vim.opt.termguicolors = true

      require("nvim-highlight-colors").setup({})
    end,
  },
  {
    "m4xshen/hardtime.nvim",
    cmd = "HardTime",
    event = "BufEnter",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {
      disabled_filetypes = { "qf", "netrw", "NvimTree", "lazy", "mason", "oil", "json", "undotree" },
      max_count = 10,
      disable_mouse = true,
    },
    keys = {
      { "<leader>mht", "<cmd>Hardtime toggle<CR>", mode = "n" },
    },
  },

  {
    "pocco81/true-zen.nvim",
    event = "VeryLazy",
    opts = {
      integrations = {
        tmux = true,
      },
    },
    config = function(_plugin, opts)
      require("true-zen").setup(opts)
    end,
    keys = {
      {
        "<leader>zn",
        "<cmd>TZNarrow<cr>",
        mode = "n",
        desc = "Narrow focused",
        noremap = true,
      },
      {
        "<leader>zn",
        "<cmd>'<,'>TZNarrow<cr>",
        mode = "v",
        desc = "Ranged narrow focused",
        noremap = true,
      },
      {
        "<leader>zf",
        "<cmd>TZFocus<cr>",
        mode = "n",
        desc = "Focued mode",
        noremap = true,
      },
      {
        "<leader>zm",
        "<cmd>TZMinimalist<cr>",
        mode = "n",
        desc = "Minimalist mode",
        noremap = true,
      },
      {
        "<leader>za",
        "<cmd>TZAtaraxis<cr>",
        mode = "n",
        desc = "Ataraxis mode",
        noremap = true,
      },
    },
  },

  {
    "folke/twilight.nvim",
    event = "VeryLazy",
  },

  {
    "mbbill/undotree",
    keys = {
      { "<leader>uu", "<cmd>UndotreeToggle<CR>", { silent = true, remap = true, desc = "Undo Tree" } },

      { "<leader>e", "<cmd>UndotreeToggle<CR>", { silent = true, remap = true, desc = "Undo Tree" } },
    },
  },

  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    priority = 1200,
    config = function()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guifg = "#fe22ee" },
            InclineNormalNC = { guifg = "#2abf9a" },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
    },
    keys = function()
      local keys = {
        {
          "<leader>H",
          function()
            require("harpoon"):list():add()
          end,
          desc = "Harpoon File",
        },
        {
          "<leader>h",
          function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
          end,
          desc = "Harpoon Quick Menu",
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          "<leader>" .. i,
          function()
            require("harpoon"):list():select(i)
          end,
          desc = "Harpoon to File " .. i,
        })
      end
      return keys
    end,
  },
  {
    "/HiPhish/rainbow-delimiters.nvim",
    config = function()
      require("rainbow-delimiters.setup").setup({
        strategy = {
          -- ...
        },
        query = {
          -- ...
        },
        highlight = {
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
          "RainbowDelimiterRed",
        },
      })
    end,
  },
  {
    "LintaoAmons/scratch.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>tc", "<cmd>Scratch<CR>", { silent = true, noremap = true, desc = "Open Scratch" } },
    },
  },
  {
    "michaelb/sniprun",
    branch = "master",
    evenv = "VeryLazy",

    build = "sh install.sh",
    -- do 'sh install.sh 1' if you want to force compile locally
    -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

    config = function()
      require("sniprun").setup({
        -- your options
      })
      vim.keymap.set("x", "<leader>rc", ":SnipRun<CR>", { noremap = true, silent = true, desc = "Run code" })
    end,
  },

  {
    "chrishrb/gx.nvim",
    keys = { { "gx", "<cmd>Browse<cr>", mode = { "n", "x" } } },
    event = "VeryLazy",
    cmd = { "Browse" },
    init = function()
      vim.g.netrw_nogx = 1 -- disable netrw gx
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true, -- default settings
    submodules = false,
  },
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    config = function()
      require("spider").setup({
        skipInsignificantPunctuation = false,
        subwordMovement = true,
        customPatterns = {},
      })
      vim.keymap.set("i", "<C-f>", "<Esc>l<cmd>lua require('spider').motion('w')<CR>i")
      vim.keymap.set("i", "<C-b>", "<Esc><cmd>lua require('spider').motion('b')<CR>i")
    end,

    keys = {
      {
        "e",
        "<cmd>lua require('spider').motion('e')<CR>",
        mode = { "n", "o", "x" },
        desc = "Spider-e",
      },
      {
        "w",
        "<cmd>lua require('spider').motion('w')<CR>",
        mode = { "n", "o", "x" },
        desc = "Spider-w",
      },
      {
        "b",
        "<cmd>lua require('spider').motion('b')<CR>",
        mode = { "n", "o", "x" },
        desc = "Spider-b",
      },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    vscode = true,
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
  keys = {
        { "s", mode = { "n", "x", "o" }, false},
        { "S", mode = { "n", "o", "x" }, false},
        { "<leader>j", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "<leader>J", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
  },
}
