return {
  {
    "ThePrimeagen/vim-be-good",
  },

  {
    "eandrju/cellular-automaton.nvim",
    lazy = true,
    keys = {
      { "<leader>mkr", "<cmd>CellularAutomaton make_it_rain<CR>", mode = "n", { desc = "Make it rain" } },
      { "<leader>mgl", "<cmd>CellularAutomaton game_of_life<CR>", mode = "n", { desc = "Game of life" } },
      { "<leader>fmc", "<cmd>CellularAutomaton scramble<CR>", mode = "n", { desc = "F*ck my code" } },
    },
  },
  {
    "NStefan002/speedtyper.nvim",
    cmd = "Speedtyper",
    opts = {},
    lazy = true,
  },
  -- {
  --   "NStefan002/donut.nvim",
  --   version = "*",
  --   lazy = false,
  -- },
}
