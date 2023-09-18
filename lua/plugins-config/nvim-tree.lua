-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	view = {
		width = 30,
	},
	renderer = {
		group_empty = true,
		indent_width = 2,
		indent_markers = {
			enable = true,
		},
		icons = {
			show = {
				folder_arrow = false,
			},
		},
	},
	filters = {
		dotfiles = true,
	},
	update_focused_file = {
		enable = true
	},
})

-- Open the tree and Startify if no file is opened.
local function open_nvim_tree()
	if vim.fn.argc() == 0 then
		vim.cmd("Startify")
	end
	require("nvim-tree.api").tree.toggle({ focus = false, find_file = true, })
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- Automatically close nvim-tree if quit from last buffer
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	callback = function()
		if (vim.fn.winnr("$") == 1 and vim.bo.filetype == "NvimTree") then
			vim.cmd("q")
		end
	end
})
