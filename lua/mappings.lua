require "nvchad.mappings"

-- add yours here

local s = {} -- sections definitions
local opts = { noremap = true, silent = true }

s.original = {
  n = {
    ["<tab>"] = { "<C-i>", "tab" },
    ["<C-i>"] = { "<C-i>", "return" },
  },
}

s.text = {
  i = {
    ["<C-b>"] = { "<ESC>^i", "Beginning of line" },
    ["<C-e>"] = { "<End>", "End of line" },

    ["<C-v>"] = { "<ESC>pi", "End of line" },

    ["<C-h>"] = { "<Backspace>", "Backspace" },
    ["<C-l>"] = { "<Delete>", "Delete" },

    -- ["<C-Up>"] = { "<cmd> :m-2<CR>", " Move up" },
    -- ["<C-Down>"] = { "<cmd> :m+<CR>", " Move down" },
  },

  v = {
    ["<C-j>"] = { ":m '>+1<CR> gv=gv", " Move up" },
    ["<C-k>"] = { ":m '<-2<CR> gv=gv", " Move down" },
  },
}

s.general = {
  n = {
    ["<A-x>"] = { "<C-w>c", "Window close" },
    ["<A-e>"] = { "<cmd> qa<CR>", "Exit" },

    [":"] = { "<CMD> Telescope cmdline <CR>", "fzf commande" },
    ["<leader>j"] = { "<cmd> :normal! zz <CR>", "Center buffer on cursor" },

    ["<C-_>"] = { "gcc", "Toggle comment", opts = { remap = true } },
    -- ["<leader>rw"] = { "<esc><cmd>lua require('spectre').open_visual()<CR>", "Search current word" },
  },

  v = {
    ["m"] = { "o", "switch end visual" },

    ["<Up>"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    ["<Down>"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["<"] = { "<gv", "Indent line" },
    [">"] = { ">gv", "Indent line" },

    ["<C-_>"] = {
      "gc",
      "Toggle comment",
      opts = { remap = true },
    },
  },

  x = {
    ["o"] = { "iw", "replace word" },

    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
    -- Don't copy the replaced text after pasting in visual mode
    -- https://vim.fandom.com/wiki/Replace_a_word_with_yanked_text#Alternative_mapping_for_paste
    ["p"] = { 'p:let @+=@0<CR>:let @"=@0<CR>', "Dont copy replaced text", opts = { silent = true } },
  },

  c = {
    ["<C-k>"] = { "<C-p>", "nav prev " },
    ["<C-j>"] = { "<C-n>", "nav next " },
  },
}

s.buffer = {
  n = {
    ["<leader>x"] = { "<CMD> bd <CR>", "nav next " },
  },
}

s.avante = {
  n = {
    ["<leader>e"] = { "<cmd> AvanteToggle <CR>", "avante toggle" },
    ["<leader>ao"] = { "<cmd> AvanteClear <CR>", "avante clear" },
  },
}

s.movement = {
  n = {
    ["j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", opts = { expr = true } },
    ["k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", opts = { expr = true } },
  },
}

s.run = {
  n = {
    ["<leader>rh"] = { "<cmd> Rest run <CR>", "run http on cursor" },
  },
}

s.git = {
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

s.session = {
  n = {
    ["<leader>sl"] = { "<CMD>SessionSearch<CR>", " List session" },
    ["<leader>sn"] = { "<CMD>SessionSave<CR>", " New session" },
    ["<leader>sd"] = { "<CMD>SessionDelete<CR>", " Delete session" },
  },
}

s.run = {
  n = {
    ["<leader>rr"] = { "<cmd>lua require('runner').run() <CR>", "run the current buffer" },
  },
}

s.fold = {
  n = {
    ["<leader>l"] = { "zA", " fold" },
    ["<leader>k"] = { "za", "toggle fold" },
    ["<leader>K"] = { "zRzz", "open all fold" },
    ["<leader>L"] = { "zMzz", "close all fold" },
    ["<leader>h"] = { "zMzvzz", "close all fold but the current one" },

    ["["] = { "zj", "next fold", opts = { nowait = true, noremap = true } },
    ["]"] = { "zk", "prev fold", opts = { nowait = true, noremap = true } },
  },
}

s.trouble = {
  n = {
    ["<leader>tt"] = { "<cmd>Trouble diagnostics toggle<cr>", "󰔫 Toggle warnings" },
    ["<leader>td"] = { "<cmd>TodoTrouble keywords=TODO,FIX,FIXME,BUG,TEST,NOTE<cr>", " Todo/Fix/Fixme" },
  },
}

s.color_picker = {
  n = {
    ["<leader>cp"] = { "<cmd> Colortils <CR>", "Color picker" },
    ["<leader>cl"] = { "<cmd> Colortils lighten <CR>", "Color lighten" },
    ["<leader>cd"] = { "<cmd> Colortils darken <CR>", "Color darken" },
  },
}

s.surround = {
  v = {
    ["("] = { "<Plug>(nvim-surround-visual)" .. "(", "Surround with ( " },
    ["{"] = { "<Plug>(nvim-surround-visual)" .. "{", "Surround with { " },
    ["["] = { "<Plug>(nvim-surround-visual)" .. "[", "Surround with [ " },
    ['"'] = { "<Plug>(nvim-surround-visual)" .. '"', 'Surround with " ' },
  },
}

s.dap = {
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

s.dap_python = {
  n = {
    ["<leader>dd"] = {
      "<cmd> lua require('dap-python').test_class() <CR>",
      "Test method",
    },
  },
}

s.zen = {
  n = {
    ["<leader>z"] = { ":lua require('zen-mode').toggle()<CR>", "Gen doc", opts = opts },
  },
}

s.text_object = {
  n = {
    ["<Down>"] = {
      "<cmd>lua require('nvim-treesitter.textobjects.move').goto_next_start('@function.outer')<CR>",
      "move to next function",
    },
    ["<Up>"] = {
      "<cmd>lua require('nvim-treesitter.textobjects.move').goto_previous_start('@function.outer')<CR>",
      "move to next function",
    },
  },
}

s.lazy = {
  n = {
    ["<leader>la"] = { "<cmd> Lazy <CR>", "Lazy" },
  },
}

s.harpoon = {
  n = {
    ["<A-f>"] = { "<cmd> :lua require('harpoon.ui').nav_file(1) <CR>", "Harpoon swtich 1" },
    ["<A-d>"] = { "<cmd> :lua require('harpoon.ui').nav_file(2) <CR>", "Harpoon swtich 2" },
    ["<A-s>"] = { "<cmd> :lua require('harpoon.ui').nav_file(3) <CR>", "Harpoon swtich 3" },
    ["<A-a>"] = { "<cmd> :lua require('harpoon.ui').nav_file(4) <CR>", "Harpoon swtich 4" },

    ["<leader>ma"] = { "<cmd> :lua require('harpoon.mark').replace_file(4) <CR>", "replace harpoon 4" },
    ["<leader>ms"] = { "<cmd> :lua require('harpoon.mark').replace_file(3) <CR>", "replace harpoon 3" },
    ["<leader>md"] = { "<cmd> :lua require('harpoon.mark').replace_file(2) <CR>", "replace harpoon 2" },
    ["<leader>mf"] = { "<cmd> :lua require('harpoon.mark').replace_file(1) <CR>", "replace harpoon 1" },
    ["<C-e>"] = { "<cmd> :lua require('harpoon.ui').toggle_quick_menu() <CR>", "harpoon ui" },
  },

  i = {
    ["<A-f>"] = { "<cmd> :lua require('harpoon.ui').nav_file(1) <CR>", "Harpoon swtich 1" },
    ["<A-d>"] = { "<cmd> :lua require('harpoon.ui').nav_file(2) <CR>", "Harpoon swtich 2" },
    ["<A-s>"] = { "<cmd> :lua require('harpoon.ui').nav_file(3) <CR>", "Harpoon swtich 3" },
    ["<A-a>"] = { "<cmd> :lua require('harpoon.ui').nav_file(4) <CR>", "Harpoon swtich 4" },
  },
}

s.neogen = {
  n = {
    ["<leader>rd"] = { "<CMD> lua require('neogen').generate()<CR>", "Gen doc", opts = opts },
    ["<leader>rt"] = { "<CMD> require('neogen').generate({type = 'type'})<CR>", "Gen doc for type", opts = opts },
  },
}

s.telescope = {

  n = {
    -- find
    ["<leader>fk"] = { "<cmd>Telescope keymaps<CR>", " Find keymaps" },
    ["<leader>."] = { "<cmd>Telescope find_files <CR>", "Find files" },
    ["<leader>ff"] = { "<cmd>Telescope frecency workspace=CWD<CR>", "Find files", opts = opts },
    ["<leader>fa"] = { "<cmd>Telescope find_files follow=true no_ignore=true hidden=true <CR>", "Find all" },
    ["<leader>fd"] = {
      "<cmd> Telescope find_files follow=true no_ignore=true hidden=true cwd=~/dotfiles_telescope/ depth=1<CR>",
      "Find dotfiles",
    },
    ["<leader>o"] = { "<cmd>FzfLua files cwd=~ <CR>", "Find all" },
    ["<leader>fw"] = { "<cmd>Telescope live_grep <CR>", "Live grep" },
    ["<leader>b"] = { "<cmd>Telescope buffers <CR>", "Find buffers" },
    ["<leader>fh"] = { "<cmd>Telescope help_tags <CR>", "Help page" },
    ["<leader>fo"] = { "<cmd>Telescope oldfiles <CR>", "Find oldfiles" },
    ["<leader>/"] = { "<cmd>Telescope current_buffer_fuzzy_find <CR>", "Find in current buffer" },
    ["<leader>fu"] = { "<cmd>Telescope undo <CR> ", "Find in undo tree" },
    ["<leader>fl"] = { "<cmd>Telescope flutter commands <CR> ", "flutter command" },

    -- ["cd"] = { "<cmd> Telescope file_browser <CR>", "file browser in cwd" },

    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "Find projects" },

    -- git
    ["<leader>cm"] = { "<cmd> Telescope git_commits <CR>", "Git commits" },
    ["<leader>gt"] = { "<cmd> Telescope git_status <CR>", "Git status" },

    -- theme switcher
    ["<leader>th"] = { "<cmd> Telescope themes <CR>", "Nvchad themes" },
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
vim.keymap.set({ "o", "x" }, "O", '<cmd>lua require("various-textobjs").subword("inner")<CR>')
vim.keymap.set({ "o", "x" }, "q", '<cmd>lua require("various-textobjs").toNextQuotationMark()<CR>')
vim.keymap.set({ "o", "x" }, "]", '<cmd>lua require("various-textobjs").toNextClosingBracket()<CR>')
vim.keymap.set({ "o", "x" }, "'", '<cmd>lua require("various-textobjs").anyQuote("inner")<CR>')

for _, section in pairs(s) do
  for mode, mode_map in pairs(section) do
    for lhs, mapdef in pairs(mode_map) do
      -- mapdef = { rhs, desc, opts = { … } }
      local rhs, desc = mapdef[1], mapdef[2]
      local options = vim.tbl_deep_extend("force", mapdef.opts or {}, { desc = desc })
      vim.keymap.set(mode, lhs, rhs, options)
    end
  end
end
