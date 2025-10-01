-- [codesnap, sniprun, spider, scratch]
return {
  -- NOTE: CodeSnap
  {
    "mistricky/codesnap.nvim",
    build = "make",
    opts = {
      has_breadcrumbs = true,
      watermark = "Henry Tăng",
      has_line_number = true,
      bg_theme = "sea",
      -- bg_padding = 0,
    },
    keys = {
      { "<leader>cs", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
      -- { "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures" },
    },
  },

  -- NOTE: SnipRun
  {
    "michaelb/sniprun",
    branch = "master",
    event = "VeryLazy",

    build = "sh install.sh",
    -- do 'sh install.sh 1' if you want to force compile locally
    -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

    config = function()
      require("sniprun").setup({
        -- your options
      })
      vim.keymap.set("x", "<leader>rc", ":SnipRun<CR>", { noremap = true, silent = true, desc = "Run code" })
      vim.keymap.set("n", "<leader>rac", "vag:SnipRun<CR>`.", { remap = true, silent = true, desc = "Run all code" })
    end,
  },

  -- NOTE: Spider
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    config = function()
      require("spider").setup({
        skipInsignificantPunctuation = false,
        subwordMovement = true,
        customPatterns = {},
      })
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

  -- NOTE: Scratch
  {
    "LintaoAmons/scratch.nvim",
    tag = "v0.13.2",
    lazy = true,
    event = "VeryLazy",
    keys = {
      { "<leader>tc", "<cmd>Scratch<CR>", { silent = true, noremap = true, desc = "Open Scratch" } },
    },
  },
}
