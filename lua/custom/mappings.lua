local M = {}
local opts = { noremap = true, silent = true }

M.disabled = {
  ["z"] = "",
  ["<C-u>"] = "",
  ["<leader>n"] = "",
  ["<leader>v"] = "",
  ["<tab>"] = "",
  ["["] = "",
  ["]"] = "",
}

M.text = {
  i = {
    ["<C-Up>"] = { "<cmd> :m-2<CR>", " Move up" },
    ["<C-Down>"] = { "<cmd> :m+<CR>", " Move down" },
    ["<C-s>"] = { "<cmd> w<CR>", " Move down" },
    ["<left>"] = { "", "" },
    -- ["<CR>"] = { "", "" },
    -- ["<C-m>"] = {""}
  },

  n = {
    ["<leader>e"] = { "<cmd> AvanteToggle <CR>", "avante toggle" },
    ["<leader>ao"] = { "<cmd> AvanteClear <CR>", "avante clear" },

    ["<Down>"] = {
      "<cmd>lua require('nvim-treesitter.textobjects.move').goto_next_start('@function.outer')<CR>",
      "move to next function",
    },
    ["<Up>"] = {
      "<cmd>lua require('nvim-treesitter.textobjects.move').goto_previous_start('@function.outer')<CR>",
      "move to next function",
    },

    ["<C-Up>"] = { "<cmd> :m-2<CR>", " Move up" },
    ["<C-Down>"] = { "<cmd> :m+<CR>", " Move down" },
    ["<C-w>v"] = { "<C-w>v<left> <cmd> lua require('nvchad.tabufline').tabuflineNext() <CR>" },

    -- ["<leader>p"] = { '"1p', "paste what you overrode with paste" },
    -- ["k"] = { ":normal k (v:count > 1 ? m' . v:count : '') . 'k'" },
    ["<leader>l"] = { "zf", " fold" },
    ["<leader>k"] = { "za", "toggle fold" },
    ["<leader>K"] = { "zR", "open all fold" },
    ["<leader>L"] = { "zM", "close all fold" },
    ["<leader>h"] = { "zMzvzz", "close all fold but the current one" },
    -- ["["] = { "zj", "jump to next closed fold", { noremap = true, silent = true, nowait = true } },
    -- ["]"] = { "zk", "jump to previous closed fold", { noremap = true, silent = true, nowait = true } },

    ["<leader>mp"] = { "<cmd> MarkdownPreviewToggle <CR>", "toggle markdown preview" },

    ["<leader>rr"] = { "<cmd>lua require('runner').run() <CR>", "run the current buffer" },
    ["<leader>db"] = { "<cmd>DBUIToggle <CR>", "dadbod ui" },
    ["<leader>ca"] = { "<cmd>lua require('tiny-code-action').code_action() <CR>", "dadbod ui" },
  },

  v = {
    ["<leader>e"] = { "<cmd> AvanteAsk <CR>", "avante ask" },

    ["<leader>p"] = { "p", "paste what you overrode with paste" },

    ["<leader>l"] = { "zf", " fold" },
    ["<leader>k"] = { "za", "toggle fold" },
    -- ["P"] = { 'ygv"1p' },
    -- ["<C-k"] = { "<cmd> :m '<-2<CR>gv=gv", "󰜸 Move selection up", opts = { silent = true } },
    -- ["<C-j>"] = { "<cmd> :m '>+1<CR>gv=gv", "󰜯 Move selection down", opts = { silent = true } },
    ["<leader>ca"] = { "<cmd>lua require('tiny-code-action').code_action() <CR>", "dadbod ui" },
  },

  c = {
    ["<C-k>"] = { "<C-p>", "nav prev " },
    ["<C-j>"] = { "<C-n>", "nav next " },
  },
}

vim.keymap.set("v", "<C-j>", ":m '>+1<CR> gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR> gv=gv")

