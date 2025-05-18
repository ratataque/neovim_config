-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "onedark",
  hl_override = {
    -- ["Normal"] = { fg = "#D8DEE9" },
    ["@variable"] = { fg = "#D8DEE9" },
    ["NormalFloat"] = { bg = "NONE" },
    ["LineNr"] = { fg = "#515256" },
    ["CursorLineNr"] = { fg = "vibrant_green" },
    ["IncSearch"] = { fg = "#ffffff", bg = "#ff034f" },
    ["Substitute"] = { fg = "black", bg = "orange" },
    ["Search"] = { fg = "#1e1d2d", bg = "#abe9b3" },
    --   ["NvimTreeNormal"] = { bg = "NONE"},
    ["Visual"] = { bg = "#214283" },
    -- ["@comment"] = { fg = "#717276" },

    -- ["IndentBlanklineContextStart"] = { bg = "#515256" },
    -- ["IndentBlanklineContextStart"] = { bg = "#afffcf" },
    -- ["IndentBlanklineContextChar"] = { fg = "#afffcf" },
    ["IndentBlanklineContextChar"] = { fg = "#995239" },
    -- ["IndentBlanklineSpaceCharBlankline"] = { fg = "#995233" },
    ["IndentBlanklineSpaceChar"] = { fg = "#333233" },
    ["IndentBlanklineChar"] = { fg = "#333233" },

    -- Diff
    ["DiffChange"] = { fg = "black", bg = "orange" },
    ["DiffModified"] = { fg = "black", bg = "orange" },
    ["DiffTex"] = { fg = "#1e1d2d", bg = "green" },
    ["DiffAdd"] = { fg = "#1e1d2d", bg = "green" },
    ["DiffAdded"] = { fg = "#1e1d2d", bg = "green" },
    ["DiffDelete"] = { fg = "#1e1d2d", bg = "red" },
    ["DiffRemoved"] = { fg = "#1e1d2d", bg = "red" },
    ["diff_change_delete"] = { fg = "#1e1d2d", bg = "red" },
  },
}

vim.api.nvim_set_hl(0, "HarpoonHl", { fg = "#CF6377", bg = "NONE" })
vim.api.nvim_set_hl(0, "SessionHl", { fg = "#89B35C", bg = "NONE" })
vim.api.nvim_set_hl(0, "FilepathHl", { fg = "#ABB2BF", bg = "#42464E" })
vim.api.nvim_set_hl(0, "FileNameHl", { bg = "#4E565C" })
vim.api.nvim_set_hl(0, "FilepathSeperatorLefttHl", { fg = "#2D3139", bg = "#42464E" })
vim.api.nvim_set_hl(0, "FilepathSeperatorRightHl", { fg = "#42464E", bg = "#2D3139" })
vim.api.nvim_set_hl(0, "FileNameSeperatorLefttHl", { fg = "#2D3139", bg = "#2D3139" })
vim.api.nvim_set_hl(0, "FileNameSeperatorRightHl", { fg = "#2D3139", bg = "NONE" })
vim.api.nvim_set_hl(0, "EncodingHl", { fg = "#69AED6", bg = "NONE" })

vim.api.nvim_create_autocmd(
  { "BufModifiedSet", "BufReadPost", "BufNewFile", "BufWinEnter", "TextChanged", "TextChangedI" },
  {
    pattern = "*",
    callback = function()
      local buf = vim.api.nvim_get_current_buf()

      if vim.bo[buf].modified then
        vim.api.nvim_set_hl(0, "FileNameHl", { fg = "#ff034f", bg = "#2D3139" })
      else
        vim.api.nvim_set_hl(0, "FileNameHl", { fg = "#afffcf", bg = "#2D3139" })
      end
    end,
  }
)

M.nvdash = {
  load_on_startup = true,
  header = {
    [[⠀⠀⠀⠀⣠⣶⡾⠏⠉⠙⠳⢦⡀⠀⠀⠀⢠⠞⠉⠙⠉⠙⠲⡀     ]],
    [[⠀⠀⠀⣴⠿⠏⠀⠀⠀⠀⠀⠀ ⢳⡀⠀⡏⠀⠀⠀⠀   ⢷    ]],
    [[⠀⠀⢠⣟⣋⡀⢀⣀⣀⡀⠀⣀⡀ ⣧⠀⢸⠀⠀⠀     ⡇   ]],
    [[⠀⠀⢸⣯⡭⠁⠸⣛⣟⠆⡴⣻⡲ ⣿⠀⣸⠀Sauce? ⡇   ]],
    [[⠀⠀⣟⣿⡭⠀⠀⠀⠀⠀⢱⠀⠀ ⣿⠀⢹⠀⠀⠀⠀    ⡇   ]],
    [[⠀⠀⠙⢿⣯⠄⠀⠀⠀⢀⡀⠀⠀⡿⠀⠀⡇⠀⠀⠀    ⡼    ]],
    [[⠀⠀⠀⠀⠹⣶⠆⠀⠀⠀⠀⠀⡴⠃⠀⠀⠘⠤⣄⣠⣄⣠⣄⠞⠀    ]],
    [[⠀⠀⠀⠀⠀⢸⣷⡦⢤⡤⢤⣞⣁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀      ]],
    [[⠀⠀⢀⣤⣴⣿⣏⠁⠀⠀⠸⣏⢯⣷⣖⣦⡀⠀⠀⠀⠀⠀⠀      ]],
    [[⢀⣾⣽⣿⣿⣿⣿⠛⢲⣶⣾⢉⡷⣿⣿⠵⣿⠀⠀⠀⠀⠀⠀      ]],
    [[⣼⣿⠍⠉⣿⡭⠉⠙⢺⣇⣼⡏⠀⠀⠀⣄⢸⠀⠀⠀⠀⠀⠀      ]],
    [[⣿⣿⣧⣀⣿.........⣀⣰⣏⣘⣆⣀⠀        ]],
    [[                             ]],
  },
}
M.ui = {
  tabufline = {
    enabled = false,
    lazyload = false,
    -- modules = nil,
  },
  statusline = {
    theme = "default",
    separator_style = "default",
    order = { "mode", "filepath", "file", "%=", "lsp_msg", "%=", "harpoon", "session", "lsp", "cwd" },
    modules = {
      harpoon = function()
        local Marked = require "harpoon.mark"
        local filename = vim.api.nvim_buf_get_name(0)
        local success, index = pcall(Marked.get_index_of, filename)
        if success and index and index ~= nil then
          return "%#HarpoonHl#󱡀 " .. index .. " "
        else
          return ""
        end
      end,

      session = function()
        local session = require("auto-session.lib").current_session_name(true)
        if session ~= "" then
          return "%#SessionHl#󰐃 " .. session .. " "
        else
          return "%#SessionHl#󰐄 "
        end
      end,

      filepath = function()
        local file_path = vim.fn.expand "%:."
        local file_name = vim.fn.expand "%:t"
        if file_path == "" then
          return "%#FilepathSeperatorLefttHl#%#FileNameSeperatorRightHl#"
        end
        local path = "%#FilepathSeperatorLefttHl# %#FilepathHl#󰉋 /"
        if file_path ~= file_name then
          file_path = string.gsub(file_path, file_name, "")
          path = path .. file_path .. " "
        end
        return path .. "%#FilepathSeperatorRightHl#"
      end,

      file = function()
        local file_name = vim.fn.expand "%:t"
        if file_name == "" then
          return ""
        end
        return "%#FileNameHl# 󰈙 " .. file_name .. "  %#FileNameSeperatorRightHl#"
      end,
    },
  },
}

return M
