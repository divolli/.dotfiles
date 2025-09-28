return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local mode = {
			"mode",
			fmt = function(str)
				return " " .. str
			end,
		}

		local filename = {
			"filename",
			file_status = true, -- displays file status (readonly status, modified status)
			path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
		}

		-- Shows buffers amount and current buffer
		local buffers_progress = function()
			local buffers = vim.fn.getbufinfo({ buflisted = 1 })
			local total = #buffers
			if total > 1 then
				local current = vim.fn.bufnr("%")
				-- Find index of current buffer in list
				local index = 0
				for i, buf in ipairs(buffers) do
					if buf.bufnr == current then
						index = i
						break
					end
				end
				return " " .. index .. "/" .. total
			end
			return ""
		end

		-- Same for tabs
		local tabs_progress = function()
			local total = vim.fn.tabpagenr("$")
			if total > 1 then
				local current = vim.fn.tabpagenr()
				return " " .. current .. "/" .. total
			end
			return ""
		end

		local hide_in_width = function()
			return vim.fn.winwidth(0) > 100
		end

		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " ", info = " ", hint = " " },
			colored = false,
			update_in_insert = false,
			always_visible = false,
			cond = hide_in_width,
		}

		local diff = {
			"diff",
			colored = false,
			symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
			cond = hide_in_width,
		}

		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "gruvbox-material", -- Set theme based on environment variable
				section_separators = { left = "", right = "" },
				component_separators = { left = "|", right = "|" },
				disabled_filetypes = { "alpha" },
				always_divide_middle = true,
				always_show_tabline = true,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
					refresh_time = 16, -- ~60fps
					events = {
						"WinEnter",
						"BufEnter",
						"BufWritePost",
						"SessionLoadPost",
						"FileChangedShellPost",
						"VimResized",
						"Filetype",
						"CursorMoved",
						"CursorMovedI",
						"ModeChanged",
					},
				},
			},
			sections = {
				lualine_a = { mode },
				lualine_b = { "branch", diff, diagnostics },
				lualine_c = { tabs_progress, buffers_progress, filename },
				lualine_x = {
					diagnostics,
					diff,
					{ "encoding", cond = hide_in_width },
					{ "filetype", cond = hide_in_width },
				},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { { "filename", path = 1 } },
				lualine_x = { { "location", padding = 0 } },
				lualine_y = {},
				lualine_z = {},
			},
			winbar = {},
			inactive_winbar = {},
			tabline = {},
			extensions = { "fugitive", "neo-tree" },
		})
	end,
}
