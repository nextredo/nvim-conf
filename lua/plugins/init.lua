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
        "html", "css", "javascript",

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

  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    opts = {
      pickers = {
        oldfiles = {
          cwd_only = true,
        },
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

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      disable_netrw = false,
      hijack_netrw  = false,
      view = {
        width = 30,
      },
      filters = {
        enable = false,
        git_ignored = false,
      },
      update_focused_file = {
        enable = true,
        update_root = {
          enable = true,
        },
      },
    },
  },

  {
    "godlygeek/tabular",
    lazy = false,
  },

} -- plugins table

return plugins
