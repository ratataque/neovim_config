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
  provider = "claude",
  mode = "legacy",
  claude = {
    endpoint = "https://api.anthropic.com",
    model = "claude-3-5-haiku-latest",
    disable_tools = true,
  },
  vendors = {
    -- deepseek = {
    --   __inherited_from = "openai",
    --   api_key_name = "DEEPSEEK_API_KEY",
    --   endpoint = "https://api.deepseek.com",
    --   model = "deepseek-coder",
    -- },
    ["claude_37_tools_think"] = {
      __inherited_from = "claude",
      model = "claude-3-7-sonnet-latest",
      display_name = "Claude 3.7 (Sonnet) with tools and thinking",
      thinking = {
        type = "enabled",
        budget_tokens = 2048,
      },
      disable_tools = true,
      temperature = 1,
    },
    ["claude_37"] = {
      __inherited_from = "claude",
      model = "claude-3-7-sonnet-latest",
      display_name = "Claude 3.7 (Sonnet)",
      thinking = {
        type = "disabled",
      },
      disable_tools = true,
    },
    ["claude_haiku_tools"] = {
      __inherited_from = "claude",
      model = "claude-3-5-haiku-latest",
      display_name = "Claude 3.5 (Haiku) with tools",
      disable_tools = false,
    },
    ["claude_haiku"] = {
      __inherited_from = "claude",
      model = "claude-3-5-haiku-latest",
      display_name = "Claude 3.5 (Haiku)",
      disable_tools = true,
    },
  },
}
