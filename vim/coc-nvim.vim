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

" Automatically close coc-explorer if quit from last buffer
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" Automatically open coc-explorer
autocmd BufWinEnter * if (&filetype !=? 'coc-explorer' && &filetype !=? 'list') | exe 'let dir = getcwd()' | endif
"autocmd VimEnter * if argc() == 1 | exe 'CocCommand explorer --no-focus ' . fnameescape(dir) | endif
autocmd VimEnter * if argc() == 0 | Startify | exe 'CocCommand explorer --no-focus ' . fnameescape(dir) | endif

" Sure the following script is called after CocExplorerOpenPost
function s:explorer_inited()
	let w:has_coc_explorer = v:true
	autocmd BufWinLeave * let prevDir = getcwd()
	autocmd BufWinEnter * if (exists('w:has_coc_explorer') && (&filetype != 'coc-explorer') && (&filetype != 'list') && (prevDir != dir)) | call CocActionAsync("runCommand", "explorer.doAction", 2, {"name": "cd", "args": [dir]}) | endif
	autocmd BufEnter * call CocActionAsync("runCommand", "explorer.doAction", 2, {"name": "refresh"})
endfunction

autocmd User CocExplorerOpenPost call s:explorer_inited()
