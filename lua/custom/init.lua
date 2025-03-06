-- vim.opt.colorcolumn = "80"
vim.opt.relativenumber = true
vim.opt.termguicolors = true

local g = vim.g

function HighlightedFoldtext()
  local pos = vim.v.foldstart
  local line = vim.api.nvim_buf_get_lines(0, pos - 1, pos, false)[1]
  local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
  local parser = vim.treesitter.get_parser(0, lang)
  local query = vim.treesitter.query.get(parser:lang(), "highlights")

  if query == nil then
    return vim.fn.foldtext()
  end

  local tree = parser:parse({ pos - 1, pos })[1]
  local result = {}

  local line_pos = 0

  local prev_range = nil

  for id, node, _ in query:iter_captures(tree:root(), 0, pos - 1, pos) do
    local name = query.captures[id]
    local start_row, start_col, end_row, end_col = node:range()
    if start_row == pos - 1 and end_row == pos - 1 then
      local range = { start_col, end_col }
      if start_col > line_pos then
        table.insert(result, { line:sub(line_pos + 1, start_col), "Folded" })
      end
      line_pos = end_col
      local text = vim.treesitter.get_node_text(node, 0)
      if prev_range ~= nil and range[1] == prev_range[1] and range[2] == prev_range[2] then
        result[#result] = { text, "@" .. name }
      else
        table.insert(result, { text, "@" .. name })
      end
      prev_range = range
    end
  end

  return result
end

local bg = vim.api.nvim_get_hl(0, { name = "StatusLine" }).bg
local hl = vim.api.nvim_get_hl(0, { name = "Folded" })
hl.bg = bg

vim.api.nvim_set_hl(0, "Folded", hl)
vim.opt.foldtext = [[luaeval('HighlightedFoldtext')()]]

-- In init.lua
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- local elixir_query = [[
--   (function) @fold
--   (anonymous_function) @fold
--   (do_block) @fold
--   (case) @fold
--   (with) @fold
-- ]]
--
-- vim.treesitter.query.set("elixir", "folds", elixir_query)

vim.opt.foldlevelstart = 0 -- Start with all folds closed
vim.opt.foldlevel = 1 -- Keep folds closed

local augroup = vim.api.nvim_create_augroup("AutoFoldFunctions", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup,
  pattern = "*",
  callback = function()
    vim.cmd "silent! %fold"
    -- vim.cmd "foldo!" -- Close all folds
  end,
})

---------------------------------------- Neovide
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
