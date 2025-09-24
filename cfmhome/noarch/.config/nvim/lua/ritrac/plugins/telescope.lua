return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        { 'nvim-telescope/telescope-ui-select.nvim' },
    },

    config = function()
        require('telescope').setup{
            pickers = {
                find_files = {
                    --theme = "ivy"
                }
            },
            extensions = {
                fzf = {}
            }
        }
        require('telescope').load_extension('fzf')
        require('telescope').load_extension('ui-select')
        local builtin = require('telescope.builtin')

        vim.keymap.set("n", "<space>ep", function()
           builtin.find_files {
                cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
            }
        end, {desc='Telescope data lazy'})

        --require "config.telescope.multigrep".setup()

        -- vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
        -- vim.keymap.set('n', '<leader>ps', function()
        --     builtin.grep_string({ search = vim.fn.input("Grep > ") })
        -- end)

        vim.keymap.set('n', '<leader>ft', function()
            --return builtin.git_files {cwd = vim.fn.expand("%:h")}
            return builtin.git_files {}
        end, { desc = 'Telescope find Git files'})

        vim.keymap.set("n", "<leader>fd", builtin.find_files, {desc='Telescope find files'})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep,  {desc='Telescope live grep' })
        --vim.keymap.set("n", "<leader>fg", require "custom.telescope.multi-ripgrep")
        vim.keymap.set('n', '<leader>fb', builtin.buffers,    {desc='Telescope buffers' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags,  {desc='Telescope help tags' })
        vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find,{desc='Buffer fuzzyfind' })

        vim.keymap.set("n", "<space>gw", builtin.grep_string, {desc='Telescope Grep String'})

        vim.keymap.set("n", "<space>en", function()
            builtin.find_files { cwd = vim.fn.stdpath "config" }
        end)


        vim.keymap.set('n', '<leader>td', builtin.lsp_definitions, { desc = 'Go to definition' })
        vim.keymap.set('n', '<leader>tD', builtin.lsp_implementations, { desc = 'Go to implementations' })
        vim.keymap.set('n', '<leader>ty', builtin.lsp_type_definitions, { desc = 'Go to T[y]pe definition' })
        vim.keymap.set('n', '<leader>tw', builtin.lsp_workspace_symbols, { desc = 'List workspace symbols' })
        vim.keymap.set('n', '<leader>ts', builtin.lsp_document_symbols, { desc = 'List document symbols' })
        vim.keymap.set('n', '<leader>tS', builtin.treesitter, { desc = 'List workspace symbols' })
        vim.keymap.set('n', '<leader>tf', function()
            require('telescope.builtin').lsp_dynamic_workspace_symbols({
                symbols='function' ,
                file_ignore_patterns= {'/usr/include'}
            })
        end
            , { desc = 'List document functions' })

    end
}

