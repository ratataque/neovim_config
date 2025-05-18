return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
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
      fold = {
        enable = true,
      },
    },
  },
}
