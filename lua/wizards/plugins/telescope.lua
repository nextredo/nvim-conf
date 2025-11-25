return {
  "nvim-telescope/telescope.nvim",
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
