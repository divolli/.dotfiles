return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		-- Replace the built-in f/t motions
		{
			"f",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash f",
		},
		{
			"t",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump({
					search = { forward = true, wrap = false, multi_window = false },
					label = { after = { 0, 0 } },
				})
			end,
			desc = "Flash t",
		},
		{
			"F",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump({ search = { forward = false } })
			end,
			desc = "Flash F",
		},
		{
			"T",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump({
					search = { forward = false, wrap = false, multi_window = false },
					label = { after = { 0, 0 } },
				})
			end,
			desc = "Flash T",
		},
	},
}
