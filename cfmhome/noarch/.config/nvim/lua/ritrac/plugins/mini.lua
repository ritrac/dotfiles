-- lazy.lua plugin
return {
    'echasnovski/mini.nvim',
    enabled = true,
    config = function()
	local statusline = require 'mini.statusline'
	statusline.setup { use_icons = vim.g.have_nerd_font }
	local pair = require 'mini.pairs'
	pair.setup()
	local icons = require 'mini.icons'
	icons.setup()
	local scope = require('mini.indentscope')
	scope.setup { draw = { animation = require("mini.indentscope").gen_animation.none() },}
	local trail = require 'mini.trailspace'
	trail.setup()
    end
}

