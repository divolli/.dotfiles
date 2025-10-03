return {
	"mikavilpas/yazi.nvim",
	version = "*", -- use the latest stable version
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", lazy = true },
	},
	keys = {
		-- 👇 in this section, choose your own keymappings!
		{
			"<leader>y",
			mode = { "n", "v" },
			"<cmd>Yazi<cr>",
			desc = "Open yazi at the current file",
		},
		{
			-- Open in the current working directory
			"<leader>cw",
			"<cmd>Yazi cwd<cr>",
			desc = "Open the file manager in nvim's working directory",
		},
		{
			"<c-up>",
			"<cmd>Yazi toggle<cr>",
			desc = "Resume the last yazi session",
		},
	},
	opts = {
		-- Enable opening multiple files at once
		open_for_directories = false,

		-- Keymaps inside yazi
		keymaps = {
			show_help = "<f1>",
			open_file_in_vertical_split = "<c-v>",
			open_file_in_horizontal_split = "<c-x>",
			open_file_in_tab = "<c-t>",
			grep_in_directory = "<c-s>",
			replace_in_directory = "<c-g>",
			cycle_open_buffers = "<tab>",
			copy_relative_path_to_selected_files = "<c-y>",
			send_to_quickfix_list = "<c-q>",
		},

		-- Floating window configuration
		floating_window_scaling_factor = 0.9,
		yazi_floating_window_winblend = 0,
		yazi_floating_window_border = "rounded",

		-- Highlight group for selected files
		highlight_groups = {
			hovered_buffer = { link = "Visual" },
		},

		-- Integration with other plugins
		integrations = {
			grep_in_directory = function(directory)
				-- Use telescope if available
				require("telescope.builtin").live_grep({
					search_dirs = { directory },
				})
			end,
		},

		-- Log level (for debugging)
		log_level = vim.log.levels.OFF,
	},
}
