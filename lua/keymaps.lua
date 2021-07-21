--------------------------------------------------------------------------------
-- Remap Keys. Use :mapclear command to reset all key map to default
--------------------------------------------------------------------------------
-- Map leader
vim.g.mapleader = '\\'

-- noremap: non recursive normal, visual, select and operating-pending map
vim.api.nvim_set_keymap('', '<C-c><C-c>', '"+y', {noremap = true})
vim.api.nvim_set_keymap('', '<C-c><C-c>', '"+x', {noremap = true})
vim.api.nvim_set_keymap('', '<C-c><C-c>', '"+p', {noremap = true})

-- Navigate between opened windows
vim.api.nvim_set_keymap('n', '<C-h>', '<C-W>h', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-l>', '<C-W>l', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-k>', '<C-W>k', {noremap = true})
vim.api.nvim_set_keymap('n', '<C-j>', '<C-W>j', {noremap = true})

-- Map keypad when numlock is off to arrows
-- -- For normal mode
vim.api.nvim_set_keymap('', '<kUp>', '<Up>', {noremap = true})
vim.api.nvim_set_keymap('', '<kDown>', '<Down>',{noremap = true})
vim.api.nvim_set_keymap('', '<kRight>', '<Right>', {noremap = true})
vim.api.nvim_set_keymap('', '<kLeft>', '<Left>', {noremap = true})
-- -- For terminal mode
vim.api.nvim_set_keymap('t', '<kUp>', '<Up>', {noremap = true})
vim.api.nvim_set_keymap('t', '<kDown>', '<Down>', {noremap = true})
vim.api.nvim_set_keymap('t', '<kRight>', '<Right>', {noremap = true})
vim.api.nvim_set_keymap('t', '<kLeft>', '<Left>', {noremap = true})
-- -- For insert, command-line and lang-Arg modes
vim.api.nvim_set_keymap('l', '<kUp>', '<Up>', {noremap = true})
vim.api.nvim_set_keymap('l', '<kDown>', '<Down>', {noremap = true})
vim.api.nvim_set_keymap('l', '<kRight>', '<Right>', {noremap = true})
vim.api.nvim_set_keymap('l', '<kLeft>', '<Left>', {noremap = true})

-- Go to next buffer, also you can use :bdelete in the following command
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', {noremap = true})
-- Go to previous buffer
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', {noremap = true})
-- Go to next tab
vim.api.nvim_set_keymap('n', '<S-Tab><Tab>', ':tabnext<CR>', {noremap = true})

-- Delete the current buffer completely and close its window
vim.api.nvim_set_keymap('n', '<C-q><C-q>', ':bwipe!<bar>if bufname()==""<bar>q<bar>endif<CR>', {noremap = true, silent = true})
-- Close the buffer without changing the layout of windows
vim.api.nvim_set_keymap('n', '<C-f><C-f>', ':bp<bar>sp<bar>bn<bar>bwipe!<bar>if bufname()==""<bar>Startify<bar>endif<CR>', {noremap = true, silent = true})
-- Close the current tab
vim.api.nvim_set_keymap('n', '<C-t><C-t>', ':tabclose<CR>', {noremap = true})

-- Open terminal split
vim.api.nvim_set_keymap('n', '<Leader>t', ':belowright 10split +terminal<CR>', {silent = true})
-- Set any terminal buffer into non listed buffers
vim.cmd[[autocmd TermOpen * setlocal nobuflisted winfixheight]]
-- Leave terminal mode
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})
-- Close terminal split
vim.api.nvim_set_keymap('t', '<C-q><C-q>', '<C-\\><C-n><bar>:q!<CR>', {noremap = true})

-- Set the path of current file as a working directory local for current window
vim.cmd[[autocmd BufWinEnter * silent! lcd %:p:h]]

-- Shift + Tab does inverse tab
vim.api.nvim_set_keymap('i', '<S-TAB>', 'pumvisible() ? "\\<C-p>" : "\\<C-h>"', {noremap = true, expr = true})
