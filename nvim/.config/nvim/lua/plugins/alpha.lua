return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		dashboard.section.header.val = {
			[[_________/\\\_____________________________________/\\\\\\_____/\\\\\\__________        ]],
			[[ ________\/\\\____________________________________\////\\\____\////\\\__________       ]],
			[[  ________\/\\\___/\\\________________________________\/\\\_______\/\\\_____/\\\_      ]],
			[[   ________\/\\\__\///___/\\\____/\\\_____/\\\\\_______\/\\\_______\/\\\____\///__     ]],
			[[    ___/\\\\\\\\\___/\\\_\//\\\__/\\\____/\\\///\\\_____\/\\\_______\/\\\_____/\\\_    ]],
			[[     __/\\\////\\\__\/\\\__\//\\\/\\\____/\\\__\//\\\____\/\\\_______\/\\\____\/\\\_   ]],
			[[      _\/\\\__\/\\\__\/\\\___\//\\\\\____\//\\\__/\\\_____\/\\\_______\/\\\____\/\\\_  ]],
			[[       _\//\\\\\\\/\\_\/\\\____\//\\\______\///\\\\\/____/\\\\\\\\\__/\\\\\\\\\_\/\\\_ ]],
			[[        __\///////\//__\///______\///_________\/////_____\/////////__\/////////__\///__]],
		}

		-- Buttons
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert<CR>"),
			dashboard.button("f", "󰈞  Find file", ":cd | :Telescope find_files<CR>"),
			dashboard.button("r", "  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button("s", "  Settings", ":cd ~/.config/nvim | e $MYVIMRC<CR>"),
			dashboard.button("q", "󰅚  Quit", ":qa<CR>"),
		}

		-- Final setup
		alpha.setup(dashboard.opts)
	end,
}
