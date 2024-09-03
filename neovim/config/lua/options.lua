------
-- Visual changes
------

vim.opt.cursorcolumn = true
vim.opt.cursorline = true

-- Smartly wrap lines
vim.opt.linebreak = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.showmode = false

------
-- Functional changes
------

-- Enable mouse for all modes
vim.opt.mouse = "a"

-- Sync clipboard between OS and Neovim
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.scrolloff = 10

vim.opt.splitbelow = true
vim.opt.splitright = true

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.breakindent = true

vim.opt.undofile = true
-- vim.opt.shadafile = ???
-- vim.opt.backup = ???
