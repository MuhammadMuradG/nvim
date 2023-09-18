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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use sd to show documentation in hover preview window.
nnoremap <silent> sd :call CocAction('doHover')<CR>

" Map function
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gc <Plug>(coc-declaration)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> cl <Plug>(coc-codelens-action)
nmap <silent> caa <Plug>(coc-codeaction-source)
nmap <silent> ca <Plug>(coc-codeaction-cursor)
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
