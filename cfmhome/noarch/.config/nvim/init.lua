vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true

vim.o.winborder = "rounded"

require("ritrac")

vim.lsp.log.set_level("ERROR")

-- ------------------------------------------------------ --
-- ---------------------- THEME ------------------------- --
-- ------------------------------------------------------ --

-- vim.cmd.colorscheme 'elflord'
-- vim.cmd.colorscheme "github_dark_default"
vim.cmd.colorscheme "acario_dark"

-- show vertical separation
-- vim.api.nvim_set_hl(0, "WinSeparator", {
--     fg = "purple",
--     bg = "NONE",
--     bold = true,
-- })
--
-- vim.opt.fillchars = {
--     vert = "┃",
--     horiz = "━",
-- }
--
-- vim.api.nvim_set_hl(0, "MiniStatuslineInactive", {
--     fg = "purple",
--     -- bg = "grey",
-- })
--
vim.opt.signcolumn = "yes:1"  -- avoid signcolumn constantly resizing
vim.o.cmdheight = 0           -- hide command line if not needed
vim.opt.number = true         -- Make line numbers default
vim.opt.relativenumber = true -- help for jumping
vim.opt.cursorline = true     -- Show which line your cursor is on
vim.opt.smoothscroll = false  -- can be slow (SSH ?)

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
  callback = function()
    vim.wo.cursorline = true
  end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
  callback = function()
    vim.wo.cursorline = false
  end,
})


vim.api.nvim_set_hl(0, "ActiveWindow", { bg = "NONE" })
vim.api.nvim_set_hl(0, "InactiveWindow", { bg = "NONE" })

vim.api.nvim_set_hl(0, "ActiveSeparator", { fg = "#7aa2f7", bold = true })
vim.api.nvim_set_hl(0, "InactiveSeparator", { fg = "#3b4261" })

vim.api.nvim_create_autocmd({ "WinEnter" }, {
  callback = function()
    vim.wo.winhighlight = "Normal:ActiveWindow,WinSeparator:ActiveSeparator"
  end,
})

vim.api.nvim_create_autocmd({ "WinLeave" }, {
  callback = function()
    vim.wo.winhighlight = "Normal:InactiveWindow,WinSeparator:InactiveSeparator"
  end,
})

vim.opt.shiftwidth = 4

-- Enable mouse mode, can be useful for resizing splits for example!
-- vim.opt.mouse = 'a'

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

------------------------------------
-- vim.keymap.set({"n", "v", "x", "s", "o"}, "<C-t>", "<left>", {noremap=true, desc="Left"})
-- vim.keymap.set({"n", "v", "x", "s", "o"}, "<C-s>", "<down>", {noremap=true, desc="Down"})
-- vim.keymap.set({"n", "v", "x", "s", "o"}, "<C-r>", "<up>", {noremap=true, desc="Up"})
-- vim.keymap.set({"n", "v", "x", "s", "o"}, "<C-n>", "<right>", {noremap=true, desc="Right"})

------------------------------------
-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<M-t>', '<C-w><C-h>', { desc = 'Move focus to the left window', noremap = true })
vim.keymap.set('n', '<M-n>', '<C-w><C-l>', { desc = 'Move focus to the right window', noremap = true })
vim.keymap.set('n', '<M-s>', '<C-w><C-j>', { desc = 'Move focus to the lower window', noremap = true })
vim.keymap.set('n', '<M-r>', '<C-w><C-k>', { desc = 'Move focus to the upper window', noremap = true })


vim.keymap.set('n', '<C-">', '1gt<CR>', { desc = 'Move to TAB-1', noremap = true })
vim.keymap.set('n', '<C-«>', '2gt<CR>', { desc = 'Move to TAB-2', noremap = true })
vim.keymap.set('n', '<C-»>', '3gt<CR>', { desc = 'Move to TAB-3 ', noremap = true })
vim.keymap.set('n', '<C-(>', '4gt<CR>', { desc = 'Move to TAB-4', noremap = true })
vim.keymap.set('n', '<C-)>', '5gt<CR>', { desc = 'Move to TAB-5', noremap = true })
vim.keymap.set('n', '<C-@>', '6gt<CR>', { desc = 'Move to TAB-6', noremap = true })
vim.keymap.set('n', '<C-+>', '7gt<CR>', { desc = 'Move to TAB-7', noremap = true })
vim.keymap.set('n', '<C-->', '8gt<CR>', { desc = 'Move to TAB-8', noremap = true })
vim.keymap.set('n', '<C-/>', '9gt<CR>', { desc = 'Move to TAB-9', noremap = true })
vim.keymap.set('n', '<C-*>', '0gt<CR>', { desc = 'Move to TAB-0', noremap = true })

vim.keymap.set('n', '<S-TAB>', ':tabprevious<CR>', { desc = 'Move to the previous window', noremap = true })
vim.keymap.set('n', '<TAB>', ':tabnext<CR>', { desc = 'Move to the next tab', noremap = true })

--vim.keymap.set('n', '<C-t>', ':-tabnext <CR>', { desc = 'Move to the previous window', noremap=true})
--vim.keymap.set('n', '<C-n>', ':+tabnext <CR>', { desc = 'Move to the next tab', noremap=true })
-- By default: <C-w> T -> move window to a new tab


-- Harpoon
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>A", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = 'Harpoon Menu', noremap = true })
vim.keymap.set('n', '<M-">', function() harpoon:list():select(1) end, { desc = 'Harpoon Select-1', noremap = true })
vim.keymap.set('n', '<M-«>', function() harpoon:list():select(2) end, { desc = 'Harpoon Select-2', noremap = true })
vim.keymap.set('n', '<M-»>', function() harpoon:list():select(3) end, { desc = 'Harpoon Select-3', noremap = true })
vim.keymap.set('n', '<M-(>', function() harpoon:list():select(4) end, { desc = 'Harpoon Select-4', noremap = true })
vim.keymap.set('n', '<M-)>', function() harpoon:list():select(5) end, { desc = 'Harpoon Select-5', noremap = true })
vim.keymap.set('n', '<M-@>', function() harpoon:list():select(6) end, { desc = 'Harpoon Select-6', noremap = true })
vim.keymap.set('n', '<M-+>', function() harpoon:list():select(7) end, { desc = 'Harpoon Select-7', noremap = true })
vim.keymap.set('n', '<M-->', function() harpoon:list():select(8) end, { desc = 'Harpoon Select-8', noremap = true })
vim.keymap.set('n', '<M-/>', function() harpoon:list():select(9) end, { desc = 'Harpoon Select-9', noremap = true })
vim.keymap.set('n', '<M-*>', function() harpoon:list():select(0) end, { desc = 'Harpoon Select-0', noremap = true })

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
vim.keymap.set("c", "à", "w", {})                 -- ça marche mais interet d'une nouvelle touche w ?


-- native shortcuts:
-- * next word
-- # prev word
vim.g.mapleader = ' '
vim.g.maplocalleader = '_'

-- Enable break indent
vim.opt.breakindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true


-- Decrease update time
-- vim.opt.updatetime = 250
vim.opt.updatetime = 500

-- Decrease mapped sequence wait time
-- vim.opt.timeoutlen = 300

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
