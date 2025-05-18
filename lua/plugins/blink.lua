return {
  "Saghen/blink.cmp",
  opts = {
    cmdline = {
      enabled = false,
    },
    completion = {
      menu = {
        border = "single",
      },
      documentation = {
        auto_show = true,
        window = {
          border = "single",
        },
      },
      list = {
        selection = {
          preselect = true,
        },
      },
    },
    keymap = {
      preset = "default",
      ["<Right>"] = { "snippet_forward", "fallback" },
      ["<Left>"] = { "snippet_backward", "fallback" },

      ["<C-m>"] = { "accept", "fallback" },
      ["<CR>"] = { "accept", "fallback" },

      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },

      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },

      ["<S-k>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide", "fallback" },
    },
  },
}
