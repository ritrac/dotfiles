return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.8",

    dependencies = {
	"nvim-lua/plenary.nvim",
	{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },

    config = function()
	require('telescope').setup{
	    pickers = {
		find_files = {
		    theme = "ivy"
		}
	    },
	    extensions = {
		fzf = {}
	    }
	}

	require('telescope').load_extension('fzf')

	-- Prime
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
	vim.keymap.set('n', '<C-p>', builtin.git_files, {})
	vim.keymap.set('n', '<leader>pws', function()
	    local word = vim.fn.expand("<cword>")
	    builtin.grep_string({ search = word })
	end)
	vim.keymap.set('n', '<leader>pWs', function()
	    local word = vim.fn.expand("<cWORD>")
	    builtin.grep_string({ search = word })
	end)
	vim.keymap.set('n', '<leader>ps', function()
	    builtin.grep_string({ search = vim.fn.input("Grep > ") })
	end)
	-- TJ:
	vim.keymap.set('n', '<leader>vh', builtin.help_tags, {desc='Telescope help tags'})
	vim.keymap.set("n", "<space>fh", require('telescope.builtin').help_tags, {desc='Telescope help tags'})
	vim.keymap.set("n", "<space>fd", require('telescope.builtin').find_files, {desc='Telescope find files'})
	vim.keymap.set("n", "<space>en", function()
	    require('telescope.builtin').find_files {
		cwd = vim.fn.stdpath("config")
	    }
	end, {desc='Telescope find config'})
	vim.keymap.set("n", "<space>ep", function()
	    require('telescope.builtin').find_files {
		cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
	    }
	end, {desc='Telescope data lazy'})

	--require "config.telescope.multigrep".setup()
    end
}

