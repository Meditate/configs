vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.opt.conceallevel = 0
vim.opt.concealcursor = "nc"

require("config.lazy")
require("general")
require("utils")
require("core.commands")
require("core.keymaps")
require("core.autocmds")
require("plugins_config.fzf")
require("plugins_config.language_servers")



