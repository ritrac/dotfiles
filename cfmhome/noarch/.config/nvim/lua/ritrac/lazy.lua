-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "ritrac.plugins" },
    -- { import = "ritrac.treesitter" },
    -- { import = "ritrac.mini" },
    -- { import = "ritrac.harpoon" },
    -- { import = "ritrac.undotree" },
    -- { import = "ritrac.fujitive" },
    -- { import = "ritrac.lsp-zero" },
    -- { import = "ritrac.completion" },
    -- { import = "ritrac.lsp" },

    -- telescope:
    --  { "nvim-telescope/telescope.nvim", tag = '0.1.8' },
    -- { "sharkdp/fd", tag = 'v10.2.0' },

    -- theme
    --{ "rose-pine/neovim", config=function() vim.cmd.colorscheme "rose-pine" end},
    --{ "folke/tokyonight.nvim", config=function() vim.cmd.colorscheme "tokyonight" end},
    -- { "scottmckendry/cyberdream.nvim", config=function() vim.cmd.colorscheme "cyberdream" end},
    --{ "navarasu/onedark.nvim", config=function() vim.cmd.colorscheme "onedark" end},

  },
    change_detection = {
	enabled = false,
	notify = false,

    },
  -- Configuresharkdp/fd] any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = {
	enabled = true,
	notify = true,
	frequency = 3600 * 24 * 7, -- in seconds
    },
})
