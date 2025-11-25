-- Steal basic settings from vimrc
vim.cmd("source ~/.vimrc")

-- Override colorscheme from vimrc
vim.opt.termguicolors = true
vim.cmd([[ colorscheme retrobox ]])
