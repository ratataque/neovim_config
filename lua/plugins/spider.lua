return {
  {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
      {
        "e",
        "<cmd>lua require('spider').motion('e', {customPatterns = {'%u+%l+', '%f[%w]%u?%w+', '^%p+%f[%s]', '%f[^%s]%p+$', '^%p+$' }})<CR>",
        mode = { "n", "o", "x" },
      },
      {
        "w",
        "<cmd>lua require('spider').motion('w', {customPatterns = {'%u+','%f[%w]%w+', '^%p+%f[%s]', '%f[^%s]%p+$', '^%p+$' }})<CR>",
        mode = { "n", "o", "x" },
      },
      -- { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
      {
        "b",
        "<cmd>lua require('spider').motion('b', {customPatterns = {'%u+','%f[%w]%w+', '^%p+%f[%s]', '%f[^%s]%p+$', '^%p+$' }})<CR>",
        mode = { "n", "o", "x" },
      },
    },
    opts = { subwordExcludeNumber = false },
  },
}
