return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  dependencies = { "nvim-lua/plenary.nvim" },

  -- TODO make the <leader>sd diagnostic list a bit nicer to read
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
