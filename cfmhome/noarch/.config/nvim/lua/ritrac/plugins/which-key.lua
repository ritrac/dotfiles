return {
  "folke/which-key.nvim",
  --event = "VeryLazy",
  event = "VimEnter",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    delay = 500, -- ms 
      icons = {
        -- set icon mappings to true if you have a Nerd Font
	    mappings = vim.g.have_nerd_font, 
	},
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = true})
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
