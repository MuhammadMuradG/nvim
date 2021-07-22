enabled = true,
execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
events = {"InsertLeave", "TextChanged"},
conditions = {
	exists = true,
	filetype_is_not = {},
	modifiable = true,
},
write_all_buffers = false,
