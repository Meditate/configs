vim.o.number = true -- show line numbers
vim.o.history = 500 -- configure the number of items stored in the command-line history and search history

-- set the default language for interface messages
vim.env.LANG = "en" 
vim.o.langmenu = "en"
vim.o.encoding = "utf-8"

-- show command-line completion menu --
vim.o.wildmenu = true 
vim.o.wildignore = table.concat({
  "*.o",
  "*~",
  "*.pyc",
  "*.pyo",
  "*.class",
  "*.exe",
  "*.dll",
  "*.so",
  "*.dylib",
  "*/node_modules/*",
  "*/vendor/*",
}, ",")

vim.o.so = 7 -- lines offset around the cursor when scrolling

vim.o.hid = true -- hide buffers when they are abandoned

vim.o.backspace = "indent,eol,start" -- allow backspacing over everything in insert mode

vim.opt.whichwrap:append {
  ['<'] = true,
  ['>'] = true,
  ['['] = true,
  [']'] = true,
  h = true,
  l = true,
} -- allow movement commands to wrap to the next line

vim.o.ignorecase = true -- ignore case in searches
vim.o.smartcase = true -- ignore case in searches unless an uppercase letter is used

vim.o.hlsearch = true -- highlight all matches of the last search pattern

vim.o.incsearch = true -- show matches while typing

vim.o.lazyredraw = true -- don't redraw while executing macros (improves performance)

vim.o.magic = true -- use extended regular expressions by default

vim.o.matchtime = 2 -- time in tenths of a second to show matching brackets
vim.o.showmatch = true -- briefly jump to matching brackets when inserting them

-- disable sound on errors
vim.o.errorbells = false -- disable error bells
vim.o.visualbell = false -- disable visual bell
vim.o.tm = 500 -- timeout for mapped sequences

vim.opt.termguicolors = true -- enable 24-bit RGB colors in the terminal
vim.o.fcs = "eob:\\" -- set the fill character for empty lines

------------------
--- UI settings
--------------------

vim.o.cmdheight = 2 -- height of the command line

vim.o.foldcolumn = "1" -- Add a bit extra margin to the left

local status_ok, _ = pcall(vim.cmd.colorscheme, 'tokyonight')
if not status_ok then
  vim.notify('Colorscheme "tokyonight" not found!', vim.log.levels.WARN)
end

vim.o.ffs = "unix,dos,mac" -- set the default file formats

---------------
--Files and backups
----------------
vim.o.backup = false -- don't create backup files
vim.o.writebackup = false -- don't create backup files before overwriting
vim.o.autoread = true -- automatically reload files changed outside of Vim


local swap_dir = vim.fn.stdpath('cache') .. '/nvim/swap' -- set the swap directory in OS default cache directory
vim.fn.mkdir(swap_dir, 'p') -- 'p' flag creates parent directories if needed
vim.o.directory =  swap_dir .. '//' -- set the directory for swap files

------------------
--- Text, tab, and indent settings
-------------------
vim.o.expandtab = true -- use spaces instead of tabs
vim.o.smarttab = true -- insert the appropriate number of spaces when pressing Tab
vim.o.shiftwidth = 2 -- number of spaces to use for each step of (auto)indent
vim.o.tabstop = 2 -- number of spaces that a <Tab> counts for while performing editing operations
vim.o.linebreak = true -- use line breaks instead of hard returns
vim.o.tw = 500 -- set the text width for automatic line wrapping
vim.o.autoindent = true -- copy indent from current line when starting a new line
vim.o.smartindent = true -- do smart autoindenting when starting a new line
vim.o.wrap = true -- wrap long lines
vim.o.switchbuf = table.concat({ "useopen", "usetab", "newtab" }, ",") -- switch to a new tab if the file is already open in another tab
vim.o.stal = 2 -- Always show the tab line, even if there is only one tab open
-- vim.o.guifont = "NotoMonoForPowerline:h13"

-------------------
--- Status line
--------------------
vim.o.ruler = true -- show the cursor position in the status line
vim.o.laststatus = 2 -- always show the status line
vim.opt.statusline = table.concat({
  ' ',                                      -- Initial space
  '%F',                                     -- Full path of the current file
  '%m',                                     -- Modified flag ([+])
  '%r',                                     -- Read-only flag ([RO])
  '%h',                                     -- Help flag ([help])
  ' %w',                                    -- Preview flag ([Preview])
  '  CWD: %{getcwd()}',                     -- Current Working Directory
  '   Line: %l',                            -- Current line number
  '  Column: %c',                           -- Current column number
}, '') -- Concatenate all parts with no separator

vim.opt.statusline:append('%{gutentags#statusline()}')


-- Configure files and directories to exclude from ctags generation
vim.g.gutentags_ctags_exclude = {
  "*.min.js",
  "*.min.css",
  "build",
  "vendor",
  ".git",
  "node_modules",
  "*.vim/bundle/*"
}
