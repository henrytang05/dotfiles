return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    opts = {
      transparent_background = true,
      integrations = {
        aerial = true,
        alpha = true,
        cmp = true,
        dashboard = true,
        flash = true,
        gitsigns = true,
        headlines = true,
        illuminate = true,
        indent_blankline = { enabled = true },
        leap = true,
        lsp_trouble = true,
        mason = true,
        markdown = true,
        mini = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        navic = { enabled = true, custom_bg = "lualine" },
        neotest = true,
        neotree = true,
        noice = true,
        notify = true,
        semantic_tokens = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
        which_key = true,
      },
    },
  },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first
  },

  {
    "navarasu/onedark.nvim",

    priority = 1000, -- Ensure it loads first
    config = function()
      require("onedark").setup({

        transparent = true,
      })
    end,
  },
  {
    "Mofiqul/dracula.nvim",

    priority = 1000, -- Ensure it loads first
    config = function()
      require("dracula").setup({
        transparent_bg = true,
      })
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        -- Recommended - see "Configuring" below for more config options
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = true,
        terminal_colors = true,
      })

      local colors = require("cyberdream.colors").default
      local cyberdream = require("lualine.themes.cyberdream")
      local copilot_colors = {
        [""] = { fg = colors.grey, bg = colors.none },
        ["Normal"] = { fg = colors.grey, bg = colors.none },
        ["Warning"] = { fg = colors.red, bg = colors.none },
        ["InProgress"] = { fg = colors.yellow, bg = colors.none },
      }
      return {
        options = {
          component_separators = { left = " ", right = " " },
          section_separators = { left = " ", right = " " },
          theme = cyberdream,
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
        },
        sections = {
          lualine_a = { { "mode", icon = "" } },
          lualine_b = { { "branch", icon = "" } },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = " ",
                warn = " ",
                italic_comments = true,
                show_end_of_buffer = true,
                hint = "󰝶 ",
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            {
              "filename",
              symbols = { modified = "  ", readonly = "", unnamed = "" },
            },
            {
              function()
                return require("nvim-navic").get_location()
              end,
              cond = function()
                return package.loaded["nvim-navic"] and require("nvim-navic").is_available()
              end,
              color = { fg = colors.grey, bg = colors.none },
            },
          },
          lualine_x = {
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = { fg = colors.green },
            },
            {
              function()
                local icon = " "
                local status = require("copilot.api").status.data
                return icon .. (status.message or "")
              end,
              cond = function()
                local ok, clients = pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
                return ok and #clients > 0
              end,
              color = function()
                if not package.loaded["copilot"] then
                  return
                end
                local status = require("copilot.api").status.data
                return copilot_colors[status.status] or copilot_colors[""]
              end,
            },
            { "diff" },
          },
          lualine_y = {
            {
              "progress",
            },
            {
              "location",
              color = { fg = colors.cyan, bg = colors.none },
            },
          },
          lualine_z = {
            function()
              return "  " .. os.date("%X") .. " 🚀 "
            end,
          },
        },

        extensions = { "lazy", "toggleterm", "mason", "neo-tree", "trouble" },
      }
    end,
  },
  {
    "EdenEast/nightfox.nvim",

    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
        },
      })
    end,
  },
  {
    "diegoulloao/neofusion.nvim",
    priority = 1000,
    config = true,
    opts = {
      transparent_mode = true,
    },
  },
  { "rose-pine/neovim", name = "rose-pine" },
  { "sam4llis/nvim-tundra" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
