return {
  "tpope/vim-sensible",
  "airblade/vim-gitgutter",
  "airblade/vim-rooter",
  "chrisbra/Colorizer",
  "kien/ctrlp.vim",
  "leafgarland/typescript-vim",
  "ludovicchabant/vim-gutentags",
  {
    "mileszs/ack.vim",
    init = function()
      require("plugins_config.ack")
    end,
  },
  "ryanoasis/vim-devicons",
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
        on_attach = require("plugins_config.nvim_tree").my_on_attach,
      }
    end,
  },
  "slim-template/vim-slim",
  "thoughtbot/vim-rspec",
  "tpope/vim-fugitive",
  "Yggdroot/indentLine",
  "ngmy/vim-rubocop",
  "lmeijvogel/vim-yaml-helper",
  "junegunn/goyo.vim",
  "github/copilot.vim",

  -- Colorschemes 
  "challenger-deep-theme/vim",
  "UndeadLeech/vim-undead",
  "nightsense/strawberry",
  "belak/base16-emacs",
  "vim-scripts/pink",
  "arcticicestudio/nord-vim",
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    dependencies = {
      "ryanoasis/vim-devicons",
    },
    opts = {
      style = "moon",
      transparent = true,
      styles = {
         sidebars = "transparent",
         floats = "transparent",
      },
    },
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        transparent = true,
      },
    },
  },
  {
    "vim-airline/vim-airline",
    dependencies = {
      "ryanoasis/vim-devicons",
    },
    init = function()
      require("plugins_config.airline")
    end,
  },
    -- Statusline and Icons
  "vim-airline/vim-airline-themes",
  {
    "vim-airline/vim-airline",
    dependencies = {
      "vim-airline/vim-airline-themes",
      "ryanoasis/vim-devicons",
    }
  },
  {
    "kyoz/purify", 
    rtp = "vim",
  },
  {
    "junegunn/fzf",
    build = "./install --all",
  },
  "junegunn/fzf.vim",
  {
    "fatih/vim-go",
    build = ":GoInstallBinaries",
    ft = "go",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
}
