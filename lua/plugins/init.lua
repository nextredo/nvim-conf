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

  -- this opts will extend the default opts
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
        -- misc
        "vim", "vimdoc",
        "markdown",
        "regex",

        -- config
        "dockerfile", "yaml",
        "json",

        -- git
        "git_config", "git_rebase", "gitattributes", "gitignore",

        -- languages
        -- "html", "css",
        "lua",
        "bash",
        "c", "cpp",
        -- "rust",

        -- go
        -- "go",
        -- "gomod",
        -- "gosum",
        -- "gowork",
        -- "gotmpl",
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
        -- "html-lsp", "css-lsp" ,  -- "prettier",
        -- "black",
        "clang-format", "clangd", "cpplint",
      },
    },
  },


  -- If your opts uses a function call ex: require*, then make opts spec a function
  -- should return the modified default config as well
  -- here we just call the default telescope config
  -- And edit its mappinsg
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   opts = function()
  --     local conf = require "nvchad.configs.telescope"

  --     conf.defaults.mappings.i = {
  --       ["<C-j>"] = require("telescope.actions").move_selection_next,
  --       ["<Esc>"] = require("telescope.actions").close,
  --     }

  --    -- or
  --    -- table.insert(conf.defaults.mappings.i, your table)

  --     return conf
  --   end,
  -- }
}

return plugins
