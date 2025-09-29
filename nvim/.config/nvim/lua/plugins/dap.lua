return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			-- Setup dapui
			ui.setup()

			-- Setup virtual text
			require("nvim-dap-virtual-text").setup()

			-- C++ configuration
			dap.adapters.cpp = {
				type = "executable",
				command = "gdb",
				args = { "-i", "dap" },
			}
			dap.configurations.cpp = {
				{
					name = "Launch C++ program",
					type = "cpp",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
			}
			dap.configurations.c = dap.configurations.cpp

			-- Python configuration (improved)
			dap.adapters.python = {
				type = "executable",
				command = "python3",
				args = { "-m", "debugpy.adapter" },
			}
			dap.configurations.python = {
				{
					type = "python",
					request = "launch",
					name = "Launch Python file",
					program = "${file}",
					console = "integratedTerminal",
					pythonPath = function()
						-- Try to find python in virtual env first
						local venv = os.getenv("VIRTUAL_ENV")
						if venv then
							return venv .. "/bin/python"
						end
						return "python3"
					end,
				},
				{
					type = "python",
					request = "launch",
					name = "Launch Python with args",
					program = "${file}",
					console = "integratedTerminal",
					args = function()
						local args_str = vim.fn.input("Arguments: ")
						if args_str == "" then
							return {}
						end
						return vim.split(args_str, " ", { trimempty = true })
					end,
					pythonPath = function()
						local venv = os.getenv("VIRTUAL_ENV")
						if venv then
							return venv .. "/bin/python"
						end
						return "python3"
					end,
				},
			}

			-- Keymaps
			vim.keymap.set("n", "<space>sb", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
			vim.keymap.set("n", "<space>gb", dap.run_to_cursor, { desc = "Run to cursor" })
			vim.keymap.set("n", "<space>?", function()
				require("dapui").eval(nil, { enter = true })
			end, { desc = "Evaluate expression" })

			-- Function keys for debugging
			vim.keymap.set("n", "<F5>", dap.continue, { desc = "Continue" })
			vim.keymap.set("n", "<F10>", dap.step_over, { desc = "Step over" })
			vim.keymap.set("n", "<F11>", dap.step_into, { desc = "Step into" })
			vim.keymap.set("n", "<F12>", dap.step_out, { desc = "Step out" })
			vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart debugger" })
			vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Terminate debugger" })

			-- Conditional breakpoint
			vim.keymap.set("n", "<leader>db", function()
				dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end, { desc = "Set conditional breakpoint" })

			-- DAP UI listeners
			dap.listeners.after.event_initialized["dapui_config"] = function()
				ui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				ui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				ui.close()
			end
		end,
	},
}
