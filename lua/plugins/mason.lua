return {
  {
    "mason-org/mason.nvim",
    config = {
      ensure_installed = {
        "prettier",
        "black",
        "gofumpt",
        "goimports-reviser",
        "kulala-fmt",
        "prettierd",
        "pretty-php",
        "stylua",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "mason-org/mason-lspconfig.nvim",
    event = "VeryLazy",
    config = {
      ensure_installed = {
        "rust_analyzer",
        "lua_ls",
        "gopls",
        "dockerls",
        "cssls",
        "docker_compose_language_service",
        "html",
        "intelephense",
        "marksman",
        "ts_ls",
      },
    },
  },
}
