# LSP fanagling
## C/C++
### Clangd & Makefiles
- Notes for clangd
- Use [bear][bear] to build a compilation database
    - `make distclean -j$(nproc) && bear -- make -j$(nproc)`

### Clangd & GCC
- Follow [this tutorial][1] to fix clangd usage with a gcc codebase
    - Try to find where the system includes clang can't find are
        - echo '#include <cstdlib>' | g++ -xc - -H -v -fsyntax-only
        - gcc -E -v -xc++ /dev/null
    - Use the include directories from the last step in the next one
    - Add a `.clangd` file (either in the project directory or in $HOME)

```
CompileFlags:
  Add:
    -I<an include directory>
```
- Add `.clang-tidy` too - can autogenerate this

<!-- Links -->
[1]: https://medium.com/unixification/how-to-setup-clangd-with-gcc-headers-and-neovim-lsp-for-competitive-programming-2f3f98425ae1
[bear]: https://github.com/rizsotto/Bear
