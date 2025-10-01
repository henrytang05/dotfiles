return {
  {
    "ThePrimeagen/vim-be-good",
  },

  {
    "eandrju/cellular-automaton.nvim",
    lazy = true,
    keys = {
      { "<leader>mf1", "<cmd>CellularAutomaton make_it_rain<CR>", mode = "n", desc = "Make it rain" },
      { "<leader>mf2", "<cmd>CellularAutomaton game_of_life<CR>", mode = "n", desc = "Game of life" },
      { "<leader>mf3", "<cmd>CellularAutomaton scramble<CR>", mode = "n", desc = "F*ck my code" },
    },
  },
  -- {
  --   "NStefan002/donut.nvim",
  --   version = "*",
  --   lazy = false,
  -- },
}
