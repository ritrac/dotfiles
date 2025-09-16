return {
	-- theme
	{
		"rose-pine/neovim",
	},
	{
		"folke/tokyonight.nvim",
	},
	{
		"scottmckendry/cyberdream.nvim",
	},
	{
		"navarasu/onedark.nvim",
	},
	{
		"catppuccin/nvim",
	},
	{
		"projekt0n/github-nvim-theme",
	},
	{
		"EdenEast/nightfox.nvim",
		name = "nightfox",
		config = function()
			require("nightfox").setup({
			})
		end,
	},
}
