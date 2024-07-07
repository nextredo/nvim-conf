require "nvchad.options"

-- Things to counteract wack NvChad settings
-- can be found both in ~/.vimrc and here

-- Steal basic settings from vimrc
vim.cmd("source ~/.vimrc")

-- Override colorscheme in vimrc
vim.cmd([[ colorscheme retrobox ]])

-- https://vi.stackexchange.com/questions/37421/how-to-remove-neovim-trailing-white-space
-- vim.api.nvim_create_autocmd({ "BufWritePre" }, {
--     pattern = {"*"},
--     callback = function()
--       local save_cursor = vim.fn.getpos(".")
--       pcall(function() vim.cmd [[%s/\s\+$//e]] end)
--       vim.fn.setpos(".", save_cursor)
--     end,
-- })
