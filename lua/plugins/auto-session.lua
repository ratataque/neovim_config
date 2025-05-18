return {
  {
    "rmagatti/auto-session",
    lazy = false,

    opts = {
      suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      -- log_level = 'debug',
      auto_create = false,
      root_dir = os.getenv "NVIM_SESSIONS",
    },
  },
}
