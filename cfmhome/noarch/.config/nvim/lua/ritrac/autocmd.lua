
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

