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

function! LightLineMode() abort
	return &filetype!='NvimTree' ? artify#convert(lightline#mode(), 'monospace') : SmallStatusLine()
endfunction

function! LineInfo() abort
	return &filetype!='NvimTree' ? string((100*line('.'))/line('$')) . "\uf295" . " ☰ " . "  " . string(line('.')) . ":" . string(getcurpos()[2]) . ' ' : ''
endfunction

function! FileFormat() abort
	return &filetype!='NvimTree' ? &fileformat . " " . WebDevIconsGetFileFormatSymbol() : ''
endfunction

function! FileType() abort
	return &filetype!='NvimTree' ? &filetype . " " . WebDevIconsGetFileTypeSymbol() : ''
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
	let cocstatus = get(g:, 'coc_status')!='' ? ''.get(g:, 'coc_status', '') : ''
	return cocstatus
endfunction

function! GitStatus() abort
	let status = get(g:, 'coc_git_status', '')
	if matchstr(status,'*')!='' | let status = substitute(status, '*', '⚡', '') | endif
	return status
endfunction

function! ArtifyBuffer() abort
	return artify#convert('B U F F E R S', 'script_bold')
endfunction

function! ArtifyTab() abort
	return artify#convert('T A B S', 'script_bold')
endfunction

function! SmallStatusLine() abort
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'

	if &modifiable==0
		let filestate = ' '
	else
		let filestate = ''
	endif

	let enhancedfilename = WebDevIconsGetFileTypeSymbol().' '.filename.filestate

	return enhancedfilename
endfunction

function! EnhancedFileName() abort
	let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'

	if &readonly==0 && &modified==0 && &modifiable==1
		let filestate = ''
	elseif &readonly==0 && &modified==1 && &modifiable==1
		let filestate = ' ➕'
	else
		let filestate = ' '
	endif

	if filename[0]=='[' && filename!='[No Name]'
		let enhancedfilename = ''
	elseif filename=="NvimTree_1"
		let enhancedfilename = ''
	else
		let enhancedfilename = WebDevIconsGetFileTypeSymbol().' '.filename.filestate
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
			call add(l:tab_middle, l:SelectedTab['title'])
			for l:Tab in l:Tabslist
				if l:SelectedTab['index']<l:Tab['index']
					call add(l:tab_right, l:Tab['title'])
				elseif l:SelectedTab['index']>l:Tab['index']
					call add(l:tab_left, l:Tab['title'])
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
			let l:modified = l:unselected_buffer['modified']==1 ? ' ➕' : ''
			let l:SmartPath = g:fileNameOnly==1 ? split(unselected_buffer['text'], '/')[-1] : SmartPath(l:unselected_buffer['text'])
			call add(left_tab, l:unselected_buffer['index'].': '.l:SmartPath.l:modified)
		endfor
	else
		let l:modified = l:selected_buffer['modified']==1 ? ' ➕' : ''
		call add(middle_tab, artify#convert(l:selected_buffer['index'], 'bold').': '.
			\ split(l:selected_buffer['text'], '/')[-1].l:modified)
		for l:unselected_buffer in l:BufferList
			let l:modified = l:unselected_buffer['modified']==1 ? ' ➕' : ''
			let l:SmartPath = g:fileNameOnly==1 ? split(unselected_buffer['text'], '/')[-1] : SmartPath(l:unselected_buffer['text'])
			if l:selected_buffer['index']<l:unselected_buffer['index']
				call add(l:right_tab, l:unselected_buffer['index'].': '.l:SmartPath.l:modified)
			elseif selected_buffer['index']>l:unselected_buffer['index']
				call add(l:left_tab, l:unselected_buffer['index'].': '.l:SmartPath.l:modified)
			endif
		endfor
	endif
	return l:tabs
endfunction

function! SmartPath(buffer)
	let l:cur_path = expand('%:p')=='' ? split(expand('#:p'), '/') : split(expand('%:p'), '/')
	let l:path = split(a:buffer, '/')
	let l:smart_path = ''

	for l:i in range(len(l:path))
		if (l:path[i]=="home" && l:path[i+1]==$USER)
			let l:smart_path = '~'
			let l:cur_path = l:cur_path[i+2:]
			let l:path = l:path[i+2:]
			break
		endif
	endfor

	for l:i in range(len(l:path))
		if (index(l:cur_path, l:path[i]) == i)
			let l:smart_path = l:smart_path . '/' . l:path[i][0]
		else
			if a:buffer[0] == '/'
				let l:smart_path = l:smart_path . '/' . l:path[i]
			else
				let l:smart_path = '.' . '/' . l:path[i]
			endif
			for l:s in range(i+1, len(l:path)-1)
				if l:s == len(l:path)-1
					let l:smart_path = l:smart_path . '/' . l:path[s]
				else
					let l:smart_path = l:smart_path . '/' . l:path[s][0]
				endif
			endfor
			break
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
	\ 'mode': 'LightLineMode',
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
	autocmd BufWritePost * silent mode
augroup End

let g:fileNameOnly=0
nnoremap <silent><C-f><C-n> :let g:fileNameOnly=xor(g:fileNameOnly, 1)<bar>:mode<CR>

let s:palette = g:lightline#colorscheme#gruvbox_material#palette
if &background == 'dark'
	let s:palette.tabline = {
		\ 'right': [['#ddc7a1', '#5b534d', '223', '241'], ['#ddc7a1', '#5b534d', '223', '241']],
		\ 'middle': [['#ddc7a1', '#3c3836', '223', '237']],
		\ 'left': [['#ddc7a1', '#5b534d', '223', '241'], ['#ddc7a1', '#5b534d', '223', '241']],
		\ 'tabsel': [['#32302f', '#a89984', '236', '246', 'bold']],
		\ 'tabsector': [['#32302f', '#E78A4E', '0', '21', 'bold']]
		\ }
else
	let s:palette.tabline = {
		\ 'right': [['#4f3829', '#dac9a5', '237', '250'], ['#4f3829', '#dac9a5', '237', '250']],
		\ 'middle': [['#4f3829', '#ebdbb2', '237', '223']],
		\ 'left': [['#4f3829', '#dac9a5', '237', '250'], ['#4f3829', '#dac9a5', '237', '250']],
		\ 'tabsel': [['#32302f', '#a89984', '236', '246', 'bold']],
		\ 'tabsector': [['#32302f', '#E78A4E', '0', '21', 'bold']]
		\ }
endif
