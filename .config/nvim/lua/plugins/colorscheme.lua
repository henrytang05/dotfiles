return {
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

  -- {
  --   "olimorris/onedarkpro.nvim",
  --   priority = 1000, -- Ensure it loads first
  -- },

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
    "EdenEast/nightfox.nvim",
    opts = {
      transparent = true,
    },
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
  -- Using Packer
  { "sainnhe/edge" },

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
      colorscheme = "catppuccin-mocha",
    },
  },
}
