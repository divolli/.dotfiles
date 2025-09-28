-- Line Numbers and Display
vim.wo.number = true -- Make line numbers default (default: false)
vim.o.relativenumber = true -- Set relative numbered lines (default: false)
vim.o.numberwidth = 2 -- Set number column width to 2 {default 4}
vim.o.cursorline = false -- Highlight the current line (default: false)
vim.wo.signcolumn = "yes" -- Keep signcolumn on by default (default: 'auto')
vim.opt.termguicolors = true -- Set termguicolors to enable highlight groups (default: false)

-- Line Wrapping and Display
vim.o.wrap = false -- Display lines as one long line (default: true)
vim.o.linebreak = true -- Companion to wrap, don't split words (default: false)
vim.o.breakindent = true -- Enable break indent (default: false)
vim.o.scrolloff = 4 -- Minimal number of screen lines to keep above and below the cursor (default: 0)
vim.o.sidescrolloff = 8 -- Minimal number of screen columns either side of cursor if wrap is `false` (default: 0)

-- Tabulation and Indentation
vim.o.shiftwidth = 2 -- The number of spaces inserted for each indentation (default: 8)
vim.o.tabstop = 2 -- Insert n spaces for a tab (default: 8)
vim.o.softtabstop = 2 -- Number of spaces that a tab counts for while performing editing operations (default: 0)
vim.o.expandtab = true -- Convert tabs to spaces (default: false)
vim.o.autoindent = true -- Copy indent from current line when starting new one (default: true)
vim.o.smartindent = true -- Make indenting smarter again (default: false)

-- Search and Case Sensitivity
vim.o.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search (default: false)
vim.o.smartcase = true -- Smart case (default: false)
vim.o.hlsearch = false -- Set highlight on search (default: true)
vim.o.inccommand = "split" -- Live preview of :s commands

-- Split Windows
vim.o.splitbelow = true -- Force all horizontal splits to go below current window (default: false)
vim.o.splitright = true -- Force all vertical splits to go to the right of current window (default: false)

-- Clipboard and Mouse
vim.o.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim. (default: '')
vim.o.mouse = "a" -- Enable mouse mode (default: '')

-- UI and Status
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore (default: true)
vim.o.showtabline = 0 -- Always show tabs (default: 1)
vim.o.laststatus = 2 -- Global statusline
vim.o.cmdheight = 0 -- More space in the Neovim command line for displaying messages (default: 1)
vim.o.pumheight = 10 -- Pop up menu height (default: 0)
vim.o.winborder = "rounded" -- adds border fow floating windows

-- Navigation and Movement
vim.o.whichwrap = "bs<>[]hl" -- Which "horizontal" keys are allowed to travel to prev/next line (default: 'b,s')
vim.o.backspace = "indent,eol,start" -- Allow backspace on (default: 'indent,eol,start')
vim.o.virtualedit = "block" -- Allow cursor past end of line in visual block mode

-- File Handling and Safety
vim.o.swapfile = false -- Creates a swapfile (default: true)
vim.o.backup = false -- Creates a backup file (default: false)
vim.o.writebackup = false -- If a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited (default: true)
vim.o.undofile = true -- Save undo history (default: false)
vim.o.confirm = true -- Confirm before closing unsaved files
vim.o.fileencoding = "utf-8" -- The encoding written to a file (default: 'utf-8')

-- Performance and Timing
vim.o.updatetime = 250 -- Decrease update time (default: 4000)
vim.o.timeoutlen = 300 -- Time to wait for a mapped sequence to complete (in milliseconds) (default: 1000)

-- Completion
vim.o.completeopt = "menuone,noselect" -- Set completeopt to have a better completion experience (default: 'menu,preview')

-- Special Features
vim.o.conceallevel = 0 -- So that `` is visible in markdown files (default: 1)

-- Folding
vim.o.foldmethod = "expr"
vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.o.foldlevel = 99
vim.o.foldenable = true
vim.o.foldlevelstart = 99 -- Start with all folds open

-- Ensure folding works after file load
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
	callback = function()
		vim.defer_fn(function()
			vim.cmd("normal! zx")
		end, 100) -- Small delay to ensure Treesitter is ready
	end,
})

-- Advanced Options
vim.opt.shortmess:append("c") -- Don't give |ins-completion-menu| messages (default: does not include 'c')
vim.opt.iskeyword:append("-") -- Hyphenated words recognized by searches (default: does not include '-')
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth', hitting <Enter> in insert mode, or hitting 'o' or 'O' in normal mode. (default: 'croql')
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- Separate Vim plugins from Neovim in case Vim still in use (default: includes this path if Vim is installed)
