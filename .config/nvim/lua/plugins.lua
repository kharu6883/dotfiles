return {
    {
        "folke/tokyonight.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
        "nvim-telescope/telescope.nvim", tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("nvim-tree").setup {}
        end,
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {'williamboman/mason.nvim'},           -- Optional
            {'williamboman/mason-lspconfig.nvim'}, -- Optional
            
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'L3MON4D3/LuaSnip'},     -- Required
        }
    }
}
