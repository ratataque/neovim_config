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
  -- provider = "deepseek",
  provider = "copilot-gpt41",
  mode = "legacy",
  providers = {
    ["claude_4_thinking"] = {
      __inherited_from = "claude",
      model = "claude-sonnet-4-20250514",
      display_name = "Claude 4 (Sonnet) with thinking",
      pro = {
        thinking = {
          type = "enabled",
          budget_tokens = 2048,
        },
        temperature = 1,
      },
      disable_tools = true,
    },
    ["claude_4"] = {
      __inherited_from = "claude",
      model = "claude-sonnet-4-20250514",
      display_name = "Claude 4 (Sonnet)",
      thinking = {
        type = "disabled",
      },
      disable_tools = true,
    },
    ["claude_haiku"] = {
      __inherited_from = "claude",
      model = "claude-3-5-haiku-latest",
      display_name = "Claude 3.5 (Haiku)",
      disable_tools = true,
    },
    ["copilot-claude4"] = {
      __inherited_from = "copilot",
      model = "claude-sonnet-4",
      display_name = "Copilot custom (Claude Sonnet 4)",
      disable_tools = true,
      pro = {
        thinking = {
          type = "disabled",
        },
      },
    },
    ["copilot-claude4-thinking"] = {
      __inherited_from = "copilot",
      model = "claude-4-sonnet",
      display_name = "Copilot custom (Claude Sonnet 4 thinking)",
      disable_tools = true,
      pro = {
        thinking = {
          type = "enabled",
        },
      },
    },
    ["copilot-gpt41"] = {
      __inherited_from = "copilot",
      model = "gpt-4.1",
      display_name = "Copilot custom (GPT-4.1)",
      disable_tools = true,
      pro = {
        thinking = {
          type = "disabled",
        },
      },
    },
    -- ["deepseek_coder_v2_lite_instruct_Q5_K_S"] = {
    --   __inherited_from = "ollama",
    --   display_name = "DeepSeek Coder V2 Lite Instruct GGUF:Q5_K_S",
    --   model = "hf.co/bartowski/DeepSeek-Coder-V2-Lite-Instruct-GGUF:Q5_K_S",
    --   disable_tools = true,
    -- },
    -- ["deepseek_coder_v2_lite_instruct_IQ4_XS"] = {
    --   __inherited_from = "ollama",
    --   display_name = "DeepSeek Coder V2 Lite Instruct GGUF:IQ4_XS",
    --   model = "hf.co/bartowski/DeepSeek-Coder-V2-Lite-Instruct-GGUF:IQ4_XS",
    --   disable_tools = true,
    --   max_tokens = 512,
    --   options = {
    --     num_ctx = 0,
    --   },
    -- },
  },
}
