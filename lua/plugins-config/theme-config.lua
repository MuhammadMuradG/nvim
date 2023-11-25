-- For dark or light scheme
vim.opt.background = 'dark'                      -- dark or light

vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_disable_italic_comment = 0
vim.g.gruvbox_material_enable_bold = 1
vim.g.gruvbox_material_cursor = 'auto'
vim.g.gruvbox_material_palette = 'material'      -- Available choices: material, mix, original

-- This option should be placed before `colorscheme gruvbox-material`
vim.g.gruvbox_material_background = 'hard'       -- Available values: 'hard', 'medium'(default), 'soft'

vim.cmd('colorscheme gruvbox-material')          -- Available choices: gruvbox-material, everforest, edge or gruvbox
