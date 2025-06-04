local utils = require('utils')

local autocleanup_group = vim.api.nvim_create_augroup('Autocleanup', { clear = true })

vim.api.nvim_create_autocmd('BufWritePre', {
  group = autocleanup_group,

  pattern = {
    '*.txt',
    '*.js',
    '*.py',
    '*.wiki',
    '*.sh',
    '*.coffee',
    -- Add or remove file extensions as needed
  },

  callback = utils.CleanExtraSpaces,
})

-- automatically jump back to the exact line and column where you last left it
vim.api.nvim_create_autocmd('BufReadPost', {
  -- You can add a pattern here if you don't want it for all files
  -- pattern = '*',
  group = vim.api.nvim_create_augroup('restore_cursor', { clear = true }),
  callback = function()
    local last_line = vim.fn.line("''") -- Get the line number of mark '
    local total_lines = vim.fn.line("$") -- Get the total number of lines in the buffer

    -- Check if the last known line is valid and not the very first line
    if last_line > 1 and last_line <= total_lines then
      vim.cmd('normal! g`"') -- Jump to the mark '
    end
  end,
})

-- Pick random Airline theme on startup
vim.api.nvim_create_autocmd('VimEnter', {
  pattern = "*", -- The event applies to all file types and situations
  desc = "Automatically set a random Airline theme on startup",
  callback = function()
    utils.GetRandomAirlineTheme()
  end,
})
