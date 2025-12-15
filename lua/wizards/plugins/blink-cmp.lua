return {
  "saghen/blink.cmp",
  build = "cargo build --release",
  opts = function()
    return require("blink.cmp").setup({
      signature = { enabled = true },
      fuzzy = {
        -- implementation = "prefer_rust",
        implementation = "lua",
      },
      completion = {
        menu = {
          auto_show = true,
          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind", gap = 1 }
            },
          },
        },
        -- ghost_text = { enabled = true },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 0,
        },
      },
      snippets = { preset = "default", },
    })
  end,
}
