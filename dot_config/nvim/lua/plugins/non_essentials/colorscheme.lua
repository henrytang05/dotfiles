return {
  {
    "https://gitlab.com/__tpb/monokai-pro.nvim",
    opts = {
      transparent_background = true,
    },
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
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
    name = "catppuccin",
    priority = 1100, -- Ensure it loads first
    opts = {
      transparent_background = true,
    },
  },

  {
    "navarasu/onedark.nvim",

    priority = 1000, -- Ensure it loads first
    opts = {
      styles = "darker",
      transparent = true,
    },
  },
  {
    "Mofiqul/dracula.nvim",

    priority = 1000, -- Ensure it loads first
    opts = {
      transparent_bg = true,
    },
  },

  {
    "loctvl842/monokai-pro.nvim",
    lazy = true,
    opts = {
      transparent_background = true,
    },
  },

  { "cpea2506/one_monokai.nvim", lazy = true, opts = {
    transparent = true,
  } },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
