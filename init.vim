" Genreal & vim-plugin Manager Settings
"###############################################################################

"===============================General Settings================================
"You can enable loading the plugin files and the indent file for specific file types with:
filetype on
filetype plugin on
filetype indent on

set encoding=utf-8
syntax on
set number
set ruler
set mouse=a
set colorcolumn=80

" Required by CtrlSpace and coc.nvim
set nocompatible
set hidden

" Color correction
set termguicolors

" Enable tabline
set showtabline=2

" Reference for tab https://stackoverflow.com/questions/1878974/redefine-tab-as-4-spaces
" tabstop: Number of spaces that a <Tab> in the file counts for.
" softtabstop: Number of spaces that a <Tab> counts in editing mode.
" shiftwidth: The size of an 'indent'. It's also measured in spaces
set list tabstop=4 shiftwidth=4 softtabstop=4 noexpandtab listchars=tab:│\ 
"set listchars=eol:¬,tab:▸\ 
"set listchars=eol:⏎,tab:\|\ 


"=========================vim-plugin Manager settings==========================
call plug#begin('~/.local/share/nvim/site/autoload')

if !has('nvim')
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jalvesaq/vimcmdline'                               " REPL plugin

Plug 'puremourning/vimspector',  { 'branch': 'master' }  " Debugger plugin

Plug 'mhinz/vim-startify'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'ryanoasis/vim-devicons'                            " Provided graphical icon
Plug 'sainnhe/artify.vim'                                " Provided customizable font
Plug 'itchyny/lightline.vim'
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
Plug 'Yggdroot/indentLine'

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
" Go to previous buffer
nnoremap <S-Tab> :bprevious<CR>
" Go to next tab
nnoremap <S-Tab><Tab> :tabnext<CR>

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
" lightline.vim settings
"###############################################################################
" You can use the following lines to set color of the specific characters.
"highlight User1 term=bold cterm=bold ctermfg=red ctermbg=darkblue guifg=darkblue guibg=red
"let g:lightline.component = {
"    \ 'fileformat': '%1*%{&fileformat}%*',
"    \ 'lineinfo': '☰  %p' . "\uf295" . "  " . '%3l:%-2v%<'
"    \ }

" You can use the following icons with concatnate with string.
"    ⚡ ☰  Ɇ  ✎

