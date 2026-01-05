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
					-- New Python handler with venv detection
					python = function(bufnr)
						local helpers = require "runner.handlers.helpers"
						local file = vim.fn.expand "%:p"
						-- Get project root (assumes git root or current working dir)
						local root = vim.fs.dirname(
							vim.fs.find({ ".git", "setup.py", "pyproject.toml" }, { upward = true })[1]
						) or vim.fn.getcwd()

						-- Check common venv names
						local venv_python = nil
						for _, venv_name in ipairs { "venv", ".venv", "env" } do
							local path = root .. "/" .. venv_name .. "/bin/python"
							if vim.fn.filereadable(path) == 1 then
								venv_python = path
								break
							end
						end

						-- Use venv python if found, else default 'python'
						local cmd = (venv_python or "python") .. " -u " .. file -- '-u' for unbuffered output
						helpers.shell_handler(cmd)(bufnr)
					end,

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
