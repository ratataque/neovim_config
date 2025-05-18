return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      "debugloop/telescope-undo.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "jonarrien/telescope-cmdline.nvim",
    },
    opts = {
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
        "undo",
        "fzf",
        "notify",
        "noice",
        "flutter",
        "cmdline",
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
    },
  },
}
