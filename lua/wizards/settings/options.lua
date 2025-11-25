-- Steal basic settings from vimrc
-- TODO fix this breaking planet previews in telescope
-- TODO fix not being able to open planet files in telescope
vim.cmd("source ~/.vimrc")

-- Override colorscheme from vimrc
vim.opt.termguicolors = true
vim.cmd([[ colorscheme retrobox ]])

-- TODO turn on neovim news.txt
-- TODO make // TODO comments warnings in the LSPs?
-- TODO floating text at end of line for clang and other LSP diagnostics
