require("indent_blankline").setup {
    char = "│",

    buftype_exclude = {
		"terminal"
	},

	filetype_exclude = {
		'help',
		'startify',
		'coc-explorer',
		'packer'
	}
}
