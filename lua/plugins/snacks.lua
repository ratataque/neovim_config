return {
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
}
