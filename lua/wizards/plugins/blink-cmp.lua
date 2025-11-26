return {
  "saghen/blink.cmp",
  build = 'cargo build --release',
  opts = function()
    return require("blink.cmp").setup({
      signature = { enabled = true },
      fuzzy = {
        -- TODO this should ideally be rust instead
        -- implementation = 'prefer_rust',
        implementation = 'lua',
      },
    })
  end,
}
