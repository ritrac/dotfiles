-- lazy.lua plugin

return {
    enabled = true,
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        require'nvim-treesitter.configs'.setup {

            ensure_installed = {
                "c", "cpp", "css", "go", "asm", "bash", "cuda", "diff",
                "gitcommit", "gitignore", "gowork", "json", "cmake",
                "make", "perl", "pod", "python", "php", "rst", "rust",
                "ssh_config", "tmux", "xml", "yaml", "zig",
                "lua", "vim", "vimdoc", "query", "elixir",
                "heex", "javascript", "html" },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true
                -- disable = { "c", "rust" },
            },
            indent = { enable = true },

            incremental_selection = { enable = true },
            textobjects = { enable = true },

        }
    end
}



