return {
  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    -- event = "VeryLazy",
    cmd = { "Yazi" },
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
}
