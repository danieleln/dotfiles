-- Run a shell comamnd and print its output only when the cmd fails
local run_shell_cmd = function(cmd)
	-- Run the command and print its return code
	local handle = io.popen(cmd .. "; echo $?")

	if handle == nil then
		print(string.format("Can't run command %s", cmd))
		return 1
	end

	-- Read and close the pipe
	local result = handle:read("*a")
	handle:close()

	-- Extract the exit code from the last line of the result
	local exit_code = tonumber(result:match("(%d+)%s*$")) or 0
	-- Extract the command output, which is everything but the last line
	local output = result:gsub("(%d+)%s*$", ""):gsub("%s+$", "")

	-- Print the output only when compilation fails
	if exit_code ~= 0 then
		print(output)
		return 1
	end

	return 0
end

-- Autocommand to recompile LaTeX projects on save
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.tex", "*.bib" },
	callback = function(ev)
		local current_dir = vim.fn.fnamemodify(ev.file, ":h")
		run_shell_cmd("cd " .. current_dir .. " && latex-wizard compile")
	end,
})
