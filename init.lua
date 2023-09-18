--------------------------------------------------------------------------------
-- packer plugin Manager settings
--------------------------------------------------------------------------------
local packer = require('packer')

packer.init(
	{
		git = {
			clone_timeout = 120, -- Timeout, in seconds, for git clones
		},
	}
)

packer.startup(
	function()
		local use = use
		-- Packer can manage itself
		use 'wbthomason/packer.nvim'

		-- opt stand for optional so it will loaded on-demand with the :packadd command.
		-- the following package will loaded only if file type is markdown.
		-- use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install', ft = {'markdown'}}

		-- Install directory explorer plugin
		use {"nvim-tree/nvim-tree.lua", requires = {"nvim-tree/nvim-web-devicons"}}

		-- Autocompletion plugins and LSP support
		use {'neoclide/coc.nvim', branch = 'release'}
		use 'honza/vim-snippets'                                -- Provide snippets for coc-snippets

		-- Appearance and themes
		use 'itchyny/lightline.vim'
		use 'vim-ctrlspace/vim-ctrlspace'
		use 'mhinz/vim-startify'
		use 'ryanoasis/vim-devicons'                            -- Provided graphical icon
		use 'sainnhe/artify.vim'                                -- Provided customizable font
		use 'sainnhe/gruvbox-material'
		use 'morhetz/gruvbox'
		use 'sainnhe/everforest'
		use 'sainnhe/edge'

		-- REPL and Debugger plugins
		use {'puremourning/vimspector', branch = 'master'}      -- Debugger plugin

		-- Helper plugins for productivity
		use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}
		use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
		use 'tpope/vim-fugitive'                                -- The premier Git plugin for Vim, it is illegal.
		use 'norcalli/nvim-colorizer.lua'
		use 'terrortylor/nvim-comment'
		use 'AndrewRadev/splitjoin.vim'
		use 'matze/vim-move'
		use "Pocco81/auto-save.nvim"
		use 'lukas-reineke/indent-blankline.nvim'
	end
)


-- Set Options and Keymaps
require('options')
require('keymaps')

-- Load lua plugins configurations
require('plugins-config/ts')
require('plugins-config/nvim-tree')
require('plugins-config/theme-config')
require('plugins-config/ctrlspace')
require('plugins-config/colorizer')
require('plugins-config/blankline')
require('plugins-config/nvim-comment')
require('plugins-config/auto-save')

-- Load vimscript config
vim.cmd('source ~/.config/nvim/vim/lightline.vim')
vim.cmd('source ~/.config/nvim/vim/vim-startify.vim')
vim.cmd('source ~/.config/nvim/vim/coc-nvim.vim')
vim.cmd('source ~/.config/nvim/vim/vimspector.vim')
vim.cmd('source ~/.config/nvim/vim/markdown.vim')
