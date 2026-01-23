return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true }, -- big files optimi
        dashboard = { enabled = false },
        explorer = { enabled = true }, -- file explorer
        indent = { enabled = true }, -- indent guides and scopes
        input = { enabled = true }, -- "better vim.ui.input"
        picker = { enabled = true }, -- picker for selecting items
        notifier = { enabled = true },
        quickfile = { enabled = true }, -- loading speed optim
        scope = { enabled = true }, -- scope detection
        scroll = { enabled = false}, -- smooth scrolling
        statuscolumn = { enabled = false}, -- too wide
        words = { enabled = true }, -- auto-show LSP references
    },
}
