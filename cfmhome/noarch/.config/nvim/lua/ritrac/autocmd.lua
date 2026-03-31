-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

local function augroup(name)
    return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
    group = augroup("wrap_spell"),
    pattern = { "text", "plaintex", "typst", "gitcommit", "markdown" },
    callback = function()
	-- -- By default wrap is set to true regardless of what I chose in my options.lua file,
	-- -- This sets wrapping for my skitty-notes and I don't want to have
	-- -- wrapping there, I want to decide this in the options.lua file
	-- vim.opt_local.wrap = false
	vim.opt_local.spell = true
    end,
})

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


-- open help in vertical split
-- vim.api.nvim_create_autocmd("FileType", {
--     pattern = "help",
--     command = "wincmd L",
-- })

-- auto resize splits when the terminal's window is resized
-- vim.api.nvim_create_autocmd("VimResized", {
--     command = "wincmd = ",
-- })

