" Genreal & vim-plugin Manager Settings
"###############################################################################

"===============================General Settings================================
"You can enable loading the plugin files and the indent file for specific file types with:
filetype on
filetype plugin indent on

set encoding=utf-8
syntax on
set number
set ruler
set mouse=a
set colorcolumn=80

" Reference for tab https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
set tabstop=4                                 " Number of spaces that a <Tab> in the file counts for.
set softtabstop=4                             " Number of spaces that a <Tab> counts in editing mode.
" The size of an 'indent'. It's also measured in spaces
if exists('*shiftwidth')
	func s:sw()
		return shiftwidth()
	endfunc
else
	func s:sw()
		return &sw
	endfunc
endif

" Required by CtrlSpace and coc.nvim
set nocompatible
set hidden

" Color correction
set termguicolors

set list
set lcs=tab:\|\ 


"=========================vim-plugin Manager settings==========================
call plug#begin('~/.local/share/nvim/site/autoload')

if !has('nvim')
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jalvesaq/vimcmdline'                               " REPL plugin

Plug 'puremourning/vimspector',  { 'branch': 'master' }  " Debugger plugin

Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'                            " Provided graphical icon
Plug 'sainnhe/gruvbox-material'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/forest-night'
Plug 'sainnhe/edge'

Plug 'honza/vim-snippets'                                " Provide snippets for coc-snippets
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'sheerun/vim-polyglot'                              " Syntax highlighting
Plug 'tpope/vim-fugitive'                                " The premier Git plugin for Vim, it is illegal.
Plug 'scrooloose/nerdcommenter'
Plug '907th/vim-auto-save'

" TODO: adjust the following plugins:
"Plug 'kana/vim-arpeggio'                                 " Key mapping plugin.
"Plug 'easymotion/vim-easymotion'
"Plug 'tpope/vim-fugitive'                                " Plugin for command line git, can be integerate with airline

call plug#end()


"###############################################################################
" Remap Keys. Use :mapclear command to reset all key map to default.
"###############################################################################
" noremap: non recursive normal, visual, select and operating-pending map
noremap <C-c><C-c> "+y
noremap <C-x><C-x> "+x
noremap <C-v><C-v> "+p

" Navigate between opened windows
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j

" Go to next buffer, also you can use :bdelete in the following command
nnoremap <Tab> :bnext<CR>
" Go to next tab
nnoremap <S-Tab> :tabnext<CR>

" Delete the current buffer completely and close its window
nnoremap <silent><C-q><C-q> :bwipe!<bar>if bufname()==""<bar>q<bar>endif<CR>
" Close the buffer without changing the layout of windows
nnoremap <silent><C-f><C-f> :bp<bar>sp<bar>bn<bar>bwipe!<bar>if bufname()==""<bar>Startify<bar>endif<CR>
" Close the current tab
nnoremap <C-t><C-t> :tabclose<CR>

" Open terminal split
nmap <silent><Leader>t :belowright 10split +terminal<CR>
" Set any terminal buffer into non listed buffers
autocmd TermOpen * setlocal nobuflisted winfixheight
" Leave terminal mode
tnoremap <Esc> <C-\><C-n>
" Close terminal split
tnoremap <C-q><C-q> <C-\><C-n><bar>:q!<CR>

" Set the path of current file as a working directory local for current window
autocmd BufWinEnter * silent! lcd %:p:h

" Shift + Tab does inverse tab
inoremap <S-Tab> <C-d>


"###############################################################################
" Gruvbox-material settings
"###############################################################################
" For dark or light scheme
set background=dark                          " dark or light

let g:gruvbox_material_background = 'soft'   " hard, soft or medium
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 0
let g:gruvbox_material_enable_bold = 1
let g:gruvbox_material_cursor = 'auto'
let g:gruvbox_material_palette = 'material'  " Available choice material, mix, original

" To enable gruvbox-material color scheme for leaderf Plugin
"let g:Lf_StlColorscheme = 'gruvbox_material'

" To enable lightline color scheme
"let g:lightline = {'colorscheme' : 'gruvbox_material'}

" This configuration option should be placed before `colorscheme gruvbox-material`
" available values: 'hard', 'medium'(default), 'soft'
let g:gruvbox_material_background = 'soft'

colorscheme gruvbox-material                 " Available choice gruvbox-material, forest-night, edge or gruvbox, solarized


