return {
  "williamboman/mason.nvim",
  cmd = "Mason",
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
