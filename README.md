# My local env setup

<img width="1914" alt="Screenshot 2025-06-08 at 16 50 32" src="https://github.com/user-attachments/assets/5f1992bc-433c-485d-9a04-489fac2096fb" />

# Dependencies
 - go (with `~/go/bin/` path)
 - https://github.com/juliosueiras/terraform-lsp
 - brew install the_silver_searcher (https://github.com/ggreer/the_silver_searcher)



# Install vim-plug
https://github.com/junegunn/vim-plug

Instruction for NVIM unix
`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
# config powerline

- powerline fonts
`git clone https://github.com/powerline/fonts.git`
`./install.sh`

- patched with icons
`git clone git@github.com:ryanoasis/nerd-fonts.git`
`brew install font-roboto-mono-nerd-font`

`:redir @* | set guifont | redir END`

`brew install fzf`

`brew install ctags`
# Language Client
For M1 there is a problem with building bins, install rust and cargo with
`brew install rust`
`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`

and run install.sh manually, from `cd ~/.vim/plugged/LanguageClient-neovim/`
```
bash install.sh
mv target/release/languageclient bin
```

# Steps
...
`:CocConfig` and fill with coc-settings file
`GO111MODULE=on go get golang.org/x/tools/gopls@latest` from ( go lsp-client https://github.com/golang/tools/tree/master/gopls)
