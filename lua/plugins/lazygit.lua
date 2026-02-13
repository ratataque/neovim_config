return {
	"kdheepak/lazygit.nvim",
	cmd = "LazyGit",
	init = function()
		function _G.DiffviewFromLazygit()
			vim.schedule(function()
				vim.cmd "bd!"
				local f = io.open "/tmp/nvim_diffview_target"
				if f then
					local name = f:read("*a"):gsub("%s+$", "")
					f:close()
					os.remove "/tmp/nvim_diffview_target"
					vim.cmd("DiffviewOpen -- " .. vim.fn.fnameescape(name))
				end
			end)
			return ""
		end
	end,
}
