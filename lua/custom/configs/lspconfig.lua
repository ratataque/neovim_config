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
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = function()
    return vim.loop.cwd()
  end,
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
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
-- lspconfig.dockerfile.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "dockerfile" },
--   root_dir = function()
--     return vim.loop.cwd()
--   end;
-- })
