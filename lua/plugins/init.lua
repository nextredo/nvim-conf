-- From https://nvchad.com/docs/config/plugins
-- These values here extend the defaults from nvchad in
-- its mason package, under lua/nvchad/plugins/init.lua

local plugins = {

  -- {
  --   "stevearc/conform.nvim",
  --   event = 'BufWritePre', -- uncomment for format on save
  --   config = function()
  --   --   require "configs.conform"
  --     require("conform").setup({
  --       format_on_save = {
  --         -- These options will be passed to conform.format()
  --         timeout_ms = 500,
  --         lsp_fallback = true,
  --       },
  --   })
  --   end,
  -- },

  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    opts = {
      auto_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      ensure_installed = {
        -- misc / docs
        "vim", "vimdoc",
        "markdown",
        "regex",

        -- config
        "dockerfile",
        "json", "ini", "yaml",

        -- git
        "git_config", "git_rebase",
        "gitattributes", "gitignore",
        "gitcommit",

        -- web
        "html", "css",

        -- system
        "bash",

        -- embedded
        "lua",
        "c", "cpp",
        "llvm",
        "arduino",
        "rust",

        -- language support
        "comment",
        "doxygen",
        "printf",

        -- go
        "go",
        "gomod",
        "gosum",
        "gowork",
        "gotmpl",
      },
    },
  },


  -- https://stackoverflow.com/questions/78552104/how-to-configure-the-angular-language-server-in-nvchad-for-a-nx-monorepo
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },


  {
    "williamboman/mason.nvim",
    -- lazy = false,
    opts = {
      ensure_installed = {
        "lua-language-server", "stylua",
        -- "html-lsp", "css-lsp",
        -- "prettier",
        -- "black",
        "clang-format", "clangd", "cpplint",
      },
    },
  },

} -- plugins table

return plugins