"###############################################################################
" Vim-Airline settings
"###############################################################################
let g:airline_powerline_fonts = 1

" This option theme for status line and related thing, the best choice is 'papercolor', 'solarized', 'gruvbox_material', 'edge' or 'forest_night'
let g:airline_theme = 'gruvbox_material'

let g:airline_detect_crypt=1

" Define the set of names to be displayed instead of a specific filetypes (for section a and b):
let g:airline_filetype_overrides = {
      \ 'coc-explorer':  [ 'CoC Explorer', '' ],
      \ 'help':  [ 'Help', '%f' ],
      \ 'startify': [ 'startify', '' ],
      \ 'vim-plug': [ 'Plugins', '' ],
      \ }

" Enable/Disable tabline
let g:airline#extensions#tabline#enabled = 1
" Show buffers section in tabline
let g:airline#extensions#tabline#show_buffers = 1
" Show tabs section in tabline
let g:airline#extensions#tabline#show_tabs = 1
" Displaying tab number in tabs mode for ctrlspace.
let g:airline#extensions#tabline#ctrlspace_show_tab_nr = 1
" Rename label for buffers
let g:airline#extensions#tabline#buffers_label = 'buffers'
" Rename label for tabs
let g:airline#extensions#tabline#tabs_label = 'tabs'
" Defines the name of a formatter for how buffer names are displayed.
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Defines whether the preview window should be excluded from have its window statusline modified
let g:airline_exclude_preview = 0

" Integerate with coc.nvim
let g:airline#extensions#coc#enabled = 1

" Integerate with ctrlSpace
let g:airline#extensions#ctrlspace#enabled = 1

"" enable/disable tagbar integration
"let g:airline#extensions#tagbar#enabled = 0

"" To enable/disable bufferline integration with vim-bufferline
"let g:airline#extensions#bufferline#enabled = 0

"" To enable/disable bufferline integration with fugitive
"let g:airline#extensions#fugitiveline#enabled = 0

"" To enable/disable bufferline integration with gina
"let g:airline#extensions#gina#enabled = 0

"" enable/disable syntastic integration
"let g:airline#extensions#syntastic#enabled = 0

"" enable/disable searchcount integration >
"let g:airline#extensions#searchcount#enabled = 0

"" enable/disable poetv integration
"let g:airline#extensions#poetv#enabled = 0


"##############################################################################
" vim-startify settings
"##############################################################################
let g:startify_relative_path       = 1
let g:startify_fortune_use_unicode = 1

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" default boxed random quote, but not the ASCII art cow.
let g:ascii = [
			\ ' #     #  #######  #     #  ######      #     ######  ',
			\ ' ##   ##  #     #  #     #  #     #    # #    #     # ',
			\ ' # # # #  #     #  #     #  #     #   #   #   #     # ',
			\ ' #  #  #  #     #  #     #  ######   #     #  #     # ',
			\ ' #     #  #     #  #     #  #   #    #######  #     # ',
			\ ' #     #  #     #  #     #  #    #   #     #  #     # ',
			\ ' #     #  #######   #####   #     #  #     #  ######  ',
			\ '                                                      ',
			\ ]
let g:startify_custom_header = 'startify#center(g:ascii + startify#fortune#boxed())'
let g:startify_custom_footer = 'startify#center(startify#fortune#boxed())'


"###############################################################################
" vim-ctrlspace settings
"###############################################################################
let g:CtrlSpaceDefaultMappingKey = "<C-space> "   " Required in Neovim

" Enable Tabline
let g:CtrlSpaceUseTabline = 1

" Detect your os and architecture faster
if has('win32')
	let s:vimfiles = '~/vimfiles'
	let s:os   = 'windows'
else
	let s:vimfiles = '~/.vim'
	if has('mac') || has('gui_macvim')
		let s:os = 'darwin'
	else
		let s:os = 'linux'
	endif
endif


"###############################################################################
" NerdCommenter settings
"###############################################################################
"Default mapping for comment toggle: [count]|<Leader>|c<space>
let g:NERDSpaceDelims = 0
let g:NERDToggleCheckAllLines = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'


"###############################################################################
" Vimcmdline settings
"###############################################################################
" vimcmdline mappings
let cmdline_map_start          = '<LocalLeader>s'
let cmdline_map_send           = '<Space>'
let cmdline_map_send_and_stay  = '<LocalLeader><Space>'
let cmdline_map_source_fun     = '<LocalLeader>f'
let cmdline_map_send_paragraph = '<LocalLeader>p'
let cmdline_map_send_block     = '<LocalLeader>b'
let cmdline_map_quit           = '<LocalLeader>q'

