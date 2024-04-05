local M = {}
local opts = { noremap = true, silent = true }

M.disabled = {
  ["z"] = "",
  ["<C-u>"] = "",
  ["<leader>n"] = "",
  ["<tab>"] = "",
  ["<leader>v"] = "",
}

M.text = {
  i = {
    ["<C-Up>"] = { "<cmd> :m-2<CR>", " Move up" },
    ["<C-Down>"] = { "<cmd> :m+<CR>", " Move down" },
  },

  n = {
    ["<C-Up>"] = { "<cmd> :m-2<CR>", " Move up" },
    ["<C-Down>"] = { "<cmd> :m+<CR>", " Move down" },
    ["<C-w>v"] = { "<C-w>v<left> <cmd> lua require('nvchad.tabufline').tabuflineNext() <CR>" },
  },

  v = {
    -- ["<C-k"] = { "<cmd> :m '<-2<CR>gv=gv", "󰜸 Move selection up", opts = { silent = true } },
    -- ["<C-j>"] = { "<cmd> :m '>+1<CR>gv=gv", "󰜯 Move selection down", opts = { silent = true } },
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
    ["<leader>rd"] = { ":lua require('neogen').generate()<CR>", "Gen doc", opts = opts },
    ["<leader>rt"] = { ":lua require('neogen').generate({type = 'type'})<CR>", "Gen doc for type", opts = opts },

    ["<leader>j"] = { "<cmd> :normal! zz <CR>", "Center buffer on cursor" },

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

    ["<leader>a"] = { "<cmd> :lua require('harpoon.mark').add_file() <CR>", "add harpoon" },
    ["<C-e>"] = { "<cmd> :lua require('harpoon.ui').toggle_quick_menu() <CR>", "harpoon ui" },

    ["<A-f>"] = { "<cmd> :lua require('harpoon.ui').nav_file(1) <CR>", "Harpoon swtich 1" },
    ["<A-d>"] = { "<cmd> :lua require('harpoon.ui').nav_file(2) <CR>", "Harpoon swtich 2" },
    ["<A-s>"] = { "<cmd> :lua require('harpoon.ui').nav_file(3) <CR>", "Harpoon swtich 3" },
    ["<A-a>"] = { "<cmd> :lua require('harpoon.ui').nav_file(4) <CR>", "Harpoon swtich 4" },
  },

  v = {
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

  x = {
    ["<leader>p"] = { '"_dp', "paste du sale" },
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

    ["cd"] = { "<cmd> Telescope file_browser <CR>", "file browser in cwd" },

    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "Find projects" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- pick a hidden term
    ["<leader>pt"] = { "<cmd> Telescope terms <CR>", "Pick hidden term" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },

    ["<leader>ma"] = { "<cmd> Telescope marks <CR>", "telescope bookmarks" },
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
    ["<leader>t"] = { "<cmd>TroubleToggle<cr>", "󰔫 Toggle warnings" },
    ["<leader>td"] = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME,BUG,TEST,NOTE<cr>", " Todo/Fix/Fixme" },
  },
}

M.octo = {
  n = {
    ["<leader>gpl"] = { "<cmd> :Octo pr list <CR><CR>", "🐙 List all pull requests" },
    ["<leader>gpc"] = { "<cmd> :Octo pr create <CR>", "🐙 create a pull request" },
  },
}

return M
