return {
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      require("notify").setup {
        stages = "fade_in_slide_out",
        background_colour = "FloatShadow",
        render = "wrapped-compact",
      }
      vim.notify = require "notify"
    end,
  },
}
