return {
    "shortcuts/no-neck-pain.nvim",
    version = '*',
    enabled = true,
    config = function()
        require('no-neck-pain').setup({
            -- width = 120,
            mappings = {
                enabled = true,
            },
            buffers = {
                disable_scroll = true,
                colors = {
                    background = "#000000",
                    -- blend = -0.3,
                }
            },
        })
        require('no-neck-pain').enable()
    end
}
