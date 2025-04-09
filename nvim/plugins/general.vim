call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'chrisbra/Colorizer'
Plug 'kien/ctrlp.vim'
Plug 'leafgarland/typescript-vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim'
Plug 'preservim/nerdtree'
Plug 'slim-template/vim-slim'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'ngmy/vim-rubocop'
Plug 'lmeijvogel/vim-yaml-helper'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'challenger-deep-theme/vim'
Plug 'UndeadLeech/vim-undead'
Plug 'nightsense/strawberry'
Plug 'belak/base16-emacs'
Plug 'vim-scripts/pink'
Plug 'arcticicestudio/nord-vim'
Plug 'folke/tokyonight.nvim'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end() 
