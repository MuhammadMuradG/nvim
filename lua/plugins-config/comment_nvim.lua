-- pass config options here
require('Comment').setup(
	{
		---LHS of toggle mappings in NORMAL mode
		toggler = {
			---Line-comment toggle keymap
			line = '<leader>cc',
		},
		---LHS of operator-pending mappings in NORMAL and VISUAL mode
		opleader = {
			---Line-comment keymap
			line = '<leader>c',
		},
	}
)
