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
        "intelephense",
        "clangd",
        "sqls",
        "clang-format",
        "lemminx",
        "html-lsp",
        "nextls",
        "stimulus-language-server",
        "css-lsp",
        "htmx-lsp",
        "tailwindcss-language-server",
        "marksman",
        "typescript-language-server",
        "gopls",
        "pretty-php",
        "prettier",
        "black",
        "lua-language-server",
        "mypy",
        "pyright",
        "ruff",
        "rust-analyzer",
        "stylua",
        "volar",
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
          blade = { "blade-formatter" },
          php = { "pretty-php" },
          sql = { "prettier" },
          yml = { "prettier" },
          c = { "clang-format" },
          go = { "gofmt" },
          http = { "kulala" },
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
          kulala = {
            command = "kulala-fmt",
            args = { "format", "$FILENAME" },
            stdin = false,
          },
        },
      }
    end,
  },
  {
    "ratataque/harpoon",
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
    "nvim-telescope/telescope.nvim",
    lazy = false,
    dependencies = {
      "debugloop/telescope-undo.nvim",
      "nvim-telescope/telescope-fzf-native.nvim",
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
        keymaps = {
          visual = "s",
          -- other keymaps...
        },
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
      require("octo").setup {
        users = "assignable",
        suppress_missing_scope = {
          projects_v2 = true,
        },
      }
    end,
  },
  {
    "notjedi/nvim-rooter.lua",
    lazy = false,
    config = function()
      require("nvim-rooter").setup {
        rooter_patterns = { "src", "mix.lock", ".git" },
        trigger_patterns = { "*" },
        manual = true,
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
        mode = { "n", "o" },
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
  --
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        hover = { enabled = false }, -- <-- HERE!
        signature = { enabled = false }, -- <-- HERE!
      },
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        long_message_to_split = true, -- long messages will be sent to a split
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require("notify").setup {
        stages = "fade_in_slide_out",
        background_colour = "FloatShadow",
        render = "wrapped-compact",
      }
      vim.notify = require "notify"
    end,
  },
  {
    "wellle/targets.vim",
    lazy = false,
  },
  {
    "nvim-pack/nvim-spectre",
  },
  {
    "sindrets/diffview.nvim",
    lazy = false,
  },
  {
    -- "m4xshen/hardtime.nvim",
    -- event = "VeryLazy",
    -- dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    -- opts = {
    --   disabled_keys = {
    --     ["<Up>"] = {},
    --     ["<Left>"] = {},
    --     ["<Right>"] = {},
    --     ["<Down>"] = {},
    --   },
    -- },
  },
  {
    "EmranMR/tree-sitter-blade",
    lazy = false,
  },
  -- {
  --   "tpope/vim-dadbod",
  --   dependencies = {
  --     { "kristijanhusak/vim-dadbod-completion", event = "VeryLazy" },
  --     { "kristijanhusak/vim-dadbod-ui", event = "VeryLazy" },
  --   },
  --   event = "VeryLazy",
  -- },
  -- {
  --
  --   "kristijanhusak/vim-dadbod-ui",
  --   dependencies = {
  --     { "tpope/vim-dadbod", lazy = true },
  --     { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
  --   },
  --   cmd = {
  --     "DBUI",
  --     "DBUIToggle",
  --     "DBUIAddConnection",
  --     "DBUIFindBuffer",
  --   },
  --   init = function()
  --     vim.g.db_ui_use_nerd_fonts = 1
  --     vim.g.db_ui_auto_execute_table_helpers = 1
  --   end,
  -- },
  -- {
  --   "tpope/vim-dotenv",
  --   event = "VeryLazy",
  --   config = function()
  --     local envFiles = {
  --       ".env.local",
  --       ".env",
  --     }
  --
  --     local envFile = nil
  --
  --     for _, file in ipairs(envFiles) do
  --       if vim.fn.filereadable(file) == 1 then
  --         envFile = file
  --         break
  --       end
  --     end
  --
  --     if envFile == nil then
  --       return
  --     end
  --
  --     vim.cmd("verbose Dotenv" .. envFile)
  --   end,
  -- },
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
      {
        "e",
        "<cmd>lua require('spider').motion('e', {customPatterns = {'%u+%l+', '%f[%w]%u?%w+', '^%p+%f[%s]', '%f[^%s]%p+$', '^%p+$' }})<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "w",
        "<cmd>lua require('spider').motion('w', {customPatterns = {'%u+','%f[%w]%w+', '^%p+%f[%s]', '%f[^%s]%p+$', '^%p+$' }})<CR>",
        mode = { "n", "o", "x" },
      },
      -- { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
      {
        "b",
        "<cmd>lua require('spider').motion('b', {customPatterns = {'%u+','%f[%w]%w+', '^%p+%f[%s]', '%f[^%s]%p+$', '^%p+$' }})<CR>",
        mode = { "n", "o", "x" },
      },
    },
    opts = { subwordExcludeNumber = false },
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    lazy = false,
    opts = {
      keymaps = {
        useDefaults = true,
        disabledDefaults = { "an", "in", "aN", "iN", "n", "r" },
      },
    },
  },
  {
    "LudoPinelli/comment-box.nvim",
    event = "VeryLazy",
  },
  {
    "folke/todo-comments.nvim",
    lazy = false,
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    "gbprod/stay-in-place.nvim",
    config = function()
      require("stay-in-place").setup()
    end,
    event = "VeryLazy",
  },
  {
    "max397574/colortils.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        suggestion = {
          enabled = true,
          auto_trigger = true,
          hide_during_completion = true,
          debounce = 75,
          keymap = {
            accept = "<right>",
            accept_word = false,
            accept_line = false,
            next = "<M-space>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        panel = {
          enabled = true,
          auto_refresh = false,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<C-right>",
          },
          layout = {
            position = "bottom", -- | top | left | right
            ratio = 0.3,
          },
        },
      }
    end,
  },
  {
    "MarcHamamji/runner.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("runner").setup {
        handlers = {
          elixir = function(bufnr)
            local helpers = require "runner.handlers.helpers"
            helpers.shell_handler("elixir " .. vim.fn.expand "%")(bufnr)
          end,

          go = function(bufnr)
            local helpers = require "runner.handlers.helpers"
            local file_name = vim.fn.expand "%:t" -- Get the current buffer's file name
            local dir = vim.fn.expand "%:p:h" -- Get the directory of the current buffer

            if file_name == "main.go" then
              -- Run the current file if it's main.go
              helpers.shell_handler("go run " .. vim.fn.expand "%")(bufnr)
            else
              -- Run the main.go located in the buffer's directory
              helpers.shell_handler("go run " .. dir .. "/../main.go")(bufnr)
            end
          end,
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { "/home/ewan/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
          pathMappings = {
            ["/var/www/html"] = "${workspaceFolder}",
          },
        },
      }
      -- Go adapter configuration
      dap.adapters.go = {
        type = "server",
        port = "44357",
        executable = {
          -- command = vim.fn.expand "/home/ewan/.local/share/nvim/mason/packages/go-debug-adapter/go-debug-adapter",
          command = vim.fn.expand "/home/ewan/.local/share/nvim/mason/packages/delve/dlv",
          args = { "dap", "-l", "127.0.0.1:44357" },
        },
      }

      dap.configurations.go = {
        {
          type = "go",
          name = "Debug",
          request = "launch",
          program = "${file}",
        },
      }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    -- event = "VeryLazy",
    config = function()
      require("dapui").setup()
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    event = "VeryLazy",
    ft = { "python" },
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)

      local dap, dapui = require "dap", require "dapui"
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      require("core.utils").load_mappings "dap_python"
    end,
  },
  {
    "rachartier/tiny-code-action.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope.nvim" },
    },
    event = "LspAttach",
    config = function()
      require("tiny-code-action").setup()
    end,
  },
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      scroll = {
        animate = {
          duration = {
            step = 15,
            total = 110,
          },
          easing = "linear",
        },
      },
    },
  },
  {
    "nvim-telescope/telescope-frecency.nvim",
    -- install the latest stable version
    version = "*",
    config = function()
      require("telescope").load_extension "frecency"
    end,
  },
  -- {
  --   "ChuufMaster/buffer-vacuum",
  --   event = "VeryLazy",
  --   opts = {
  --     max_buffers = 5,
  --     count_pinned_buffers = true,
  --   },
  -- },
  -- Lua
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 120, -- width of the Zen window
        height = 1, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          -- signcolumn = "no", -- disable signcolumn
          -- number = false, -- disable number column
          -- relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },
      plugins = {
        gitsigns = { enabled = true }, -- disables git signs
        tmux = { enabled = true }, -- disables the tmux statusline
      },
    },
  },
  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    keys = {
      -- 👇 in this section, choose your own keymappings!
      {
        "cd",
        mode = { "n" },
        "<cmd>Yazi<cr>",
        desc = "Open yazi at the current file",
      },
      {
        -- Open in the current working directory
        "<leader>o",
        "<cmd>Yazi cwd<cr>",
        desc = "Open the file manager in nvim's working directory",
      },
      {
        "<leader>y",
        "<cmd>Yazi toggle<cr>",
        desc = "Resume the last yazi session",
      },
    },
    ---@type YaziConfig
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = true,
      keymaps = {
        show_help = "<f1>",
      },
    },
  },
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup {
        lsp = {
          on_attach = function(client, bufnr)
            -- Map 'gd' to LSP definition
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to definition" })
            -- Additional keybindings can be added here
          end,
        },
      }
    end,
    -- config = true,
  },

  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = true,
    version = false, -- set this if you want to always pull the latest change
    opts = require "custom.configs.avante",
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      -- {
      --   -- support for image pasting
      --   "HakonHarnes/img-clip.nvim",
      --   event = "VeryLazy",
      --   opts = {
      --     -- recommended settings
      --     default = {
      --       embed_image_as_base64 = false,
      --       prompt_for_file_name = false,
      --       drag_and_drop = {
      --         insert_mode = true,
      --       },
      --       -- required for Windows users
      --       use_absolute_path = true,
      --     },
      --   },
      -- },
      {
        -- Make sure to set this up properly if you have lazy=true
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
    keys = function(_, keys)
      local opts =
        require("lazy.core.plugin").values(require("lazy.core.config").spec.plugins["avante.nvim"], "opts", false)

      local mappings = {
        {
          opts.mappings.ask,
          function()
            require("avante.api").ask()
          end,
          desc = "avante AI: ask",
          mode = { "n", "v" },
        },
        {
          opts.mappings.clear,
          function()
            require("avante.api").clear()
          end,
          desc = "avante AI: clear",
          mode = { "n", "v" },
        },
        {
          opts.mappings.refresh,
          function()
            require("avante.api").refresh()
          end,
          desc = "avante AI: refresh",
          mode = "v",
        },
        {
          opts.mappings.edit,
          function()
            require("avante.api").edit()
          end,
          desc = "avante AI: edit",
          mode = { "n", "v" },
        },
      }
      mappings = vim.tbl_filter(function(m)
        return m[1] and #m[1] > 0
      end, mappings)
      return vim.list_extend(mappings, keys)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = "nvim-treesitter/nvim-treesitter",
    -- lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup {
        textobjects = {
          move = {
            enable = true,
            set_jumps = true, -- whether to set jumps in the jumplist
            -- goto_next_start = {
            --   ["<Down>"] = { query = "@function.outer", desc = "Next method/function def start" },
            -- },
            -- goto_previous_start = {
            --   ["<Up>"] = { query = "@function.outer", desc = "Prev method/function def start" },
            -- },
          },
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["f"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              -- You can optionally set descriptions to the mappings (used in the desc parameter of
              -- nvim_buf_set_keymap) which plugins like which-key display
              ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
              -- You can also use captures from other query groups like `locals.scm`
              ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
            },
            include_surrounding_whitespace = false,
          },
        },
      }
    end,
  },
  {
    "rest-nvim/rest.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      opts = function(_, opts)
        opts.ensure_installed = opts.ensure_installed or {}
        table.insert(opts.ensure_installed, "http")
      end,
    },
  },
}
return plugins