M.general = {
  i = {
    ["<A-r>"] = { "<cmd> tabnew<CR>", "New tab" },
    ["<C-h>"] = { "<Backspace>", "Backspace" },
    ["<C-l>"] = { "<Delete>", "Delete" },

    ["<A-f>"] = { "<cmd> :lua require('harpoon.ui').nav_file(1) <CR>", "Harpoon swtich 1" },
    ["<A-d>"] = { "<cmd> :lua require('harpoon.ui').nav_file(2) <CR>", "Harpoon swtich 2" },
    ["<A-s>"] = { "<cmd> :lua require('harpoon.ui').nav_file(3) <CR>", "Harpoon swtich 3" },
    ["<A-a>"] = { "<cmd> :lua require('harpoon.ui').nav_file(4) <CR>", "Harpoon swtich 4" },
  },

  n = {
    [":"] = { ":Telescope cmdline <CR>", "fzf commande" },
    ["<leader>z"] = { ":lua require('zen-mode').toggle()<CR>", "Gen doc", opts = opts },

    ["<leader>ro"] = { ":Rooter<CR>", "rooter" },
    ["<leader>rd"] = { ":lua require('neogen').generate()<CR>", "Gen doc", opts = opts },
    ["<leader>rt"] = { ":lua require('neogen').generate({type = 'type'})<CR>", "Gen doc for type", opts = opts },

    ["<leader>j"] = { "<cmd> :normal! zz <CR>", "Center buffer on cursor" },
    ["<leader>rw"] = { "<esc><cmd>lua require('spectre').open_visual()<CR>", "Search current word" },

    ["<leader>fm"] = {
      function()
        require("conform").format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        }
      end,
      "Format file or range (in visual mode)",
    },

    ["<C-h>"] = { "<C-w>h", "Window left" },
    ["<C-l>"] = { "<C-w>l", "Window right" },
    ["<C-j>"] = { "<C-w>j", "Window down" },
    ["<C-k>"] = { "<C-w>k", "Window up" },

    ["<tab>"] = { "<C-i>", "not last position" },

    ["<A-x>"] = { "<C-w>c", "Window close" },

    ["<A-e>"] = { "<cmd> qa<CR>", "Exit" },

    ["<A-r>"] = { "<cmd> tabnew<CR>", "New tab" },
    ["<A-S-k>"] = { "<cmd> tabnext<CR>", "Next tab" },
    ["<A-S-j>"] = { "<cmd> tabprevious<CR>", "Previous tab" },

    ["<right>"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },
    ["<left>"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    ["<leader>uu"] = { "<cmd> Lazy update<CR>", "Lazy upadate" },

    ["<leader>mm"] = { "<cmd>lua require('treesj').toggle()<CR>", "toogle array" },

    ["<leader>ma"] = { "<cmd> :lua require('harpoon.mark').replace_file(4) <CR>", "replace harpoon 4" },
    ["<leader>ms"] = { "<cmd> :lua require('harpoon.mark').replace_file(3) <CR>", "replace harpoon 3" },
    ["<leader>md"] = { "<cmd> :lua require('harpoon.mark').replace_file(2) <CR>", "replace harpoon 2" },
    ["<leader>mf"] = { "<cmd> :lua require('harpoon.mark').replace_file(1) <CR>", "replace harpoon 1" },
    ["<C-e>"] = { "<cmd> :lua require('harpoon.ui').toggle_quick_menu() <CR>", "harpoon ui" },

    ["<A-f>"] = { "<cmd> :lua require('harpoon.ui').nav_file(1) <CR>", "Harpoon swtich 1" },
    ["<A-d>"] = { "<cmd> :lua require('harpoon.ui').nav_file(2) <CR>", "Harpoon swtich 2" },
    ["<A-s>"] = { "<cmd> :lua require('harpoon.ui').nav_file(3) <CR>", "Harpoon swtich 3" },
    ["<A-a>"] = { "<cmd> :lua require('harpoon.ui').nav_file(4) <CR>", "Harpoon swtich 4" },
  },

  v = {
    ["<leader>j"] = { "<cmd> :normal! zz <CR>", "Center buffer on cursor" },

    ["<leader>rw"] = { "<esc><cmd>lua require('spectre').open_visual()<CR>", "Search current word" },

    ["<leader>fm"] = {
      function()
        require("conform").format {
          lsp_fallback = true,
          async = false,
          timeout_ms = 500,
        }
      end,
      "Format file or range (in visual mode)",
    },
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<C-_>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

M.git = {
  n = {
    ["<leader>gc"] = { "<cmd>Telescope git_commits<CR>", "  Git commits" },
    ["<leader>gb"] = { "<cmd>Telescope git_branches<CR>", "  Git branches" },
    ["<leader>gs"] = { "<cmd>Telescope git_status<CR>", "  Git status" },
    ["<leader>gg"] = { "<cmd>LazyGit<CR>", "  LazyGit" },
    ["<leader>gl"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "  Blame line",
    },
    ["<leader>gvd"] = { "<cmd> DiffviewOpen<CR>", "  Show git diff" },
    ["<leader>gvf"] = { "<cmd> DiffviewFileHistory %<CR>", "  Show file history" },
    ["<leader>gvp"] = { "<cmd> DiffviewOpen --cached<CR>", "  Show staged diffs" },
    ["<leader>gvr"] = { "<cmd> DiffviewRefresh<CR>", "  Refresh diff view" },
    ["<leader>gvc"] = { "<cmd> DiffviewClose<CR>", "  Close diff view" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    -- find
    ["<leader>fk"] = { "<cmd>Telescope keymaps<CR>", " Find keymaps" },
    ["<leader>."] = { "<cmd> Telescope find_files <CR>", "Find files" },
    ["<leader>ff"] = { "<cmd> Telescope frecency workspace=CWD <CR>", "Find files" },
    ["<leader>fa"] = { "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fd"] = {
      "<cmd> Telescope find_files follow=true no_ignore=true hidden=true cwd=~/dotfiles_telescope/ depth=1<CR>",
      "Find dotfiles",
    },
    ["<leader>o"] = { "<cmd> FzfLua files cwd=~ <CR>", "Find all" },
    ["<leader>fw"] = { "<cmd> Telescope live_grep <CR>", "Live grep" },
    ["<leader>b"] = { "<cmd> Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd> Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd> Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>/"] = { "<cmd> Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<leader>fu"] = { "<cmd> Telescope undo <CR> ", "Find in undo tree" },
    ["<leader>fl"] = { "<cmd> Telescope flutter commands <CR> ", "flutter command" },

    -- ["cd"] = { "<cmd> Telescope file_browser <CR>", "file browser in cwd" },

    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "Find projects" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    -- ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
  },
}

M.session = {
  n = {
    ["<leader>sl"] = {
      function()
        require("nvim-possession").list()
      end,
      " List session",
    },
    ["<leader>sn"] = {
      function()
        require("nvim-possession").new()
      end,
      " New session",
    },
    ["<leader>su"] = {
      function()
        require("nvim-possession").update()
      end,
      " Update session",
    },
    ["<leader>sd"] = {
      function()
        require("nvim-possession").delete()
      end,
      " Delete session",
    },
  },
}

M.diagnostics = {
  n = {
    ["<leader>tt"] = { "<cmd>Trouble diagnostics toggle<cr>", "󰔫 Toggle warnings" },
    ["<leader>td"] = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME,BUG,TEST,NOTE<cr>", " Todo/Fix/Fixme" },
  },
}

M.octo = {
  n = {
    ["<leader>gpl"] = { "<cmd> :Octo pr list <CR><CR>", "🐙 List all pull requests" },
    ["<leader>gpc"] = { "<cmd> :Octo pr create <CR>", "🐙 create a pull request" },
  },
}

M.color_picker = {
  n = {
    ["<leader>cp"] = { "<cmd> Colortils <CR>", "Color picker" },
    ["<leader>cl"] = { "<cmd> Colortils lighten <CR>", "Color lighten" },
    ["<leader>cd"] = { "<cmd> Colortils darken <CR>", "Color darken" },
  },
}

M.dap = {
  n = {
    ["<leader>ds"] = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint" },
    ["<leader>dc"] = { "<cmd>DapDisconnect<CR>", "close dapui" },
    ["<leader>dm"] = { "<cmd>DapContinue<CR>", "DAP continue" },
    ["<down>"] = { "<cmd>DapStepInto<CR>", "DAP stepInto" },
    ["<leader>dk"] = { "<cmd>DapStepOut<CR>", "DAP Step Out" },
    ["<up>"] = { "<cmd>DapStepOver<CR>", "DAP Step Over" },
    ["<leader>da"] = { "<cmd>lua require('dapui').elements.watches.add()<CR>", "watcher add" },
    ["<leader>dr"] = { "<cmd>lua require('dapui').elements.watches.remove()<CR>", "watcher remove" },
    ["<leader>de"] = { "<cmd>lua require('dapui').elements.watches.edit()<CR>", "watcher edit" },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dd"] = {
      "<cmd> lua require('dap-python').test_class() <CR>",
      "Test method",
    },
  },
}

vim.keymap.set({ "o", "x" }, "ac", '<cmd>lua require("various-textobjs").cssColor("outer")<CR>')
vim.keymap.set({ "o", "x" }, "ic", '<cmd>lua require("various-textobjs").cssColor("inner")<CR>')
vim.keymap.set({ "o", "x" }, "an", '<cmd>lua require("various-textobjs").number("outer")<CR>')
vim.keymap.set({ "o", "x" }, "in", '<cmd>lua require("various-textobjs").number("inner")<CR>')
vim.keymap.set({ "o", "x" }, "aa", '<cmd>lua require("various-textobjs").indentation("outer", "outer")<CR>')
vim.keymap.set({ "o", "x" }, "ii", '<cmd>lua require("various-textobjs").indentation("inner", "inner")<CR>')
vim.keymap.set({ "o", "x" }, "iv", '<cmd>lua require("various-textobjs").value("inner")<CR>')
vim.keymap.set({ "o", "x" }, "av", '<cmd>lua require("various-textobjs").value("outer")<CR>')
vim.keymap.set({ "o", "x" }, "ik", '<cmd>lua require("various-textobjs").key("inner")<CR>')
vim.keymap.set({ "o", "x" }, "ak", '<cmd>lua require("various-textobjs").key("outer")<CR>')

vim.keymap.set({ "o", "x" }, "o", "iw")
vim.keymap.set({ "x" }, "m", "o")
vim.keymap.set("v", "(", "<Plug>(nvim-surround-visual)" .. "(")
vim.keymap.set("v", "{", "<Plug>(nvim-surround-visual)" .. "{")
vim.keymap.set("v", "[", "<Plug>(nvim-surround-visual)" .. "[")
vim.keymap.set("v", '"', "<Plug>(nvim-surround-visual)" .. '"')
vim.keymap.set({ "o", "x" }, "O", '<cmd>lua require("various-textobjs").subword("inner")<CR>')
vim.keymap.set({ "o", "x" }, "q", '<cmd>lua require("various-textobjs").toNextQuotationMark()<CR>')
vim.keymap.set({ "o", "x" }, "]", '<cmd>lua require("various-textobjs").toNextClosingBracket()<CR>')
vim.keymap.set({ "o", "x" }, "'", '<cmd>lua require("various-textobjs").anyQuote("inner")<CR>')

-- vim.keymap.set("n", "<leader>cj", function()
--   require("tiny-code-action").code_action()
-- end, { noremap = true, silent = true })

local keymap = vim.keymap.set

keymap({ "n", "v" }, "<Leader>cb", "<Cmd>CBccbox<CR>", opts)
keymap({ "n", "v" }, "<Leader>ct", "<Cmd>CBllline<CR>", opts)
keymap("n", "<Leader>cl", "<Cmd>CBline<CR>", opts)
keymap({ "n", "v" }, "<Leader>cm", "<Cmd>CBllbox14<CR>", opts)
keymap({ "n", "v" }, "<Leader>cd", "<Cmd>CBd<CR>", opts)

vim.keymap.set("n", "<C-]>", "3<C-e>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-[>", "3kzz", { noremap = true, silent = true })
keymap({ "v" }, "r", "r")

vim.keymap.set("n", "[", "zj", { noremap = true, nowait = true })
vim.keymap.set("n", "]", "zk", { noremap = true, nowait = true })

return M
