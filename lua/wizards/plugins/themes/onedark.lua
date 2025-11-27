return {
  "https://github.com/navarasu/onedark.nvim",
  lazy = false,
  opts = function()
    return require("onedark").setup({ style="warmer" })
  end
}
