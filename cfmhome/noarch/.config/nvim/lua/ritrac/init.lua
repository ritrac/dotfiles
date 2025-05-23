
require("ritrac.remap")
require("ritrac.lazy")
-- require("ritrac.lsp")
-- require("ritrac.treesitter")

local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    callback = function(e)
	-- local opts = { buffer = e.buf }
	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
	    { buffer = e.buf, desc = 'Goto Definition'})
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
	    { buffer = e.buf, desc = 'Lsp buf hover'})
	vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format,
	    { buffer = e.buf, desc = 'Buffer format'})
	vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end,
	    { buffer = e.buf, desc = 'Buffer code action'})
	vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.rename() end,
	    { buffer = e.buf, desc = 'Rename'})
	vim.keymap.set("n", "<leader>lk", function() vim.diagnostic.open_float() end,
	    { buffer = e.buf, desc = 'Open Float'})
	vim.keymap.set("n", "<leader>ln", function() vim.diagnostic.goto_next() end,
	    { buffer = e.buf, desc = 'Goto next'})
	vim.keymap.set("n", "<leader>lp", function() vim.diagnostic.goto_prev() end,
	    { buffer = e.buf, desc = 'Goto prev'})

        vim.keymap.set("n", "<leader>lws", function() vim.lsp.buf.workspace_symbol() end,
	    { buffer = e.buf, desc = 'Workspace symbol'})
        vim.keymap.set("n", "<leader>lca", function() vim.lsp.buf.code_action() end,
	    { buffer = e.buf, desc = 'Code action'})
        vim.keymap.set("n", "<leader>lrr", function() vim.lsp.buf.references() end,
	    { buffer = e.buf, desc = 'References'})
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
	    { buffer = e.buf, desc = 'Lsp signature help'})
    end
})

require("ritrac.autocmd")



