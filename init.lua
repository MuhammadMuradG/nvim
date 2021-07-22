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

		-- Simple plugins can be specified as strings
		use 'mhinz/vim-startify'
		use 'vim-ctrlspace/vim-ctrlspace'
		use 'ryanoasis/vim-devicons'                            -- Provided graphical icon
		use 'sainnhe/artify.vim'                                -- Provided customizable font
		use 'itchyny/lightline.vim'
		use 'sainnhe/gruvbox-material'
		use 'morhetz/gruvbox'
		use 'sainnhe/everforest'
		use 'sainnhe/edge'

		-- Autocompletion plugins and LSP support
		use {'neoclide/coc.nvim', branch = 'release'}
		use 'honza/vim-snippets'                                -- Provide snippets for coc-snippets

		-- REPL and Debugger plugins
		use 'jalvesaq/vimcmdline'                               -- REPL plugin
		use {'puremourning/vimspector', branch = 'master'}      -- Debugger plugin

		-- Helper plugins for productivity
		use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}
		use 'goerz/jupytext.vim'                                -- Enable editing .ipynb ft as a script
		use 'tpope/vim-fugitive'                                -- The premier Git plugin for Vim, it is illegal.
		use 'jackguo380/vim-lsp-cxx-highlight'                  -- Syntax highlighting for C family
		use 'terrortylor/nvim-comment'
		use 'AndrewRadev/splitjoin.vim'
		use '907th/vim-auto-save'
		use 'lukas-reineke/indent-blankline.nvim'
	end
)


-- Set Options and Keymaps
require("options")
require("keymaps")


-- Attaches to every FileType mode
require('nvim_comment').setup(
	{
		-- Linters prefer comment and line to have a space in between markers
		marker_padding = true,
		-- should comment out empty or whitespace only lines
		comment_empty = true,
		-- Should key mappings be created
		create_mappings = true,
		-- Normal mode mapping left hand side
		line_mapping = '<leader>c',
		-- Visual/Operator mapping left hand side
		operator_mapping = '<leader>cc'
	}
)


-- source a vimscript file
vim.cmd('source ~/.config/nvim/plugins-settings.vim')
