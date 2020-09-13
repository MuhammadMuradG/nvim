# A Fancy Neovim Config
This repo is a my configuration of nvim text editor.

### Install
1. First install [vim-plug](https://github.com/junegunn/vim-plug) which is plugin manager for nvim, using the following command:  
`sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
2. Open `Terminal` and write `cd ~/.config`.
3. Write in `Terminal`: `git clone "https://github.com/MuhammadMouradG/nvim.git"`.
4. Open nvim and write this command in command nvim mode: `:PlugInstall`.
5. Restart the nvim.
6. Make sure you have npm. If not, write in `Terminal`: `sudo apt install npm`.
7. Now you can install coc extention `CocInstall coc-python coc-git coc-explorer coc-highlight coc-html coc-css coc-clangd`, refer to: [coc.nvim](https://github.com/neoclide/coc.nvim)
8. To set `.vimspector.json` for `Vimspector` plugin, put the `.vimspector.json` file in your project directory, after that the `Vimspector` will be ready to use for `Python`, `java`, `perl`, `C`.
