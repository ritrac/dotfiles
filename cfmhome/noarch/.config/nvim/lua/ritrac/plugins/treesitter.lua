-- lazy.lua plugin

return {
    enabled = true,
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    lazy = false,

    config = function()
        local parsers = {
            "c", "cpp", "css", "go", "asm", "bash", "cuda", "diff",
            "gitcommit", "gitignore", "gowork", "json", "cmake",
            "make", "perl", "pod", "python", "php", "rst", "rust",
            "ssh_config", "tmux", "xml", "yaml", "zig", "go", "css",
            "lua", "vim", "vimdoc", "query", "elixir", "regex",
            "heex", "javascript", "html", "markdown", "markdown_inline" }

        require('nvim-treesitter').install(parsers)

        vim.api.nvim_create_autocmd('FileType', {
            callback = function(args)
                local buf, filetype = args.buf, args.match
                local language = vim.treesitter.language.get_lang(filetype)
                if not language then return end

                -- check if parser exists and load it
                if not vim.treesitter.language.add(language) then return end
                -- enables syntax highlighting and other treesitter features
                vim.treesitter.start(buf, language)

                -- enables treesitter based folds
                -- for more info on folds see `:help folds`-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                -- vim.wo.foldmethod = 'expr'

                vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end
}
