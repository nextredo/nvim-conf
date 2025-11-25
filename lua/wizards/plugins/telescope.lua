return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },

  -- TODO more settings
  opts = {
    pickers = {
      oldfiles = {
        cwd_only = true,
      },
    },
  },
}
