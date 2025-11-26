# NVIM Config

## Goals for this config
- Minimal, but makes nvim an IDE rather than just an editor
  - Keeps it fast
  - Less bloated, more stable, more maintainable
- Change as few mappings as possible (unless they're really dumb ones)
  - Keeps keybindings portable to standard nvim (and maybe vim/vi)

## Some TODO's
- [ ] Make this repo not a fork
- [ ] Eventually be able to open the files from `:Telescope planets` in their full glory
- [ ] Spellcheck pls
- [ ] Deselect current search on esc
- [ ] Stuff in [`plugins/README.md`](./lua/wizards/plugins/README.md)
- [ ] Readup on [kickstart.nvim][ksnvim], steal ideas from it?
- [ ] Show nvim `news.txt` on startup when necessary
- [ ] Splash screen with ascii art on startup

### Low priority
- [ ] Move LSP custom configs into the `lsp/` directory
- [ ] Floating text (end of line) for LSP diagnostics

## Fun commands
- See [mappings.lua](./lua/wizards/settings/mappings.lua)
- `:Tutor`

## See also
- [this doc](./lua/plugins/README.md)

## References
- [ThePrimeagen's nvim config](https://github.com/ThePrimeagen/init.lua)
- [Lazy package manager](https://lazy.folke.io/)

[ksnvim]: https://github.com/nvim-lua/kickstart.nvim
