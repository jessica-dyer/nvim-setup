-- Import nvim-dap plugin safely
local dap_setup, dap = pcall(require, "dap")
if not dap_setup then
	return
end

-- Import the nvim-dap-python configuration
require("jessicadyer.plugins.nvim-dap-python")

-- Import nvim-dap-ui plugin safely
local dap_ui_setup, dapui = pcall(require, "dapui")
if dap_ui_setup then
	dapui.setup()
end

-- Setup keybindings for dap
vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<space>gb", dap.run_to_cursor)
vim.keymap.set("n", "<space>?", function()
	if dapui and dapui.eval then
		dapui.eval(nil, { enter = true })
	end
end)
vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F13>", dap.restart)

-- Automatically open/close dap-ui
dap.listeners.after.event_initialized["dapui_config"] = function()
	if dapui and dapui.open then
		dapui.open()
	end
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	if dapui and dapui.close then
		dapui.close()
	end
end
dap.listeners.before.event_exited["dapui_config"] = function()
	if dapui and dapui.close then
		dapui.close()
	end
end

-- Import gitsigns plugin safely
local gitsigns_setup, gitsigns = pcall(require, "gitsigns")
if gitsigns_setup then
	-- Configure/enable gitsigns
	gitsigns.setup()
end