function! LinghtLineMode() abort
	return &filetype!='coc-explorer' ? Artify(lightline#mode(), 'monospace') : SmallStatusLine()
endfunction

function! LineInfo() abort
	return &filetype!='coc-explorer' ? string((100*line('.'))/line('$')) . "\uf295" . " ☰ " . "  " . string(line('.')) . ":" . string(getcurpos()[2]) . ' ' : ''
endfunction

function! FileFormat() abort
	return &filetype!='coc-explorer' ? &fileformat . " " . WebDevIconsGetFileFormatSymbol() : ''
endfunction

function! FileType() abort
	return &filetype!='coc-explorer' ? &filetype . " " . WebDevIconsGetFileTypeSymbol() : ''
endfunction

function! ErrorDiagnostic() abort
	let info = get(b:, 'coc_diagnostic_info', {})
	if get(info, 'error', 0)
		let msg = 'E' . get(info, 'error', 0)
	else
		return ''
	endif
	return msg
endfunction

function! WarningDiagnostic() abort
	let info = get(b:, 'coc_diagnostic_info', {})
	if get(info, 'warning', 0)
		let msg = 'W' . get(info, 'warning', 0)
	else
		return ''
	endif
	return msg
endfunction

function! CocStatus() abort
	let cocstatus = get(g:, 'coc_status')!='' ? '👽️'.get(g:, 'coc_status', '') : ''
	return cocstatus
endfunction

function! GitStatus() abort
	let status = get(g:, 'coc_git_status', '')
	if matchstr(status,'*')!='' | let status = substitute(status, '*', '⚡', '') | endif
	return status
endfunction

function! ArtifyBuffer() abort
	return Artify('B U F F E R S', 'sans_serif')
endfunction

function! ArtifyTab() abort
	return Artify('T A B S', 'sans_serif')
endfunction

function! SmallStatusLine() abort
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'

	if &readonly==0 && &modified==1
		let filesstate = ' ✍️'
	elseif &readonly==0 && &modified==0
		let filesstate = ''
	else
		let filesstate = ' '
	endif

	let enhancedfilename = WebDevIconsGetFileTypeSymbol().' '.filename.filesstate
	
	return enhancedfilename
endfunction

function! EnhancedFileName() abort
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'

	if &readonly==0 && &modified==1
		let filesstate = ' ✍️ '
	elseif &readonly==0 && &modified==0
		let filesstate = ''
	else
		let filesstate = ' '
	endif

	if filename[0]=='[' && filename!='[No Name]'
		let enhancedfilename = ''
	else
		let enhancedfilename = WebDevIconsGetFileTypeSymbol().' '.filename.filesstate
	endif

	return enhancedfilename
endfunction

function! CtrlSpaceTabs() abort
	let l:Tabslist = g:ctrlspace#api#TabList()
	let l:tab_right = []
	let l:tab_middle = []
	let l:tab_left = []
	let l:tabs = [ l:tab_left, l:tab_middle, l:tab_right ]
	for l:SelectedTab in l:Tabslist
		if l:SelectedTab['current']==1
			call add(l:tab_middle, l:SelectedTab['title'].Artify(l:SelectedTab['index'], 'bold'))
			for l:Tab in l:Tabslist
				if l:SelectedTab['index']<l:Tab['index']
					call add(l:tab_right, l:Tab['title'].Artify(l:Tab['index'], 'double_struck'))
				elseif l:SelectedTab['index']>l:Tab['index']
					call add(l:tab_left, l:Tab['title'].Artify(l:Tab['index'], 'double_struck'))
				endif
			endfor
			break
		endif
	endfor
	return l:tabs
endfunction

function! CtrlSpaceBuffers() abort
	let l:BufferList = []
	for l:bufferindex in sort(keys(g:ctrlspace#api#Buffers(tabpagenr())), 'N')
		for l:buffer in g:ctrlspace#api#BufferList(tabpagenr())
			if buffer['index'] == l:bufferindex
				call add(l:BufferList, l:buffer)
			endif
		endfor
	endfor
	let l:right_tab = []
	let l:middle_tab = []
	let l:left_tab = []
	let l:tabs = [ left_tab, middle_tab, right_tab ]

	" Keep buffer list visible
	let l:invisible_buffers = 0
	for l:buffer in l:BufferList
		if buffer['visible']
			let l:selected_buffer = l:buffer
		else
			let l:invisible_buffers += 1
		endif
	endfor

	if l:invisible_buffers == len(l:BufferList) || &filetype=='startify'
		for l:unselected_buffer in BufferList
			let l:modified = l:unselected_buffer['modified']==1 ? ' ✍️' : ''
			let l:SmartPath = ShortestPath(l:unselected_buffer['text'])
			call add(left_tab, l:unselected_buffer['index'].': '.l:SmartPath.l:modified)
		endfor
	else
		let l:modified = l:selected_buffer['modified']==1 ? ' ✍️' : ''
		call add(middle_tab, Artify(l:selected_buffer['index'], 'bold').': '.
			\ split(l:selected_buffer['text'], '/')[-1].l:modified)
		for l:unselected_buffer in l:BufferList
			let l:modified = l:unselected_buffer['modified']==1 ? ' ✍️' : ''
			let l:SmartPath = ShortestPath(unselected_buffer['text'])
			if l:selected_buffer['index']<l:unselected_buffer['index']
				call add(l:right_tab, l:unselected_buffer['index'].': '.l:SmartPath.l:modified)
			elseif selected_buffer['index']>l:unselected_buffer['index']
				call add(l:left_tab, l:unselected_buffer['index'].': '.l:SmartPath.l:modified)
			endif
		endfor
	endif
	return l:tabs
endfunction

function! ShortestPath(buffer)
	let l:cur_buffer = expand('%:p')=='' ? expand('#:p') : expand('%:p')
	let l:cur_path = split(l:cur_buffer, '/')
	let l:path = split(a:buffer, '/')
	if l:path[0]=='home' && l:path[1]=='muhammadmouradpos'
		let l:smart_path = '~'
		let l:cur_path = l:cur_path[2:]
		let l:path = l:path[2:]
	else
		let l:smart_path = ''
	endif
	for l:i in range(len(l:path))
		if (l:i == len(l:path)-1) && (len(l:path)==1)
			let l:smart_path = l:path[i]
		elseif l:i == len(l:path)-1
			let l:smart_path = l:smart_path . '/' . l:path[i]
		else
			if (index(l:cur_path, l:path[i]) >= 0) && (l:cur_path[i]==l:path[i])
				let l:smart_path = l:smart_path . '/' . l:path[i][0]
			else
				let l:smart_path = l:smart_path . '/' . l:path[i]
				for l:s in range(i+1, len(l:path)-1)
					if l:s == len(l:path)-1
						let l:smart_path = l:smart_path . '/' . l:path[s]
					else
						let l:smart_path = l:smart_path . '/' . l:path[s][0]
					endif
				endfor
				break
			endif
		endif
	endfor
	return l:smart_path
endfunction

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_material'
let g:lightline.enable = { 'statusline': 1, 'tabline': 1 }
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '', 'right': '' }
let g:lightline.tabline_separator = g:lightline.separator
let g:lightline.tabline_subseparator = g:lightline.subseparator

let g:lightline.active = {
	\ 'left': [ 
			\ [ 'mode', 'paste' ],
			\ [ 'git' ],
			\ [ 'enhancedfilename' ]
		\ ],
	\ 'right': [ 
			\ [ 'errordiagnostic', 'warningdiagnostic', 'lineinfo' ],
			\ [ 'fileformat' ],
			\ [ 'filetype' ],
		\ ],
	\ }

let g:lightline.inactive = {
	\ 'left': [
			\ [ 'filename' ]
		\ ],
	\ 'right': [ 
			\ [ 'lineinfo'],
		\ ],
	\ }

let g:lightline.tabline = {
	\ 'left': [
			\ [ 'BuffersLeading', 'buffers' ],
		\ ],
	\ 'right': [ 
			\ [ 'TabsLeading', 'tabs' ],
		\ ],
	\ }

let g:lightline.component = {
	\ 'enhancedfilename': '%{EnhancedFileName()} ' . '%<%{CocStatus()}',
	\ }

let g:lightline.component_function = {
	\ 'mode': 'LinghtLineMode',
	\ 'lineinfo': 'LineInfo',
	\ 'fileformat': 'FileFormat',
	\ 'filetype': 'FileType',
	\ 'git': 'GitStatus',
	\ }

let g:lightline.component_expand = {
	\ 'errordiagnostic': 'ErrorDiagnostic',
	\ 'warningdiagnostic': 'WarningDiagnostic',
	\ 'TabsLeading': 'ArtifyTab',
	\ 'BuffersLeading': 'ArtifyBuffer',
	\ 'tabs':  'CtrlSpaceTabs',
	\ 'buffers': 'CtrlSpaceBuffers',
	\ }

let g:lightline.component_type = {
	\ 'TabsLeading': 'tabsector',
	\ 'BuffersLeading': 'tabsector',
	\ 'tabs': 'tabsel',
	\ 'buffers': 'tabsel',
	\ 'errordiagnostic': 'error',
	\ 'warningdiagnostic': 'warning',
	\ }

augroup LightlineUpdate
	autocmd!
	autocmd BufWritePost * silent CocCommand git.refresh
	autocmd User CocDiagnosticChange call lightline#update()
augroup End

let s:palette = g:lightline#colorscheme#gruvbox_material#palette
let s:palette.tabline = {'right': [['#ddc7a1', '#5b534d', '223', '241'], ['#ddc7a1', '#5b534d', '223', '241']], 'middle': [['#ddc7a1', '#3c3836', '223', '237']], 'left': [['#ddc7a1', '#5b534d', '223', '241'], ['#ddc7a1', '#5b534d', '223', '241']], 'tabsel': [['#32302f', '#a89984', '236', '246', 'bold']]}
let s:palette.tabline.tabsector = [['#32302f', '#E78A4E', '0', '21', 'bold']]


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
set updatetime=500

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
" Indent-Line plugin settings
"###############################################################################
let g:indentLine_enabled = 1
let g:indentLine_char = '│'
let g:indentLine_first_char = '│'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_fileTypeExclude = ['text', 'coc-explorer', 'list', 'startify', '']
let g:indentLine_bufTypeExclude = ['help', 'terminal']


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