" vimcmdline options
let cmdline_vsplit      = 0      " Split the window vertically
let cmdline_esc_term    = 1      " Remap <Esc> to :stopinsert in Neovim's terminal
let cmdline_in_buffer   = 1      " Start the interpreter in a Neovim's terminal
let cmdline_term_height = 10     " Initial height of interpreter window or pane when vsplit not active
let cmdline_term_width  = 45     " Initial width of interpreter window or pane when vsplit active
"let cmdline_tmp_dir     = '/tmp' " Temporary directory to save files
let cmdline_auto_scroll = 1      " Keep the cursor at the end of terminal (nvim)

let cmdline_app           = {}
let cmdline_app['ruby']   = 'pry'
let cmdline_app['sh']     = 'bash'
let cmdline_app['python'] = 'ipython3'


"###############################################################################
" vimspector settings
"###############################################################################
nmap <special> <leader><F9> <Plug>VimspectorContinue
nmap <special> <F4> <Plug>VimspectorStop
nmap <special> <F3> <Plug>VimspectorRestart
nmap <special> <F5> <Plug>VimspectorPause
nmap <unique> <leader>b <Plug>VimspectorToggleBreakpoint
"nmap <F8> <Plug>VimspectorAddFunctionBreakpoint
nmap <special> <F7> <Plug>VimspectorStepOver
nmap <special> <F8> <Plug>VimspectorStepInto
nmap <special> <F9> <Plug>VimspectorStepOut
sign define vimspectorBP text=🔴️ texthl=Normal
sign define vimspectorBPDisabled text=🔵 texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad


"###############################################################################
" Coc.nvim settings
"###############################################################################
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You can also change the signcolumn option
set signcolumn=yes:2

" Set shorter updatetime
set updatetime=300

" Map <tab> to trigger completion and navigate to the next item:
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()

" Using <CR> to confirm completion:
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" Use sd to show documentation in hover preview window.
nnoremap <silent> sd :call CocAction('doHover')<CR>

" Map function
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gc <Plug>(coc-declaration)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> cl <Plug>(coc-codelens-action)
nmap <silent> caa <Plug>(coc-codeaction)
nmap <silent> ca <Plug>(coc-codeaction-selected)<CR>
nmap <silent> df <Plug>(coc-format)
nmap <silent> <F2> <Plug>(coc-rename)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

"Airline configuration for coc
let g:airline#extensions#coc#enabled = 1

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
highlight link CocHighlightText RedrawDebugRecomposed
highlight link CocHighlightRead RedrawDebugClear
highlight link CocHighlightWrite RedrawDebugComposed

" ============================== Coc-explorer =================================
nmap <space>e :CocCommand explorer<CR>
autocmd BufWinEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" Automatically open coc-explorer
autocmd BufWinEnter * if (&filetype !=? 'coc-explorer' && &filetype !=? 'list') | exe 'let dir = getcwd()' | endif
"autocmd VimEnter * if argc() == 1 | exe 'CocCommand explorer --no-focus ' . fnameescape(dir) | endif
autocmd VimEnter * if argc() == 0 | Startify | exe 'CocCommand explorer --no-focus ' . fnameescape(dir) | endif

" Sure the following script is called after CocExplorerOpenPost
function s:explorer_inited()
	let w:has_coc_explorer = v:true
	autocmd BufWinLeave * let prevDir = getcwd()
	autocmd BufWinEnter * if (exists('w:has_coc_explorer') && (&filetype != 'coc-explorer') && (&filetype != 'list') && (prevDir != dir)) | call CocActionAsync("runCommand", "explorer.doAction", 2, {"name": "cd", "args": [dir]}) | call CocActionAsync("runCommand", "explorer.doAction", 2, {"name": "refresh"}) | endif
endfunction

autocmd User CocExplorerOpenPost call s:explorer_inited()


"###############################################################################
" Auto-Save plugin settings
"###############################################################################
let g:auto_save = 1
let g:auto_save_events = ["CursorHoldI", "CursorHold"]


"###############################################################################
" MarkDown settings
"###############################################################################
" set to 1, nvim will open the preview window after entering the markdown buffer
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'firefox'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 1

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
	\ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
