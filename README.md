# Dependencies
 - go (with `~/go/bin/` path)
 - https://github.com/juliosueiras/terraform-lsp


# config powerline

`git clone https://github.com/powerline/fonts.git`
`./install.sh`

`:redir @* | set guifont | redir END`

`brew install fzf`

`brew install ctags`
# Steps
...
`:CocConfig` and fill with coc-settings file
`GO111MODULE=on go get golang.org/x/tools/gopls@latest` from ( go lsp-client https://github.com/golang/tools/tree/master/gopls)
