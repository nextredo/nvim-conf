return {
  "saghen/blink.cmp",
  -- lazy = true,
  -- build = 'cargo build --release',
  opts = function()
    return require("blink.cmp").setup({
        signature = { enabled = true },
    })
  end,
}
