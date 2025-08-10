local M = {}

M.copy_file_path = function(_, item)
	if not item then
		return
	end

	local vals = {
		["BASENAME"] = vim.fn.fnamemodify(item.file, ":t:r"),
		["EXTENSION"] = vim.fn.fnamemodify(item.file, ":t:e"),
		["FILENAME"] = vim.fn.fnamemodify(item.file, ":t"),
		["PATH"] = item.file,
		["PATH (CWD)"] = vim.fn.fnamemodify(item.file, ":."),
		["PATH (HOME)"] = vim.fn.fnamemodify(item.file, ":~"),
		["URI"] = vim.uri_from_fname(item.file),
	}

	local options = vim.tbl_filter(function(val)
		return vals[val] ~= ""
	end, vim.tbl_keys(vals))
	if vim.tbl_isempty(options) then
		vim.notify("No values to copy", vim.log.levels.WARN)
		return
	end
	table.sort(options)
	vim.ui.select(options, {
		prompt = "Choose to copy to clipboard:",
		format_item = function(list_item)
			return ("%s: %s"):format(list_item, vals[list_item])
		end,
	}, function(choice)
		local result = vals[choice]
		if result then
			vim.fn.setreg("+", result)
			Snacks.notify.info("Yanked `" .. result .. "`")
		end
	end)
end

M.search_in_directory = function(_, item)
	if not item then
		return
	end
	local dir = vim.fn.fnamemodify(item.file, ":p:h")
	Snacks.picker.grep({
		cwd = dir,
		cmd = "rg",
		args = {
			"-g",
			"!.git",
			"-g",
			"!node_modules",
			"-g",
			"!dist",
			"-g",
			"!build",
			"-g",
			"!coverage",
			"-g",
			"!.DS_Store",
			"-g",
			"!.docusaurus",
			"-g",
			"!.dart_tool",
		},
		show_empty = true,
		hidden = true,
		ignored = true,
		follow = false,
		supports_live = true,
	})
end

M.search_in_directory_case_sensitive = function(_, item)
	if not item then
		return
	end
	local dir = vim.fn.fnamemodify(item.file, ":p:h")
	Snacks.picker.grep({
		cwd = dir,
		cmd = "rg",
		args = {
			"-s",
			"-g",
			"!.git",
			"-g",
			"!node_modules",
			"-g",
			"!dist",
			"-g",
			"!build",
			"-g",
			"!coverage",
			"-g",
			"!.DS_Store",
			"-g",
			"!.docusaurus",
			"-g",
			"!.dart_tool",
		},
		show_empty = true,
		hidden = true,
		ignored = true,
		follow = false,
		supports_live = true,
	})
end

M.diff = function(picker)
	picker:close()
	local sel = picker:selected()
	if #sel > 0 and sel then
		Snacks.notify.info(sel[1].file)
		-- vim.cmd("tabnew " .. sel[1].file .. " vert diffs " .. sel[2].file)
		vim.cmd("tabnew " .. sel[1].file)
		vim.cmd("vert diffs " .. sel[2].file)
		Snacks.notify.info("Diffing " .. sel[1].file .. " against " .. sel[2].file)
		return
	end

	Snacks.notify.info("Select two entries for the diff")
end

return M
