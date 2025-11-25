return {
  "lewis6991/gitsigns.nvim",
  event = "User FilePost",
  cmd = "Gitsigns",
  opts = function()
    return require("gitsigns").setup()
  end,
}
