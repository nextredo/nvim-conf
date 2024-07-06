require "nvchad.options"

-- Things to counteract wack NvChad settings
vim.cmd([[
    set shiftwidth=4
    set tabstop=4
    set softtabstop=4

    " Default clipboard
    set clipboard="autoselect,exclude:cons|linux"

    set nowrap

    " Render leading whitespace & invisble characters
    set listchars+=multispace:·
    set listchars+=lead:·
    set listchars+=leadmultispace:·
    set listchars+=trail:·
    set listchars+=tab:→▹
    set listchars+=extends:>
    set listchars+=precedes:<
    set listchars+=conceal:⭓
    set listchars+=nbsp:▵
    set list
]])

-- Steal basic settings from vimrc
vim.cmd("source ~/.vimrc")

-- Good: Desert, evening, slate, sorbet
-- Ok: Zaibatsu
vim.cmd([[ colorscheme retrobox ]])

-- https://vi.stackexchange.com/questions/37421/how-to-remove-neovim-trailing-white-space
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = {"*"},
    callback = function()
      local save_cursor = vim.fn.getpos(".")
      pcall(function() vim.cmd [[%s/\s\+$//e]] end)
      vim.fn.setpos(".", save_cursor)
    end,
})
