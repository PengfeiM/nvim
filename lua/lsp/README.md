# LSP NOTE

## Dependencies

### c/c++
**used lsps**
clangd

clangd is a lsp used by nvim to manage c/c++ project.  
you can install it manually or by mason
I install it by apt in debian.
you may try another way to install, as long as the clangd executabl file in your $PATH.
```bash
sudo apt update
sudo apt install clangd
```
>[!ATTENTION] in c/c++ project, you must generate a `compile_commands.json` file so that clangd can understand c symbols.
```bash
# use Makefile
brew install bear # install bear in anyway
# in your project
bear -- make

# use Cmake
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
```



### go
**used lsps**
* gopls
    * for jump
* null-ls/none-ls
    * for goimports, gomodifytags, impl and gofumpt.
    ```lua
        null_ls.builtins.code_actions.gomodifytags,
        null_ls.builtins.code_actions.impl,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.gofumpt,

    ```
**go tools needed**
* impl: implement a interface to current type
* goimports: auto optimize imports
* gomodifytags: auto add tags to struct
* gofumpt: better go-fmt
* gopls(optional): if your go version is relatively new, you may install gopls manually instead of using mason
```bash
go install github.com/josharian/impl@latest
go install golang.org/x/tools/cmd/goimports@latest
go install github.com/fatih/gomodifytags@latest
go install mvdan.cc/gofumpt@latest
go install golang.org/x/tools/gopls@latest
```

### confs
#### toml
nothing, mason will install the lsp server: taplo
#### yamlls and jsonls
* npm: mason needs it to install yamlls and jsonls
    you may install it by apt or brew. here is my way to install 
```
brew install npm
```
> [!NOTE] please be noted that either you install npm by apt or brew, it may introduce some deps for npm.


