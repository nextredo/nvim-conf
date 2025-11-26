return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },

  opts = {
    -- Yoinked from NvChad's default config
    defaults = {
      layout_config = {
        horizontal = {
          -- prompt_position = "top",
          preview_width = 0.55,
        },
        width = 0.90,
        height = 0.84,
      },
    },
    pickers = {
      oldfiles = {
        cwd_only = true,
      },
      colorscheme = {
        enable_preview = true,
      },

      -- Making the diagnostics list (:Telescope diagnostics) nicer to read
      -- Stops the diagnostics sentence being cut off, ensures you can read it
      diagnostics = {
        -- wrap_results = true,
        line_width='full',
        layout_config = {
          horizontal = {
            preview_width = 0.40,
          },
        },
      }
    },
  },
}
