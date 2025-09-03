-- Hide and show diagnostics

local function hide_diagnostics()
	vim.diagnostic.config({ -- https://neovim.io/doc/user/diagnostic.html
		virtual_text = false,
		signs = false,
		underline = false,
	})
end

local function show_diagnostics()
	vim.diagnostic.config({
		virtual_text = true,
		signs = true,
		underline = true,
	})
end

vim.keymap.set("n", "<leader>Dh", hide_diagnostics, { desc = "Hide diagnostics" })
vim.keymap.set("n", "<leader>Ds", show_diagnostics, { desc = "Show diagnostics" })

-- Auto hide diagnostics when opening a .c/.h file
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "*.c", "*.h" },
	callback = function(ev)
		hide_diagnostics()
	end,
})
