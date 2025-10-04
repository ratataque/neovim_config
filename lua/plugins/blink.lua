return {
  "Saghen/blink.cmp",
  ---@module 'blink.cmp'
  opts = {
    cmdline = {
      enabled = false,
    },
    signature = {
      -- menu = {
      --   border = "single",
      -- },
      -- enabled = true,
      -- trigger = {
      --   enabled = true, -- if I uncomment this, the keymap won't work anymore
      --   show_on_trigger_character = true,
      --   show_on_insert_on_trigger_character = true,
      -- },
      window = {
        show_documentation = false,
      },
    },
    completion = {
      menu = {
        border = "single",
      },
      documentation = {
        auto_show = false,
        -- auto_show_delay = 500,
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
    -- documentation = {
    --   auto_open = false,
    --   trigger = {
    --     -- enabled = true,
    --     show_on_trigger_character = false,
    --     show_on_insert_on_trigger_character = false,
    --   },
    -- },
    keymap = {
      -- preset = "default",
      -- ["<Right>"] = { "snippet_forward", "fallback" },
      -- ["<Left>"] = { "snippet_backward", "fallback" },

      ["<C-m>"] = { "accept", "fallback" },
      ["<CR>"] = { "accept", "fallback" },

      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },

      -- ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      -- ["<C-d>"] = { "scroll_documentation_down", "fallback" },

      ["<S-k>"] = { "show", "show_documentation", "hide_documentation" },
      -- ["<C-i>"] = { "hide", "fallback" },

      -- default in all keymap presets
      -- ["<C-s>"] = { "show_signature", "hide_signature", "fallback" },
    },
  },
}
