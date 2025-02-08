-- vim.opt.colorcolumn = "80"
vim.opt.relativenumber = true
vim.opt.termguicolors = true

local g = vim.g

if g.neovide then
  g.neovide_transparency = 0.8
  -- vim.g.neovide_transparency = 0.0
  g.neovide_refresh_rate = 120
  g.neovide_cursor_vfx_mode = "ripple"
  g.neovide_cursor_animation_length = 0.03
  g.neovide_cursor_trail_size = 0.9
  g.neovide_remember_window_size = true
  vim.g.neovide_scale_factor = 0.7
  vim.g.neovide_window_blurred = 1
  g.neovide_background_color = "#ffffff"
end
