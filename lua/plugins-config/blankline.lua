require("indent_blankline").setup {
    char = "│",
	show_first_indent_level = true,

	use_treesitter = true,

    buftype_exclude = {
		"terminal",
	},

	filetype_exclude = {
		'help',
		'startify',
		'NvimTree',
		'packer',
	}
}
