return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          init_options = {
            -- fallbackFlags = { "-std=c++20" },
          },
        },
      },
      setup = {
        clangd = function(_, opts)
          opts.capabilities.offsetEncoding = { "utf-16" }
        end,
      },
    },
  },
}
