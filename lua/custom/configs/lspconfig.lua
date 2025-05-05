local config = require "plugins.configs.lspconfig"
local util = require "lspconfig.util"

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require "lspconfig"

lspconfig.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  root_dir = lspconfig.util.root_pattern "Cargo.toml",
}

lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  -- root_dir = function(fname)
  --   return util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
  --   util.path.dirname(fname)
  -- end
}

lspconfig.intelephense.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.htmx.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html" },
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.tailwindcss.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.stimulus_ls.setup {
  filetypes = { "blade" },
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.cssls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.ts_ls.setup {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.stdpath "data"
          .. "/mason/packages/vue-language-server/node_modules/@vue/language-server/node_modules/@vue/typescript-plugin",
        languages = { "typescript", "javascript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
    "typescriptreact",
  },
}

lspconfig.volar.setup {
  init_options = {
    vue = {
      hybridMode = true,
    },
  },
  filetypes = { "vue" },
}

lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    -- Default on_attach
    if on_attach then
      on_attach(client, bufnr)
    end

    -- Additional setup for golangci-lint
    require("lspconfig.configs").golangcilsp = {
      default_config = {
        cmd = { "golangci-lint", "run", "--out-format=json" },
        root_dir = lspconfig.util.root_pattern(".git", "go.mod"),
        filetypes = { "go" },
        single_file_support = true,
      },
    }

    -- -- Attach golangci-lint as an additional linter
    -- lspconfig["golangcilsp"].setup {
    --   on_attach = on_attach,
    --   capabilities = capabilities,
    -- }
  end,
  capabilities = capabilities,
  filetypes = { "go" },
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.marksman.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.lemminx.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
}

-- lspconfig.vuels.setup {
--   config = {
--     css = {},
--     emmet = {},
--     html = {
--       suggest = {},
--     },
--     javascript = {
--       format = {},
--     },
--     stylusSupremacy = {},
--     typescript = {
--       format = {},
--     },
--     vetur = {
--       completion = {
--         autoImport = false,
--         tagCasing = "kebab",
--         useScaffoldSnippets = false,
--       },
--       format = {
--         defaultFormatter = {
--           js = "none",
--           ts = "none",
--         },
--         defaultFormatterOptions = {},
--         scriptInitialIndent = false,
--         styleInitialIndent = false,
--       },
--       useWorkspaceDependencies = false,
--       validation = {
--         script = true,
--         style = true,
--         template = true,
--       },
--     },
--   },
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = function()
--     return vim.loop.cwd()
--   end,
-- }

lspconfig.nextls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
  cmd = { "nextls", "--stdio" },
  init_options = {
    extensions = {
      credo = { enable = true },
    },
    experimental = {
      completions = { enable = true },
    },
  },
}

lspconfig.sqls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
  settings = {
    sqls = {
      connections = {
        {
          driver = "postgresql",
          dataSourceName = "host=127.0.0.1 port=5432 user=app password=c1hg6jt6 dbname=AppDigitalisation sslmode=disable",
        },
      },
    },
  },
}

lspconfig.svelte.setup {}

-- lspconfig.dockerfile.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "dockerfile" },
--   root_dir = function()
--     return vim.loop.cwd()
--   end;
-- })
