local overrides = require "custom.configs.overrides"

local plugins = {
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   ft = { "python" },
  --   opts = function()
  --     return require "custom.configs.null-ls"
  --   end,
  -- },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "phpactor",
        "black",
        "pyright",
        "mypy",
        "ruff",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "danymat/neogen",
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "lambdalisue/suda.vim",
    lazy = false,
  },
  {
    "ThePrimeagen/vim-be-good",
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require "conform"

      conform.setup {
        formatters_by_ft = {
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          svelte = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          yaml = { "prettier" },
          markdown = { "prettier" },
          graphql = { "prettier" },
          lua = { "stylua" },
          python = { "black" },
          blade = { "tlint" },
          php = { "pretty-php" },
          [""] = { "trim_whitespace" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        },
        formatters = {
          ["pretty-php"] = {
            prepend_args = { "--tab=2" },
          },
        },
      }
    end,
  },
  {
    "ThePrimeagen/harpoon",
    lazy = false,
    opts = overrides.harpoon,
  },
  {
    "gennaro-tedesco/nvim-possession",
    lazy = false,
    dependencies = {
      "ibhagwan/fzf-lua",
    },
    config = function()
      require("nvim-possession").setup {
        autoload = true,
        sessions = {
          sessions_icon = "",
          sessions_path = "/sessions/",
        },
        autoswitch = {
          enable = true,
        },
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
  },

  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
  },

  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "debugloop/telescope-undo.nvim",
      "lpoto/telescope-docker.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
      "debugloop/telescope-undo.nvim",
    },
    opts = overrides.telescope,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },
  {
    "AckslD/muren.nvim",
    config = true,
  },
  -- {
  --   "ratataque/project.nvim",
  --   config = function()
  --     require("project_nvim").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --       show_hidden = true,
  --       ignore_gitignore = true,
  --     }
  --   end,
  -- },

  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "Wansmer/treesj",
    -- keys = { '<space>m' },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("treesj").setup {--[[ your config ]]
      }
    end,
  },

  {
    "folke/trouble.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "pwntester/octo.nvim",
    lazy = false,
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      -- OR 'ibhagwan/fzf-lua',
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },
  {
    "notjedi/nvim-rooter.lua",
    lazy = false,
    config = function()
      require("nvim-rooter").setup {
        rooter_patterns = { ".git" },
        trigger_patterns = { "*" },
        manual = false,
        fallback_to_parent = false,
      }
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    -- modes = {
    --   char = {
    --     enable = false,
    --     keys = {},
    --   },
    -- },
    opts = {},
    keys = {
      {
        "S",
        mode = { "n" },
        function()
          require("flash").jump {
            jump = {
              autojump = true,
              history = true,
            },
            label = {
              exclude = "hjkliardcog",
              current = false,
            },
            search = {
              max_length = 2,
              forward = false,
              wrap = false,
            },
            modes = {
              search = { enable = false },
            },
          }
        end,
        desc = "Flash",
      },
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump {
            jump = {
              autojump = true,
              history = true,
            },
            label = {
              exclude = "hjkliardcog",
              current = false,
              rainbow = { enable = true, shade = 9 },
            },
            search = {
              max_length = 2,
              forward = true,
              wrap = false,
            },
            modes = {
              search = { enable = false },
            },
          }
        end,
        desc = "Flash",
      },
      {
        "z",
        mode = { "n", "o", "x" },
        function()
          -- show labeled treesitter nodes around the cursor
          require("flash").treesitter {
            labels = "dfjkl;hwertyuiopzxcvbnm",
            search = { label = { rainbow = { enable = true, shade = 9 } } },
          }
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          -- jump to a remote location to execute the operator
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "<C-f>",
        mode = { "n", "o", "x" },
        function()
          -- show labeled treesitter nodes around the search matches
          require("flash").treesitter_search {
            search = {
              label = {
                rainbow = {
                  enable = true,
                  shade = 5,
                },
              },
            },
            remote_op = {
              restore = true,
              motion = true,
            },
          }
        end,
        desc = "Treesitter Search",
      },
    },
  },
  -- {
  --   "christoomey/vim-tmux-navigator",
  --   cmd = {
  --     "TmuxNavigateLeft",
  --     "TmuxNavigateDown",
  --     "TmuxNavigateUp",
  --     "TmuxNavigateRight",
  --     "TmuxNavigatePrevious",
  --   },
  --   keys = {
  --     { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
  --     { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
  --     { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
  --     { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
  --     { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  --   },
  -- },
  -- {
  --   "ggandor/leap.nvim",
  --   lazy = false,
  -- },
}
return plugins
