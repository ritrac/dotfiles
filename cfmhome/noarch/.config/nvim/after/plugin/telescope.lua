local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope find Git files' })
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })


vim.keymap.set('n', '<leader>td', builtin.lsp_definitions, { desc = 'Go to definition' })
vim.keymap.set('n', '<leader>ti', builtin.lsp_implementations, { desc = 'Go to implementations' })
vim.keymap.set('n', '<leader>tws', builtin.lsp_workspace_symbols, { desc = 'List workspace symbols' })
vim.keymap.set('n', '<leader>tds', builtin.lsp_document_symbols, { desc = 'List document symbols' })
vim.keymap.set('n', '<leader>ts', builtin.treesitter, { desc = 'List workspace symbols' })
vim.keymap.set('n', '<leader>tf', function()
    require('telescope.builtin').lsp_dynamic_workspace_symbols({ 
	symbols='function' ,
	file_ignore_patterns= {'/usr/include'}
    })
end
    , { desc = 'List document functions' })

