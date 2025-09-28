return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local gruvbox = require("gruvbox")

			-- Base config
			local base_config = {
				terminal_colors = true,
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true,
				contrast = "hard", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {
					-- Floating windows
					Pmenu = { bg = "NONE" },
					PmenuBorder = { link = "FloatBorder" },

					CmpDocumentation = { bg = "NONE" },
					CmpDocumentationBorder = { link = "FloatBorder" },

					TelescopeNormal = { bg = "NONE" },
					TelescopeBorder = { link = "FloatBorder" },
					TelescopePromptNormal = { bg = "NONE" },
					TelescopePromptBorder = { link = "FloatBorder" },
					TelescopeResultsNormal = { bg = "NONE" },
					TelescopeResultsBorder = { link = "FloatBorder" },
					TelescopePreviewNormal = { bg = "NONE" },
					TelescopePreviewBorder = { link = "FloatBorder" },

					NormalFloat = { bg = "NONE" },
					FloatBorder = { bg = "NONE" },
					FloatTitle = { bg = "NONE" },

					-- Remove all gutter and sign backgrounds
					SignColumn = { bg = "NONE" },
					LineNr = { bg = "NONE" },
					CursorLineNr = { bg = "NONE" },
					FoldColumn = { bg = "NONE" },

					-- Git signs
					GitSignsAdd = { bg = "NONE" },
					GitSignsChange = { bg = "NONE" },
					GitSignsDelete = { bg = "NONE" },
					GitSignsAddNr = { bg = "NONE" },
					GitSignsChangeNr = { bg = "NONE" },
					GitSignsDeleteNr = { bg = "NONE" },
					GitSignsAddLn = { bg = "NONE" },
					GitSignsChangeLn = { bg = "NONE" },
					GitSignsDeleteLn = { bg = "NONE" },

					-- Diagnostic signs
					DiagnosticSignError = { bg = "NONE" },
					DiagnosticSignWarn = { bg = "NONE" },
					DiagnosticSignInfo = { bg = "NONE" },
					DiagnosticSignHint = { bg = "NONE" },

					-- Other common signs
					LspSignatureActiveParameter = { bg = "NONE" },
				},
				dim_inactive = false,
				transparent_mode = false,
			}

			-- Apply the colorscheme
			gruvbox.setup(base_config)
			vim.cmd.colorscheme("gruvbox")

			-- Toggle transparency
			local transparent = false
			local function toggle_transparency()
				transparent = not transparent
				base_config.transparent_mode = transparent
				gruvbox.setup(base_config)
				vim.cmd.colorscheme("gruvbox")
			end

			vim.keymap.set("n", "<leader>bg", toggle_transparency, { noremap = true, silent = true })
		end,
	},
}
