# Minimal script to change the c commentstring from /**/ to // for C
# Since /**/ comments can't be nested, makes life easier

# Addressed in PR #29085 <https://github.com/neovim/neovim/pull/29085>
# Issue           #29075 <https://github.com/neovim/neovim/issues/29079>
# <https://github.com/neovim/neovim/>

sudo sed -i "s/vim.bo.commentstring.*/vim.bo.commentstring = '\/\/ \%s'/" /usr/share/nvim/runtime/ftplugin/c.lua
