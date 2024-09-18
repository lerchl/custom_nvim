-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'goolord/alpha-nvim',
		config = function ()
			require'alpha'.setup(require'alpha.themes.dashboard'.config)
		end
	}

	use { "folke/noice.nvim", dependencies = {
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	}

	use "nvim-tree/nvim-web-devicons"

	-- use "scottmckendry/cyberdream.nvim";
	-- use "nyoom-engineering/oxocarbon.nvim"
	-- use "EdenEast/nightfox.nvim"
	use { "catppuccin/nvim", as = "catppuccin" }

	use "folke/which-key.nvim"

	use "sindrets/diffview.nvim"

	use {
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"ibhagwan/fzf-lua"
		}
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons' }
	}

	use "f-person/git-blame.nvim"

	use {
		'nvim-telescope/telescope.nvim',
		requires = {{ 'nvim-lua/plenary.nvim' }}
	}

	use "folke/trouble.nvim"

	use "lukas-reineke/indent-blankline.nvim"

	use "terrortylor/nvim-comment"

	use { 'nvim-treesitter/nvim-treesitter', tag = "v0.9.2", run = ':TSUpdate' }
	use {
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	}

	use {
		"kylechui/nvim-surround",
		tag = "*"
	}

	use {'stevearc/dressing.nvim'}

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

	use "echasnovski/mini.pairs"

	use {'akinsho/bufferline.nvim', tag = "v4.5.3", requires = 'nvim-tree/nvim-web-devicons'}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lua'},
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'}
		}
	}

	use { "SmiteshP/nvim-navic", requires = "neovim/nvim-lspconfig" }
	use {
		"SmiteshP/nvim-navbuddy",
		requires = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
			"nvim-telescope/telescope.nvim" -- Optional
		}
	}

	use { "mfussenegger/nvim-jdtls", requires = "mfussenegger/nvim-dap" }

	use "mfussenegger/nvim-dap"
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
end)

