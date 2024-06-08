# Dependencies
 - go (with `~/go/bin/` path)
 - https://github.com/juliosueiras/terraform-lsp

# Install vim-plug
https://github.com/junegunn/vim-plug

Instruction for NVIM unix
`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
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
