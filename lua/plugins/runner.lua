return {
  {
    "MarcHamamji/runner.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("runner").setup {
        handlers = {
          elixir = function(bufnr)
            local helpers = require "runner.handlers.helpers"
            helpers.shell_handler("elixir " .. vim.fn.expand "%")(bufnr)
          end,

          go = function(bufnr)
            local helpers = require "runner.handlers.helpers"
            local file_name = vim.fn.expand "%:t" -- Get the current buffer's file name
            local dir = vim.fn.expand "%:p:h" -- Get the directory of the current buffer

            if file_name == "main.go" then
              -- Run the current file if it's main.go
              helpers.shell_handler("go run " .. vim.fn.expand "%")(bufnr)
            else
              -- Run the main.go located in the buffer's directory
              helpers.shell_handler("go run " .. dir .. "/../main.go")(bufnr)
            end
          end,
        },
      }
    end,
  },
}
