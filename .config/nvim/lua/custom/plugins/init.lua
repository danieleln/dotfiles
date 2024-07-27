-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
	{
		"lervag/vimtex",
		config = function()
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_mappings_enabled = 0

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

			-- Compile a LaTeX file
			local compile_tex = function(filename, out_dir)
				-- -- Make the output directory
				-- local current_file_dir = vim.fn.expand("%:p:h")
				-- local out_dir = current_file_dir .. "/" .. out_dir
				--
				-- if vim.fn.isdirectory(out_dir) == 0 then
				-- 	vim.fn.mkdir(out_dir)
				-- end
				--
				-- if vim.fn.isdirectory(out_dir) == 0 then
				-- 	print("Can't create output directory " .. out_dir)
				-- 	return 1
				-- end

				-- Command to compile *.tex files
				local cmd = table.concat({
					"pdflatex",
					"-halt-on-error",
					-- "-output-directory",
					-- out_dir,
					filename,
				}, " ")

				return run_shell_cmd(cmd)
			end

			-- Compile *.bib files
			local compile_bib = function(filename, input_dir)
				print("BIBER " .. filename)
				local cmd = table.concat({
					"biber",
					-- "--input-directory",
					-- input_dir,
					-- "--output-directory",
					-- input_dir,
					filename,
				}, " ")

				return run_shell_cmd(cmd)
			end

			-- Directory where to store generated output files
			local OUTPUT_DIRECTORY_NAME = "out"

			-- Auto-command to compile LaTeX on save
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = "*.tex",
				callback = function(ev)
					-- By default, compile only tex files whose name is `main.tex`
					if ev.file:sub(-8) ~= "main.tex" then
						local answer = vim.fn.input("Do you want to compile `" .. ev.file .. "`? [N/y]")
						if answer ~= "y" and answer ~= "Y" then
							return
						end
					end
					compile_tex(ev.file, OUTPUT_DIRECTORY_NAME)
				end,
			})

			-- Auto-command to compile *.bib files on save
			vim.api.nvim_create_autocmd("BufWritePost", {
				pattern = "*.bib",
				callback = function(ev)
					-- Get the directory of the current file
					local current_file_dir = vim.fn.expand("%:p:h")
					local tex_file_to_compile = nil

					-- Find all .tex files in the directory
					local tex_files = vim.fn.globpath(current_file_dir, "*.tex", false, true)

					if #tex_files == 0 then
						vim.api.nvim_out_write("No .tex files found in the directory.\n")
						return 1
					elseif #tex_files > 1 then
						-- TODO: check for multiple .tex files
					end

					tex_file_to_compile = tex_files[1]

					-- Compile the .tex file a first time
					local rc = compile_tex(tex_file_to_compile, OUTPUT_DIRECTORY_NAME)
					if rc ~= 0 and rc ~= nil then
						return
					end

					-- Remove the .tex extension and compile the .bib file
					local tex_file_wo_ext = tex_file_to_compile
					if tex_file_wo_ext:sub(-4) == ".tex" then
						tex_file_wo_ext = tex_file_wo_ext:sub(1, -5)
					end

					local rc = compile_bib(tex_file_wo_ext, OUTPUT_DIRECTORY_NAME)
					if rc ~= 0 and rc ~= nil then
						return
					end

					-- Compile the .tex file a second time
					compile_tex(tex_file_to_compile, OUTPUT_DIRECTORY_NAME)
					print(tex_file_to_compile, tex_file_wo_ext)
				end,
			})
		end,
	},
}
