local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "python",
    "fish",
    "php",
    "xml",
  },
  -- highlight = true,
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  -- autotag = {
  --   enable = true,
  -- },
}

M.harpoon = {}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",

    -- python
    "pyright",

    --php
    "phpactor",
  },
}

-- git support in nvimtree
M.nvimtree = {
  -- sync_root_with_cwd = true,
  -- respect_buf_cwd = false,
  -- update_cwd = true,
  -- update_focused_file = {
  --   enable = true,
  --   update_root = true,
  --   -- update_cwd = true,
  -- },

  git = {
    enable = true,
    ignore = false,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.telescope = {
  defaults = {
    file_ignore_patterns = { "node_modules/", ".git/", ".pyc/", ".mypy_cache/", "postgres_data/", ".rustup/" },
    mappings = {
      i = {
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<esc>"] = "close",
      },
    },
  },
  extensions_list = {
    "themes",
    -- "projects",
    "undo",
    "fzf",
    "notify",
    "noice",
    "flutter",
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
  },
}

M.cmp = {
  mapping = {
    ["<C-e>"] = require("cmp").mapping.close(),
    ["<C-k>"] = require("cmp").mapping.select_prev_item(),
    ["<C-j>"] = require("cmp").mapping.select_next_item(),
    ["<Tab>"] = require("cmp").mapping.confirm(),
  },
}

return M
