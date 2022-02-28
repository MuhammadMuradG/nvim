--------------------------------------------------------------------------------
-- Genreal settings
--------------------------------------------------------------------------------
-- You can enable loading the plugin files and the indent file for specific
-- file types with:
vim.opt.filetype = "on"
vim.opt.filetype.plugin = "on"
vim.opt.filetype.indent = "on"

vim.opt.encoding = "utf-8"
vim.opt.syntax = "on"
vim.opt.number = true
vim.opt.ruler = true
vim.opt.mouse = "a"

-- Required by CtrlSpace and coc.nvim
--vim.opt.nocompatible = true
vim.opt.hidden = true

-- Color correction
vim.opt.termguicolors = true

-- Enable tabline
vim.opt.showtabline = 2

-- Auto word wrap to 80 characters
--vim.opt.textwidth = 80
--vim.opt.formatoptions = formatoptions + t

-- Show soft vertical line at 80
vim.opt.colorcolumn = string.format(80)

-- Show .... characters at warped line (sbr)
vim.opt.showbreak = ".... "

-- indent wapped lines
vim.opt.breakindentopt = {shift=4, min=40, sbr=true}

-- Referenc for tab https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
-- tabstop: Number of spaces that a <Tab> in the file counts for.
-- softtabstop: Number of spaces that a <Tab> counts in editing mode (if using
-- tab character in code).
-- shiftwidth: The size of an 'indent'. It's also measured in spaces
vim.opt.list = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false
vim.opt.listchars = {eol = '⏎', tab = '│ '}  -- You can use "eol:'¬', tab:'▸ '" and "eol:'⏎', tab:'| '"
