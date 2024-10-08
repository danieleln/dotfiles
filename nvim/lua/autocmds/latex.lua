-- Create a buffer in a new tab
local create_buffer_in_tab = function(name)
	local buf = vim.api.nvim_create_buf(true, true)
	vim.api.nvim_buf_set_name(buf, name)

	-- Open the buffer in a new tab
	vim.cmd("tabnew")
	vim.api.nvim_set_current_buf(buf)

	-- Enable ANSI colors
	vim.cmd(":AnsiEsc")

	-- Move the new tab to be the last tab
	vim.cmd(":tabmove $")

	-- Focus the last viewed tab
	vim.cmd("tabnext #")

	return buf
end

-- The output buffer will contain logs generated by latex-wizard
local out_buf = nil

-- Compile the LaTeX project when saving a `.tex` or `.bib` file
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.tex", "*.bib" },
	callback = function(ev)
		if out_buf == nil then
			-- Create an output buffer if it doesn't exist yet
			out_buf = create_buffer_in_tab("LaTeX Compile Output")
		else
			-- Clear the output buffer
			vim.api.nvim_buf_set_lines(out_buf, 0, -1, false, { "" })
		end

		-- Start the compilation
		vim.fn.jobstart({ "latex-wizard", "compile" }, {
			-- Set the current working directory to the directory of the
			-- file being saved
			cwd = vim.fn.fnamemodify(ev.file, ":h"),

			-- Print the stdout and stderr to the output buffer
			on_stderr = function(_, data, _)
				vim.api.nvim_buf_set_lines(out_buf, -1, -1, false, data)
			end,
			on_stdout = function(_, data, _)
				vim.api.nvim_buf_set_lines(out_buf, -1, -1, false, data)
			end,

			-- Print if compilation was ok
			on_exit = function(_, exit_code, _)
				if exit_code == 0 then
					print("Compilation finished succesfully")
				else
					print("Compilation failed with exit code " .. exit_code)
				end
			end,
		})
	end,
})
