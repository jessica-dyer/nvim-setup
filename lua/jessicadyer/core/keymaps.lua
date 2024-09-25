-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps
---------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>")

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- increment
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

----------------------
-- Plugin Keybinds
----------------------

local M = {}

-- vim-maximizer
M.maximizer = {
	n = {
		["<leader>sm"] = ":MaximizerToggle<CR>", -- toggle split window maximization
	},
}

-- nvim-tree
M.nvim_tree = {
	n = {
		["<leader>e"] = ":NvimTreeToggle<CR>", -- toggle file explorer
	},
}

-- telescope
M.telescope = {
	n = {
		["<leader>ff"] = "<cmd>Telescope find_files<cr>", -- find files
		["<leader>fs"] = "<cmd>Telescope live_grep<cr>", -- find string as you type
		["<leader>fc"] = "<cmd>Telescope grep_string<cr>", -- find string under cursor
		["<leader>fb"] = "<cmd>Telescope buffers<cr>", -- list open buffers
		["<leader>fh"] = "<cmd>Telescope help_tags<cr>", -- list available help tags

		-- telescope git commands
		["<leader>gc"] = "<cmd>Telescope git_commits<cr>", -- list all git commits
		["<leader>gfc"] = "<cmd>Telescope git_bcommits<cr>", -- list git commits for current file
		["<leader>gb"] = "<cmd>Telescope git_branches<cr>", -- list git branches
		["<leader>gs"] = "<cmd>Telescope git_status<cr>", -- list current changes per file
	},
}

-- lsp
M.lsp = {
	n = {
		["<leader>rs"] = ":LspRestart<CR>", -- restart LSP server
	},
}

-- Function to load keymaps
local function load_keymaps()
	for _, section in pairs(M) do
		for mode, mappings in pairs(section) do
			for keybind, command in pairs(mappings) do
				keymap.set(mode, keybind, command, { noremap = true, silent = true })
			end
		end
	end
end

-- Load keymaps
load_keymaps()
