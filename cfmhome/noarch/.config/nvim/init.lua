require("ritrac")

vim.cmd.colorscheme 'elflord'

vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.wrap = false

-- Make line numbers default
vim.opt.number = true

-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true


-- Enable mouse mode, can be useful for resizing splits for example!
-- vim.opt.mouse = 'a'


-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)


-- modes:
-- 	- ' ' : normal + visual + select + operator
-- 	- l: lmap -> insert + command line + lang arg 
-- 	- c: command
-- 	- n: normal
-- 	- v: visual and select 
-- 	- x: visual
-- 	- i: insert
-- 	- s: Sel ?
-- 	- o: Operator pending 
-- 	- t: Term ?
-- 	- l: Lang ?

--vim.keymap.set("n", "<A-n>", "n", {noremap=true})
--vim.keymap.set("n", "<A-S-n>", "N", {})
--vim.keymap.set("n", "R", "r", {})

------------------------------------
vim.keymap.set({"n", "v", "x", "s", "o"}, "<C-t>", "<left>", {noremap=true, desc="Left"})
vim.keymap.set({"n", "v", "x", "s", "o"}, "<C-s>", "<down>", {noremap=true, desc="Down"})
vim.keymap.set({"n", "v", "x", "s", "o"}, "<C-r>", "<up>", {noremap=true, desc="Up"})
vim.keymap.set({"n", "v", "x", "s", "o"}, "<C-n>", "<right>", {noremap=true, desc="Right"})

------------------------------------
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<M-t>', '<C-w><C-h>', { desc = 'Move focus to the left window', noremap=true})
vim.keymap.set('n', '<M-n>', '<C-w><C-l>', { desc = 'Move focus to the right window', noremap=true })
vim.keymap.set('n', '<M-s>', '<C-w><C-j>', { desc = 'Move focus to the lower window', noremap=true })
vim.keymap.set('n', '<M-r>', '<C-w><C-k>', { desc = 'Move focus to the upper window', noremap=true })

-- vim.keymap.set('n', '<M-t>', ':wincmd H <CR>', { desc = 'Move focus to the left window', noremap=true})
-- vim.keymap.set('n', '<M-n>', ':wincmd L <CR>', { desc = 'Move focus to the right window', noremap=true })
-- vim.keymap.set('n', '<M-s>', ':wincmd J <CR>', { desc = 'Move focus to the lower window', noremap=true })
-- vim.keymap.set('n', '<M-r>', ':wincmd K <CR>', { desc = 'Move focus to the upper window', noremap=true })


-- TODO shortcut for:
-- 			- n (search next)
-- 			- :vsplit
-- 			- :split
-- 			- :write (w trop chiant en bepo)
-- 			- display screen with shortcuts

vim.keymap.set("n", "<F2>", ":split<CR>", {})
vim.keymap.set("n", "<F3>", ":vsplit<CR>", {})
vim.keymap.set("n", "<F4>", ":vsplit | vsplit <CR>", {})
vim.keymap.set("n", "<F5>", ":wincmd = <CR>", {}) -- alias for "Ctrl-w = "
vim.keymap.set("c", "à", "w", {})


-- native shortcuts:
    -- * next word 
    -- # prev word 
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable break indent
vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true


-- Decrease update time
-- vim.opt.updatetime = 250
vim.opt.updatetime = 500

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true


-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
--

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })


-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
--


-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.cmd.colorscheme "github_dark_default"



