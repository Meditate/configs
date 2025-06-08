local utils = require('utils')

vim.keymap.set('n', '<leader>w', ':w!<CR>', {
  noremap = true,
  silent = true
})

-- Visual mode keymap for '*'
vim.keymap.set('v', '*', function()
  utils.VisualSelection()

  local pattern = vim.fn.getreg('/')
  vim.fn.search(pattern)
  vim.opt.hlsearch = true
end, { silent = true })

vim.keymap.set('n', '<leader>bd', ':Bclose<CR>:tabclose<CR>gT', {
  noremap = true,
  silent = true,
})

-- Toggle NVIMTree visibility
vim.keymap.set('n', '<C-\\>', ':NvimTreeToggle<CR>', {
  noremap = true,
  silent = true
})

-- Find the current file in the NVIMTree
vim.keymap.set('n', '<leader>n', ':NvimTreeFindFile<CR>', {
  noremap = true,
  silent = true
})

-- Shorter search commands
vim.keymap.set('n', '<space>', '/', { noremap = true, silent = true })

-- Disable highlight when <leader><cr> is pressed
vim.keymap.set('n', '<leader><cr>', ':noh<CR>', { noremap = true, silent = true })

-- Smart way to move between windows
vim.keymap.set('n', '<C-j>', '<C-W>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-W>k', { noremap = true })
vim.keymap.set('n', '<C-h>', '<C-W>h', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-W>l', { noremap = true })


-- Close all the buffers
vim.keymap.set('n', '<leader>ba', ':bufdo bd<CR>', { noremap = true, silent = true })

-- Buffer navigation
vim.keymap.set('n', '<leader>l', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>h', ':bprevious<CR>', { noremap = true, silent = true })

-- Useful mappings for managing tabs
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>to', ':tabonly<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>tm', ':tabmove ', { noremap = true, silent = true }) -- Note the trailing space
vim.keymap.set('n', '<leader>t<leader>', ':tabnext<CR>', { noremap = true, silent = true })

-- Open a new tab with the current file's directory
vim.keymap.set('n', '<leader>te', ':tabedit <C-R>=expand("%:p:h")<CR>/', { noremap = true, silent = true })

-- Switch CWD to the directory of the open buffer and print it
vim.keymap.set('n', '<leader>cd', ':cd %:p:h<CR>:pwd<CR>', { noremap = true, silent = true })

-- Map '0' to '^' (move to first non-blank character of the line)
vim.keymap.set('n', '0', '^', { noremap = true })

-- Move current line down in Normal mode
vim.keymap.set('n', '<M-j>', 'mz:m+<CR>`z', { noremap = true })
-- Move current line up in Normal mode
vim.keymap.set('n', '<M-k>', 'mz:m-2<CR>`z', { noremap = true })

-- Move visual selection down in Visual mode
vim.keymap.set('v', '<M-j>', ":m'>+<CR>`<my`>mzgv`yo`z", { noremap = true })
-- Move visual selection up in Visual mode
vim.keymap.set('v', '<M-k>', ":m'<-2<CR>`>my`<mzgv`yo`z", { noremap = true })


-- Only define these mappings if running on macOS
if vim.fn.has("mac") == 1 or vim.fn.has("macunix") == 1 then
  -- Map Command+j to Alt+j behavior in Normal mode
  vim.keymap.set('n', '<D-j>', '<M-j>', { noremap = true })
  -- Map Command+k to Alt+k behavior in Normal mode
  vim.keymap.set('n', '<D-k>', '<M-k>', { noremap = true })
  -- Map Command+j to Alt+j behavior in Visual mode
  vim.keymap.set('v', '<D-j>', '<M-j>', { noremap = true })
  -- Map Command+k to Alt+k behavior in Visual mode
  vim.keymap.set('v', '<D-k>', '<M-k>', { noremap = true })
end

-- Spell checking
-- Pressing <leader>ss will toggle spell checking for the current buffer
vim.keymap.set('n', '<leader>ss', ':setlocal spell!<CR>', { noremap = true, silent = true })

-- Shortcuts using <leader> for spell navigation and correction
-- Go to next misspelled word
vim.keymap.set('n', '<leader>sn', ']s', { noremap = true })
-- Go to previous misspelled word
vim.keymap.set('n', '<leader>sp', '[s', { noremap = true })
-- Add word to spellfile (good word)
vim.keymap.set('n', '<leader>sa', 'zg', { noremap = true })
-- Suggest corrections for word under cursor
vim.keymap.set('n', '<leader>s?', 'z=', { noremap = true })

-- Quickly open a buffer for scribble (general purpose)
vim.keymap.set('n', '<leader>q', ':e ~/buffer<CR>', { noremap = true, silent = true })

-- Quickly open a markdown buffer for scribble
vim.keymap.set('n', '<leader>x', ':e ~/buffer.md<CR>', { noremap = true, silent = true })

-- Toggle paste mode on and off
vim.keymap.set('n', '<leader>pp', ':setlocal paste!<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<M-k>', function()
  local word = vim.fn.expand("<cword>")
  if word == nil or word == '' then
    print("No word under cursor.")
    return
  end
  local escaped_word = vim.fn.escape(word, '\\"') -- Escape for " in Vim command string
  local cmd_to_run = string.format('Ack! "\\b%s\\b"', escaped_word)
  vim.cmd(cmd_to_run)
end, {
  noremap = true, -- Recommended to change to true for safety
  silent = true   -- Or false, depending on preference
  -- desc = "Ack for word under cursor" -- Optional description
})

-- Bind Alt+Shift+k to Ggrep! (git grep) for the word under cursor
vim.keymap.set('n', '<M-S-k>', ':Ggrep! "\\b<cword>\\b"<CR>', {
  noremap = true,
  silent = true
})

-- Open FZF buffers list
vim.keymap.set('n', ';', ':Buffers<CR>', { noremap = true, silent = true })

-- Open FZF file finder
vim.keymap.set('n', '<Leader>t', ':Files<CR>', { noremap = true, silent = true })

-- Open FZF tags finder
vim.keymap.set('n', '<Leader>r', ':Tags<CR>', { noremap = true, silent = true })

-- Open a vertical diff with the Git index
vim.keymap.set('n', '<leader>gd', ':Gvdiff<CR>', { noremap = true, silent = true })

-- Diffget from left (index/staging area)
vim.keymap.set('n', 'gdh', ':diffget //2<CR>', { noremap = true, silent = true })

-- Diffget from right (other branch/working tree)
vim.keymap.set('n', 'gdl', ':diffget //3<CR>', { noremap = true, silent = true })

-- Map 'jkl' to ESCAPE in Insert mode
vim.keymap.set('i', 'jkl', '<ESC>', { noremap = true })

