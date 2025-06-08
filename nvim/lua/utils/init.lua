-- Create a local table to hold your functions. This will be the module's public interface.
local M = {}

function M.HasPaste()
  if vim.o.paste then
    return 'PASTE MODE '
  end

  return ''
end

-- This function removes trailing spaces from the entire buffer
function M.CleanExtraSpaces()
  local save_cursor = vim.fn.getpos('.')
  local old_query = vim.fn.getreg('/')
  vim.cmd('silent! %s/\\s\\+$//e')
  vim.fn.setpos('.', save_cursor)
  vim.fn.setreg('/', old_query)
end 

-- Define the Lua function that handles the buffer closing logic
function M.close_buffer_smartly()
  local current_buf_num = vim.api.nvim_get_current_buf()
  local alternate_buf_num = vim.fn.bufnr("#")

  -- Try to switch to the alternate buffer if it's listed
  if vim.fn.buflisted(alternate_buf_num) == 1 then
    vim.cmd('buffer #')
  else
    -- Otherwise, try to switch to the next buffer
    vim.cmd('bnext')
  end

  -- If we're still on the original buffer (meaning no switch happened)
  -- then open a new empty buffer
  if vim.api.nvim_get_current_buf() == current_buf_num then
    vim.cmd('new')
  end

  -- Finally, delete the original buffer if it's still listed (exists)
  if vim.fn.buflisted(current_buf_num) == 1 then
    vim.cmd('execute "bdelete! " .. ' .. current_buf_num)
  end
end

function M.VisualSelection()
  local saved_reg_quote = vim.fn.getreg('"') -- Content of " register
  local saved_reg_slash = vim.fn.getreg('/') -- Content of / register (search history)

  vim.cmd('normal! vgvy') -- Yank visual selection into " register

  local pattern = vim.fn.getreg('"') -- Get the yanked text
  pattern = vim.fn.escape(pattern, '\\/.*\'$^~[]') -- Escape special characters for search
  pattern = pattern:gsub("\n$", "") -- Remove trailing newline if present

  vim.fn.setreg('/', pattern)       -- Set the search pattern
  vim.fn.setreg('"', saved_reg_quote) -- Restore the " register
end

function M.GetRandomAirlineTheme()
  math.randomseed(os.time()) -- Seed the random number generator

  -- local themes = vim.fn["airline#util#themes"]('')
  local themes = {
    "hybridline",
    "simple",
    "ayu_dark",
    "desertink",
    "sierra",
    "base16_tomorrow",
    "base16_ashes",
    "wombat",
    "luna",
    "jellybeans",
  }
  local theme_count = #themes
  local random_index = math.random(1, theme_count)
  -- local random_theme = themes[random_index]
  local random_theme = "ayu_dark"

  local command_string = "AirlineTheme " .. random_theme

  vim.cmd(command_string)

  print("Switched to random airline theme: " .. random_theme)
end

return M
