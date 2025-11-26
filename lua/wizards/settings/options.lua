-- Steal basic settings from vimrc
-- TODO change settings in it ig
vim.cmd("source ~/.vimrc")

-- Override colorscheme from vimrc
vim.opt.termguicolors = true
vim.cmd([[colorscheme retrobox]])

-- Other colour schemes
-- vim.cmd([[colorscheme habamax]])
-- vim.cmd([[colorscheme unokai]])

-- TODO turn on neovim news.txt
-- TODO make // TODO comments warnings in the LSPs?
-- TODO floating text at end of line for clang and other LSP diagnostics


-- LSP setup -------------------------------------------------------------------
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { current_line = true },
})
