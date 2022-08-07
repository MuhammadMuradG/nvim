require('auto-save').setup(
	{
		enabled = true,
		execution_message = {
			message = function() -- message to print on save
				return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
			end,
			dim = 0.18, -- dim the color of `message`, requires highlight group of MsgArea.
			cleaning_interval = 0, -- (milliseconds) automatically clean MsgArea after displaying `message`, 0 to disable. See :h MsgArea
		},
		events = {"InsertLeave", "TextChanged"},
		conditions = {
			exists = true,
			filetype_is_not = {},
			modifiable = true,
		},
		write_all_buffers = false
	}
)
