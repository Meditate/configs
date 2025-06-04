-- Set FZF history directory
vim.g.fzf_history_dir = vim.fn.expand('$HOME/.local/share/fzf-history')

-- Set default FZF options to bind Ctrl-A to select-all
-- Note: It's generally recommended to set environment variables in your shell config
-- (e.g., .bashrc, .zshrc) rather than directly in Neovim,
-- as FZF might be called from outside Neovim too.
vim.env.FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

-- Define a local Lua function to build the quickfix list
local function build_quickfix_list(lines)
  -- The 'map' function in Vimscript often needs 'copy' when operating on lists
  -- to avoid modifying the original. In Lua, we handle the table directly.
  local qflist_entries = {}
  for _, line_val in ipairs(lines) do
    table.insert(qflist_entries, { filename = line_val })
  end
  vim.fn.setqflist(qflist_entries)
  vim.cmd('copen') -- Open the quickfix window
  vim.cmd('cc')    -- Go to the first error/entry in the quickfix list
end

-- Map FZF actions to Lua functions or Vim commands
vim.g.fzf_action = {
  ['ctrl-q'] = build_quickfix_list, -- Directly reference the Lua function
  ['ctrl-t'] = 'tab split',         -- Open in a new tab
  ['ctrl-x'] = 'split',             -- Open in a horizontal split
  ['ctrl-v'] = 'vsplit'             -- Open in a vertical split
}

