-- Steal basic settings from vimrc
vim.cmd("source ~/.vimrc")

-- Other colour schemes
-- Colour themes - stock
-- Good
vim.cmd([[colorscheme retrobox]])
-- vim.cmd([[colorscheme habamax]])
-- Eh
-- vim.cmd([[colorscheme desert]])

-- Colour themes - extensions
-- Good
-- vim.cmd([[colorscheme synthweave]])
-- vim.cmd([[colorscheme carbonfox]])
-- Eh
-- vim.cmd([[colorscheme onedark]])
-- vim.cmd([[colorscheme unokai]])

-- LSP setup -------------------------------------------------------------------
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = { current_line = true },
})
