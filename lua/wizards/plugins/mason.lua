return {
  "mason-org/mason.nvim",
  lazy = true,
  cmd = "Mason",
  opts = function()
    return require("mason").setup()
  end,

  --[[
  -- Old installation requirements
  opts = {
    ensure_installed = {
      "lua-language-server", "stylua",
      "html-lsp", "css-lsp",
      "prettier",
      "black",
      "clang-format", "clangd", "cpplint",
    },
  },
  ]]--
}
