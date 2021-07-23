## A Fancy Neovim Config with Lua
This repo is my configuration for neovim text editor.

### Install
1. First install [packer.nvim](https://github.com/wbthomason/packer.nvim) which is a plugin manager, written in Lua, configured in Lua, using the following command:
	- `git clone https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
2. Open `Terminal` and write:
	- `cd ~/.config` or
	- `mkdir ~/.config && cd ~/.config` if `.config` folder does not exist.
3. Write in `Terminal`:
	- `git clone "https://github.com/MuhammadMouradG/nvim.git" -b lua-config`.
4. Open nvim and write this command in nvim command-line mode: `:PackerInstall`.
5. Restart the nvim.
6. Make sure you have npm. If not, write in `Terminal`:
	- `sudo pkg install npm` for `freebsd` and
	- `sudo apt install npm` for any `debian` distro.
7. Now you can install coc extensions:
	- `CocInstall coc-pyright coc-git coc-explorer coc-snippets coc-highlight coc-clangd coc-json coc-pairs coc-spell-checker coc-word coc-vimlsp coc-lua`, refer to: [coc.nvim](https://github.com/neoclide/coc.nvim)
8. To set `.vimspector.json` for `Vimspector` debugger plugin, put the `.vimspector.json` file in your project directory, after that the `Vimspector` will be ready to use for `Python`, `java`, `perl`, `C`.
