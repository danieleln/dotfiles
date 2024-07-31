local PLUGIN_DIR = "~/workspace/projects/nvim-plugins"

-- Adds all directories inside PLUGIN_DIR to the rtp
for plugin_name in vim.fs.dir(PLUGIN_DIR) do
	local plugin_dir = PLUGIN_DIR .. "/" .. plugin_name
	vim.opt.rtp:append(plugin_dir)
end

-- Unloads a single package
function unload_pkg(pkg_name)
	-- Removes '.lua' from the package name if present
	if pkg_name:match(".+%.lua") then
		pkg_name = pkg_name:sub(1, #pkg_name - 4)
	end

	-- Unloads the package. Since it might be stored either with slashes
	-- or dots, remove them both
	pkg_name_with_slashes = pkg_name:gsub("%.", "/")
	package.loaded[pkg_name_with_slashes] = nil

	pkg_name_with_dots = pkg_name:gsub("/", ".")
	package.loaded[pkg_name_with_dots] = nil
end

-- Recursively unloads a tree of packages
function unload_package_tree(pkg_path, pkg_name)
	-- Resolves ~ into /home/username (vim.fn.isdirectory requires
	-- the normalized path)
	local pkg_path = vim.fs.normalize(pkg_path)

	-- Gets the package name from the pkg_path if not given
	pkg_name = pkg_name or vim.fs.dirname(pkg_path)

	for dir in vim.fs.dir(pkg_path) do
		local inner_pkg_path = pkg_path .. "/" .. dir
		local inner_pkg_name = pkg_name .. "/" .. dir

		if vim.fn.isdirectory(inner_pkg_path) == 1 then
			unload_package_tree(inner_pkg_path, inner_pkg_name)
		else
			if dir == "init.lua" then
				unload_pkg(pkg_name)
			else
				unload_pkg(inner_pkg_name)
			end
		end
	end
end

-- Unloads all packages from PLUGIN_DIR
function unload_workspace(path)
	-- Defaults path to PLUGIN_DIR
	path = vim.fs.normalize(path or PLUGIN_DIR)

	-- Unloads all sub-packages
	for dir in vim.fs.dir(path) do
		-- Points to the `lua` directory inside the package
		local lua_dir = path .. "/" .. dir .. "/lua"

		for pkg_name in vim.fs.dir(lua_dir) do
			local pkg_dir = lua_dir .. "/" .. pkg_name
			if vim.fn.isdirectory(pkg_dir) then
				unload_package_tree(pkg_dir, pkg_name)
			end
		end
	end

	print("Unloaded local plugins")
end

-- Sets the keymap
vim.keymap.set("n", "<leader>wu", function()
	unload_workspace()
end, {
	desc = "[W]orkspace [U]nload local plugins",
	silent = true,
})

-- Load chromasync colorscheme
vim.cmd.colorscheme("chromasync")
