return {
  "lewis6991/gitsigns.nvim",

  -- Load when a buffer is opened
  event = { "BufReadPost", "BufNewFile", "BufEnter" },
  cmd = "Gitsigns",
  opts = function()
    -- Explicitly enable signs and sensible defaults so the plugin attaches
    -- and shows signs when a file is opened without needing to toggle.
    return require("gitsigns").setup({
      attach_to_untracked = true,
      current_line_blame = false,
    })
  end,
}
