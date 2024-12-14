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
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
    -- update_cwd = true,
  },

  git = {
    enable = true,
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
    "file_browser",
    -- "projects",
    "undo",
    "docker",
    "fzf",
    "notify",
    "noice",
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      -- hijack_netrw = true,
      prompt_path = true,
      git_status = false,
      hide_parent_dir = true,
      hidden = true,
      respect_gitignore = false,
      title = "File Browser ( Hidden )",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
          -- ["<C-h>"] = fb_actions.backspace,
          -- ["<C-h>"] = require "telescope".extensions.file_browser.actions.backspace,
          -- ["<Tab>"] = function (prompt_bufnr)
          --   require "telescope".extensions.file_browser.actions.goto_cwd(prompt_bufnr)
          -- end,
          ["<C-h>"] = function(prompt_bufnr, bypass)
            require("telescope").extensions.file_browser.actions.backspace(prompt_bufnr, bypass)
            local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            local finder = current_picker.finder
            finder.depth = 1
            finder.add_dirs = true
          end,
          ["<C-s>"] = function(prompt_bufnr)
            local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            local finder = current_picker.finder
            if not finder.hidden and not finder.depth then
              finder.hidden = true
              finder.respect_gitignore = false
              current_picker.prompt_border:change_title "File Browser (All files + Hidden)"
            elseif not finder.hidden then
              finder.hidden = true
              finder.respect_gitignore = false
              current_picker.prompt_border:change_title "File Browser ( Hidden )"
            elseif not finder.depth then
              finder.hidden = false
              finder.respect_gitignore = true
              current_picker.prompt_border:change_title "File Browser (All files)"
            elseif finder.hidden then
              finder.hidden = false
              finder.respect_gitignore = true
              current_picker.prompt_border:change_title "File Browser"
            end

            current_picker:refresh(finder, { reset_prompt = false })
            -- require "telescope".extensions.file_browser.actions.toggle_hidden(prompt_bufnr, {reset_prompt=false, respect_gitignore=true})
          end,
          -- ["<C-f>"] = function (prompt_bufnr)
          --   require "telescope.actions.state".get_current_picker(prompt_bufnr):refresh(require "telescope.builtin".find_files({hidden=true, no_ignore=true}), {reset_prompt = false})
          -- end,
          ["<C-f>"] = function(prompt_bufnr)
            local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            local finder = current_picker.finder
            if not finder.hidden and finder.depth then
              finder.depth = false
              finder.add_dirs = false
              current_picker.prompt_border:change_title "File Browser (All files)"
            elseif finder.hidden and finder.depth then
              finder.depth = false
              finder.add_dirs = false
              current_picker.prompt_border:change_title "File Browser (All files + Hidden)"
            elseif finder.hidden and not finder.depth then
              finder.depth = 1
              finder.add_dirs = true
              current_picker.prompt_border:change_title "File Browser ( Hidden )"
            elseif not finder.hidden and not finder.depth then
              finder.depth = 1
              finder.add_dirs = true
              current_picker.prompt_border:change_title "File Browser"
            end

            current_picker:refresh(finder, { reset_prompt = false })
          end,

          ["<C-d>"] = function(prompt_bufnr)
            local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
            local finder = current_picker.finder

            finder.cwd = finder.path
            finder.files = not finder.files

            current_picker:refresh(finder, { reset_prompt = false, multi = current_picker._multi })
          end,
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
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
