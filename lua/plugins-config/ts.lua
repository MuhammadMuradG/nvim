require('nvim-treesitter.configs').setup {
	ensure_installed = {
		'php',
		'javascript',
		'comment',
		'css',
		'python',
		'bash',
		'json',
		'html',
		'latex',
		'cpp',
		'c',
		'lua'
	},
	highlight = {
		enable = true
	},	
	indent = {
		enable = true
	},
}
