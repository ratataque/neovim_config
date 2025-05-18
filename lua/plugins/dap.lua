return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = { "/home/ewan/.local/share/nvim/mason/packages/php-debug-adapter/extension/out/phpDebug.js" },
      }

      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug",
          port = 9003,
          pathMappings = {
            ["/var/www/html"] = "${workspaceFolder}",
          },
        },
      }
      -- Go adapter configuration
      dap.adapters.go = {
        type = "server",
        port = "44357",
        executable = {
          -- command = vim.fn.expand "/home/ewan/.local/share/nvim/mason/packages/go-debug-adapter/go-debug-adapter",
          command = vim.fn.expand "/home/ewan/.local/share/nvim/mason/packages/delve/dlv",
          args = { "dap", "-l", "127.0.0.1:44357" },
        },
      }

      dap.configurations.go = {
        {
          type = "go",
          name = "Debug",
          request = "launch",
          program = "${file}",
        },
      }
    end,
  },
}
