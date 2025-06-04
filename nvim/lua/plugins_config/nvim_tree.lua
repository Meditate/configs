local M = {}

function M.my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "x",              api.node.navigate.parent_close,     opts("Close Directory"))
  vim.keymap.set("n", "X",              api.fs.cut,                         opts("Cut"))
  vim.keymap.set("n", "s",              api.node.open.vertical,             opts("Open: Vertical Split"))
  vim.keymap.set("n", "i",              api.node.open.horizontal,           opts("Open: Horizontal Split"))
  vim.keymap.set("n", "I",              api.tree.toggle_hidden_filter,      opts("Toggle Filter: Dotfiles"))
  vim.keymap.set("n", "H",              api.tree.toggle_gitignore_filter,   opts("Toggle Filter: Git Ignore"))
end

return M
