return {
  -- Use current working directory for all operations
  root_dir = function()
    return vim.fn.getcwd()
  end,
  -- Override file selector behavior
  file_selector = {
    provider_opts = {
      get_filepaths = function(params)
        local pwd = vim.fn.getcwd()
        local cmd = string.format("fd --base-directory '%s' --hidden", vim.fn.fnameescape(pwd))
        return vim.fn.systemlist(cmd)
      end,
    },
  },
  -- Ensure AI context uses current directory
  ai_provider = {
    context_directory = function()
      return vim.fn.getcwd()
    end,
  },
  mappings = {
    -- ask = "<leader>a",
    -- toggle = "<leader>a",
    -- clear = "<leader>ac",
    -- edit = "<leader>ie",
    -- refresh = "<leader>ir",
  },
  behaviour = {
    support_paste_from_clipboard = true,
  },
  hints = {
    enabled = false,
  },
  windows = {
    edit = {
      start_insert = true, -- Start insert mode when opening the edit window
    },
    ask = {
      floating = false, -- Open the 'AvanteAsk' prompt in a floating window
      start_insert = false, -- Start insert mode when opening the ask window
      ---@type "ours" | "theirs"
      focus_on_apply = "ours", -- which diff to focus after applying
    },
  },
  -- provider = "deepseek",
  provider = "claude_haiku",
  vendors = {
    -- deepseek = {
    --   __inherited_from = "openai",
    --   api_key_name = "DEEPSEEK_API_KEY",
    --   endpoint = "https://api.deepseek.com",
    --   model = "deepseek-coder",
    -- },
    ["claude_37_tools_think"] = {
      provider = "anthropic",
      endpoint = "https://api.anthropic.com",
      model = "claude-3-7-sonnet-20250219",
      thinking = {
        type = "enable",
        budget_tokens = 2048,
      },
      temperature = 1,
    },
    ["claude_37"] = {
      provider = "anthropic",
      endpoint = "https://api.anthropic.com",
      model = "claude-3-7-sonnet-20250219",
      thinking = {
        type = "disable",
      },
      disable_tools = true,
    },
    ["claude_haiku_tools"] = {
      provider = "anthropic",
      endpoint = "https://api.anthropic.com",
      model = "claude-3-5-haiku-latest",
      disable_tools = false,
    },
    ["claude_haiku"] = {
      provider = "anthropic",
      endpoint = "https://api.anthropic.com",
      model = "claude-3-5-haiku-latest",
      disable_tools = true,
    },
  },
}
