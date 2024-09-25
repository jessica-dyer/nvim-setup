-- Import dap-python plugin safely
local dap_python_setup, dap_python = pcall(require, "dap-python")
if dap_python_setup then
	-- Set up dap-python without specifying the path, as we will determine it dynamically
	dap_python.setup(nil)
end

-- Additional dap configurations for Python
local dap_setup, dap = pcall(require, "dap")
if dap_setup then
	dap.configurations.python = {
		{
			type = "python",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			pythonPath = function()
				-- Dynamically use the pyenv Python version
				return vim.fn.systemlist("pyenv which python")[1]
			end,
		},
	}
end
