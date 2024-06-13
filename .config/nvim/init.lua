-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("plugins.nice_to_have")
require("plugins.ui")
require("plugins.quality_of_life")

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  --
  vim.print(vim.g.neovide_version)

  vim.o.guifont = "Maple Mono NF:h12:b:i" -- text below applies for VimScript

  vim.g.neovide_scale_factor = 0.8

  vim.g.neovide_text_gamma = 0.0
  vim.g.neovide_text_contrast = 0.5
  vim.g.neovide_transparency = 0.6

  vim.g.neovide_window_blurred = true

  vim.g.neovide_floating_blur_amount_x = 2.0
  vim.g.neovide_floating_blur_amount_y = 2.0

  vim.g.neovide_floating_shadow = true
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 5

  vim.g.neovide_hide_mouse_when_typing = true

  vim.g.neovide_theme = "auto"

  vim.g.neovide_refresh_rate = 60

  vim.g.neovide_confirm_quit = true

  vim.g.neovide_remember_window_size = true

  vim.g.neovide_cursor_vfx_mode = "railgun"

  -- vim.g.neovide_cursor_vfx_mode = "ripple"
end

-- require("largefile")
