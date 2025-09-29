-- Standalone plugins with less than 10 lines of config go here
return {
	{
		-- Detect tabstop and shiftwidth automatically
		"tpope/vim-sleuth",
	},
	{
		-- Powerful Git integration for Vim
		"tpope/vim-fugitive",
	},
	{
		-- GitHub integration for vim-fugitive
		"tpope/vim-rhubarb",
	},
	{
		-- Hints keybinds
		"folke/which-key.nvim",
	},
	{
		-- Autoclose parentheses, brackets, quotes, etc.
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		opts = {},
	},
	{
		-- Highlight todo, notes, etc in comments
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
	{
		-- High-performance color highlighter
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		-- tmux & nvim relations
		"christoomey/vim-tmux-navigator",
		lazy = false,
		keys = {
			{ "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Go to left pane" },
			{ "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Go to down pane" },
			{ "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Go to up pane" },
			{ "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Go to right pane" },
		},
	},
}
