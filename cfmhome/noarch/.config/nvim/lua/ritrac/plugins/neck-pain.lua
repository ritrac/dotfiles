return {
    "shortcuts/no-neck-pain.nvim",
    version = '*',
    enabled = true,
    config = function()
        require('no-neck-pain').setup({
            width = 90, -- ~80-85 usable columns
            mappings = {
                enabled = true,
                -- toggle = "<Leader>np"
                -- toggleLeftSide = "<Leader>nql"
                -- toggleRightSide = "<Leader>nqr"
                -- widthUp = "<Leader>n="
                widthUp = "<Leader>n+"
                -- widthDown = "<Leader>n-"
                -- scratchPad = "<Leader>ns"
            },
            buffers = {
                disable_scroll = true,
                colors = {
                    background = "#000000",
                    -- blend = -0.3,
                }
            },
            autocmds = {
                enableOnVimEnter = true,
                enableOnTabEnter = true,
                skipEnterNoNeckPainBuffer = true,
            },
        })
        require('no-neck-pain').enable()
    end
}
