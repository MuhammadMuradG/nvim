-- Install pkcr automatically
local function bootstrap_pckr()
	local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

	if not vim.loop.fs_stat(pckr_path) then
		vim.fn.system({
			'git',
			'clone',
			"--filter=blob:none",
			'https://github.com/lewis6991/pckr.nvim',
			pckr_path
		})
	end

	vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()


-- Install plugins
require('pckr').add{
	-- Install directory explorer plugin
	{"nvim-tree/nvim-tree.lua", requires = {"nvim-tree/nvim-web-devicons"}};

	-- Autocompletion plugins and LSP support
	{'neoclide/coc.nvim', branch = 'release'};
	'honza/vim-snippets';                                -- Provide snippets for coc-snippets

	-- Appearance and themes
	'itchyny/lightline.vim';
	'vim-ctrlspace/vim-ctrlspace';
	'mhinz/vim-startify';
	'ryanoasis/vim-devicons';                            -- Provided graphical icon
	'sainnhe/artify.vim';                                -- Provided customizable font
	'sainnhe/gruvbox-material';
	'morhetz/gruvbox';
	'sainnhe/everforest';
	'sainnhe/edge';

	-- REPL and Debugger plugins
	{'puremourning/vimspector', branch = 'master'};      -- Debugger plugin

	-- Helper plugins for productivity
	{'iamcco/markdown-preview.nvim', run = 'cd app && npm install'};
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'};
	'tpope/vim-fugitive';                                -- The premier Git plugin for Vim, it is illegal.
	'norcalli/nvim-colorizer.lua';
	'numToStr/comment.nvim';
	'AndrewRadev/splitjoin.vim';
	'matze/vim-move';
	"Pocco81/auto-save.nvim";
	'lukas-reineke/indent-blankline.nvim';
    'chrisbra/csv.vim';
}

-------------------------------------------------------------------------------
-- Configurations
-------------------------------------------------------------------------------
require('options')
require('keymaps')

-- Load vimscript config
vim.cmd('source ~/.config/nvim/vim/lightline.vim')
vim.cmd('source ~/.config/nvim/vim/vim-startify.vim')
vim.cmd('source ~/.config/nvim/vim/coc-nvim.vim')
vim.cmd('source ~/.config/nvim/vim/vimspector.vim')
vim.cmd('source ~/.config/nvim/vim/markdown.vim')

-- Load lua plugins configurations
require('plugins-config/nvim-treesitter')
require('plugins-config/theme-config')
require('plugins-config/ctrlspace')
require('plugins-config/colorizer')
require('plugins-config/blankline')
require('plugins-config/comment_nvim')
require('plugins-config/auto-save')
require('plugins-config/nvim-tree')
