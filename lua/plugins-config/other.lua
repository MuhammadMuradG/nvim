--------------------------------------------------------------------------------
-- Gruvbox-material settings
--------------------------------------------------------------------------------
-- For dark or light scheme
vim.opt.background = 'dark'                      -- dark or light

vim.g.gruvbox_material_background = 'soft'       -- hard, soft or medium
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_disable_italic_comment = 0
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_cursor = 'auto'
vim.g.gruvbox_material_palette = 'material'      -- Available choice material, mix, original

-- This configuration option should be placed before `colorscheme gruvbox-material`
-- available values: 'hard', 'medium'(default), 'soft'
vim.g.gruvbox_material_bakground = 'soft'

vim.cmd('colorscheme gruvbox-material')          -- Available choice gruvbox-material, everforest, edge or gruvbox


--------------------------------------------------------------------------------
-- vim-ctrlspace settings
--------------------------------------------------------------------------------
vim.g.CtrlSpaceDefaultMappingKey = '<C-space> '  -- Required in Neovim

-- Enable Tabline
vim.g.CtrlSpaceUseTabline = 1
