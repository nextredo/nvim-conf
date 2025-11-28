# NVIM Config

## Goals for this config

- Minimal, but makes nvim an IDE rather than just an editor
  - Keeps it fast
  - Less bloated, more stable, more maintainable
- Change as few mappings as possible (unless they're really dumb ones)
  - Keeps keybindings portable to standard nvim (and maybe vim/vi)

## Some TODO's

## High priority

- [ ] Make LSP autocomplete better
  - Doesn't work super well atm - hard to differentiate functions from other things like namespaces etc.
  - Need fuzzy finding for autocompletion plss
  - Way of viewing fields in a struct
  - Viewing docs as well as signatures while writing it
  - Just spin up old nvchad config, see how it behaves with the LSP
  - Less priority on random text, needs to lock in a bit harder on locals etc.
  - Icons don't differentiate it super well to be honest

## Med priority

- [ ] Investigate using a different distro
  - Tried NvChad, now try others
  - LunarVim, LazyVim
  - [kickstart.nvim][ksnvim]
  - SpaceVim? Not maintained anymore afaik
  - See [popular configs here](https://dotfyle.com/neovim/configurations/top)
- [ ] Make this repo not a fork
- [ ] Eventually be able to open the files from `:Telescope planets` in their full glory
- [ ] Spellcheck pls
- [ ] Deselect current search on esc
- [ ] Stuff in [`plugins/README.md`](./lua/wizards/plugins/README.md)
- [ ] Show nvim `news.txt` on startup when necessary
- [ ] Splash screen with ascii art on startup
- [ ] Doxygen highlighting in C++

### Low priority

- [ ] Move LSP custom configs into the `lsp/` directory
- [ ] Floating text (end of line) for LSP diagnostics

## Fun commands

- See [mappings.lua](./lua/wizards/settings/mappings.lua)
- `:Tutor`
- `:map`

## Helpful keybinds

- `CTRL-S` (insert mode)
  - LSP signature help

## See also

- [this doc](./lua/plugins/README.md)

## References

- [ThePrimeagen's nvim config](https://github.com/ThePrimeagen/init.lua)
- [Lazy package manager](https://lazy.folke.io/)

[ksnvim]: https://github.com/nvim-lua/kickstart.nvim
