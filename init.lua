--------------------------------------------------------------------------------
-- packer plugin Manager settings
--------------------------------------------------------------------------------
local packer = require'packer'
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
		use 'scrooloose/nerdcommenter'
		use '907th/vim-auto-save'
		use 'Yggdroot/indentLine'
	end
)


-- Set Options and Keymaps
require("options")
require("keymaps")
