return {
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
}
