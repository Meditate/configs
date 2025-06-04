local utils = require('utils')

vim.api.nvim_create_user_command('W', function()
  local file_path = vim.fn.expand('%')

  vim.cmd('w !sudo tee ' .. vim.api.nvim_reltabs(file_path) .. ' > /dev/null')
  vim.cmd('e!')
end, {
  desc = 'Sudo save the current file',
  nargs = 0, -- This command takes no arguments
})

vim.api.nvim_create_user_command('Bclose', utils.close_buffer_smartly, {
  nargs = 0,
})

-- Define a custom user command 'Rag'
-- This command is for using 'ag' (The Silver Searcher) with FZF,
-- configured for raw output suitable for quickfix list.
vim.api.nvim_create_user_command('Rag', function(opts)
  -- <q-args> in Vimscript translates to opts.fargs in Lua for user commands
  -- The bang (!) argument translates to opts.bang
  vim.fn['fzf#vim#ag_raw'](opts.fargs, {options = '--delimiter : --nth 4..'}, opts.bang)
end, {
  bang = true,            -- Allows ! (e.g., :Rag!)
  nargs = '+',            -- Accepts one or more arguments (the search pattern)
  complete = 'dir',       -- Enables directory completion for arguments
  desc = 'FZF ag raw search' -- Description for :h Rag
})

vim.api.nvim_create_user_command('GetRandomAirlineTheme', function()
  utils.GetRandomAirlineTheme()
end, {
  nargs = 0, -- This command takes no arguments
  desc = 'Get a random Airline theme'
})
