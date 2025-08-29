vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- UI
    use "goolord/alpha-nvim"

    use {
        "utilyre/barbecue.nvim",
        tag = "*",
        requires = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("barbecue").setup()
        end
    }

    use { "akinsho/bufferline.nvim", tag = "*", requires = "nvim-tree/nvim-web-devicons" }

    use { "catppuccin/nvim", as = "catppuccin" }

    use "sindrets/diffview.nvim"

    use { "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons" } }

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        }
    }

    use "lukas-reineke/indent-blankline.nvim"

    use "nvim-tree/nvim-web-devicons"

    use { "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function()
        vim.g.mkdp_filetypes = {
            "markdown" }
    end, ft = { "markdown" }, }

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup()
        end
    }

    -- GIT

    use "f-person/git-blame.nvim"

    use {
        "NeogitOrg/neogit",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
            "ibhagwan/fzf-lua"
        }
    }

    -- NAV
    use "declancm/cinnamon.nvim"

    use { "ggandor/leap.nvim", requires = { "tpope/vim-repeat" } }

    use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }
    use "nvim-telescope/telescope-ui-select.nvim"

    use "folke/trouble.nvim"

    use { "nvim-treesitter/nvim-treesitter", tag = "v0.9.3", run = ":TSUpdate" }
    use { "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter", requires = "nvim-treesitter/nvim-treesitter" }

    -- LSP / DAP

    use {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {
            { "neovim/nvim-lspconfig" },
            { "mason-org/mason.nvim",           branch = "v1.x" },
            { "mason-org/mason-lspconfig.nvim", branch = "v1.x" },
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lua" },
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" }
        }
    }

    use "mfussenegger/nvim-dap"
    use { "mfussenegger/nvim-jdtls", requires = "mfussenegger/nvim-dap" }
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" } }

    use "https://gitlab.com/schrieveslaach/sonarlint.nvim"

    use "stevearc/conform.nvim"

    use "mfussenegger/nvim-lint"

    -- MISC

    use "famiu/bufdelete.nvim"

    use "terrortylor/nvim-comment"

    use "echasnovski/mini.pairs"

    use "kylechui/nvim-surround"

    use "tpope/vim-sleuth"
end)
