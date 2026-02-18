-- lazy.lua pluging
return {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = { 'rafamadriz/friendly-snippets' },

    -- use a release tag to download pre-built binaries
    version = '1.*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
        -- 'super-tab' for mappings similar to vscode (tab to accept)
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- NOTE: Get completion -> :help ins-completion
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        --keymap = { preset = 'default',
        --    ['<CR>'] = { 'accept', 'fallback' }
        -- },
        keymap = {
            preset = 'default',
            ['<C-t>'] = { 'snippet_backward', 'cancel', 'fallback' },
            ['<C-s>'] = { 'select_prev', 'fallback' },
            ['<C-r>'] = { 'select_next', 'fallback' },
            ['<C-n>'] = { 'select_and_accept', 'snippet_forward', 'fallback' },
        }, -- https://deepwiki.com/Saghen/blink.cmp/3.2-keymaps-configuration

        appearance = {
            -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },

        signature = { enabled = true },

        -- (Default) Only show the documentation popup when manually triggered
        completion = {
            documentation = { auto_show = true },
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' }, -- NOTE: default settings
            providers = {
                snippets = {
                    opts = {
                        friendly_snippets = true, -- default
                        -- TODO: set custom snippets with luasnip ?

                        -- see the list of frameworks in: https://github.com/rafamadriz/friendly-snippets/tree/main/snippets/frameworks
                        -- and search for possible languages in: https://github.com/rafamadriz/friendly-snippets/blob/main/package.json
                        extended_filetypes = {
                            markdown = { 'jekyll' },
                            cpp = { 'unreal' },
                        }
                    }
                }
            }
        },

        -- Use a preset for snippets, check the snippets documentation for more information
        -- snippets = { preset = 'default' | 'luasnip' | 'mini_snippets' | 'vsnip' },


        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
}
