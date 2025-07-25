return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        -- hover = { enabled = false }, -- <-- HERE!
        -- signature = { enabled = false }, -- <-- HERE!
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
      },
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true,
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = true,
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
}
