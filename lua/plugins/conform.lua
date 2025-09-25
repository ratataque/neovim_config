return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = {
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
        php = { "pretty-php" },
        sql = { "prettier" },
        yml = { "prettier" },
        c = { "clang-format" },
        go = { "goimports-reviser" },
        http = { "kulala" },
        rust = { "rustfmt" },
        -- fish = { "prettier" },
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

        ["goimports-reviser"] = {
          command = "goimports-reviser",
          args = { "-rm-unused", "-set-alias", "-format", "$FILENAME" },
          stdin = false,
        },
      },
    },
  },
}
