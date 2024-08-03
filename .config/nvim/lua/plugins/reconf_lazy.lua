return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 10000,
    },
  },
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
    opts = {
      jump = {
        -- automatically jump when there is only one match
        autojump = true,
      },
      modes = {
        char = {
          autohide = true,
          jump_labels = true,
          multi_line = false,
          jump = {
            autojump = true,
          },
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
}
