---@type ChadrcConfig
local M = {}

M.ui = {
  -- tabufline = { enabled = false },

  theme = "doomchad",
  theme_toggle = { "doomchad", "nord" },

  hl_override = {
    ["Normal"] = { fg = "#D8DEE9", bg = "NONE" },
    ["@variable"] = { fg = "white", bg = "NONE" },
    ["NormalFloat"] = { bg = "NONE" },
    -- ["LineNr"] = { fg = "orange" },
    -- ["LineNr"] = { fg = "#1e1e1e" },
    ["LineNr"] = { fg = "#515256" },
    ["CursorLineNr"] = { fg = "vibrant_green" },
    ["IncSearch"] = { fg = "#ffffff", bg = "#ff034f" },
    ["Substitute"] = { fg = "black", bg = "orange" },
    ["Search"] = { fg = "#1e1d2d", bg = "#abe9b3" },
    --   ["NvimTreeNormal"] = { bg = "NONE"},
    ["Visual"] = { bg = "#214283" },
    ["@comment"] = { fg = "#717276" },
    ["St_file_info"] = { fg = "#afffcf" },

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

  -- telescope = { style = "bordered" },

  statusline = {
    overriden_modules = function(modules)
      modules[6] = (function()
        -- local st_modules = require "nvchad_ui.statusline.vscode_colored"
        -- Load info for harpoon
        local function get_marked()
          local Marked = require "harpoon.mark"
          local filename = vim.api.nvim_buf_get_name(0)
          local success, index = pcall(Marked.get_index_of, filename)
          if success and index and index ~= nil then
            return "󱡀 " .. index .. " "
          else
            return ""
          end
        end
        -- Load info for possession
        local function get_session()
          -- local session = require("nvim-possession").status()
          local session = require("nvim-possession").status()
          if session ~= nil then
            return "󰐃 "
          else
            return "󰐄 "
          end
        end

        return "%#HarpoonHl#" .. get_marked() .. "%#SessionHl#" .. get_session() .. " "
      end)()
    end,
  },

  -- transparency = true,

  nvdash = {
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
    },
    buttons = {
      { "󰊳 Update", "Spc u u", "Lazy update" },
      { "󰈞  Find Project", "Spc f p", "Telescope project" },
      { "  File Browser", "c d    ", "Telescope file_browser" },
      { "󰈭  Global Search", "Spc f w", "Telescope live_grep" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰔫 Diagnostics", "Spc t  ", "TroubleToggle" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

vim.api.nvim_create_autocmd({ "BufModifiedSet", "BufReadPost", "BufNewFile", "BufWinEnter" }, {
  pattern = "<buffer>",

  callback = function()
    local buf = vim.api.nvim_get_current_buf()

    -- print(bufnr, cur_buf())
    if vim.bo[buf].modified then
      vim.api.nvim_set_hl(0, "St_file_info", { fg = "#ff034f" })
    else
      vim.api.nvim_set_hl(0, "St_file_info", { fg = "#afffcf" })
    end
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "dbout",
  callback = function()
    vim.cmd [[ setlocal nofoldenable ]]
  end,
})

vim.opt.showtabline = 0 -- Completely disables tabline

return M
