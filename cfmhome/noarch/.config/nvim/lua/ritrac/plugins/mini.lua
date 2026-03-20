-- lazy.lua plugin
return {
    'echasnovski/mini.nvim',
    enabled = true,
    config = function()
        local git = require 'mini.git' -- used by statusline
        git.setup()

        local diff = require 'mini.diff' -- used by statusline
        diff.setup()

        local statusline = require 'mini.statusline'
        statusline.setup({
            use_icons = vim.g.have_nerd_font,

            content = {
                -- Better visibility for inactive statusline, format:
                -- =========== [/path/fname] ===========
                inactive = function()
                    local width = vim.api.nvim_win_get_width(0)
                    local fformat = MiniStatusline.section_filename({
                        trunc_width = width - 5
                    })
                    local filename = vim.fn.expand(fformat)

                    -- NoNeckPain scratch buffer (expanded to '')
                    if (filename == '') then
                        return '%#MiniStatuslineInactive#%='
                    end

                    local len = vim.fn.strdisplaywidth(filename)
                    local fill_len = math.max(width - len - 4, 0) / 2
                    -- local fill = string.rep('=', fill_len)
                    local fill = string.rep('─', fill_len)
                    -- local fill = string.rep('▁', fill_len)

                    return '%#MiniStatuslineInactive#' .. fill .. ' [' .. filename ..
                        '] ' .. fill .. '%='
                end,
            },
        })

        local pair = require 'mini.pairs'
        pair.setup()

        local icons = require 'mini.icons'
        icons.setup()

        local scope = require('mini.indentscope')
        scope.setup({
            draw = {
                animation = require("mini.indentscope").gen_animation.none()
            },
        })

        local trail = require 'mini.trailspace'
        trail.setup()

        local ai = require 'mini.ai' -- !!! not an LLM thing
        ai.setup()

        local notify = require 'mini.notify'
        notify.setup()
    end
}
