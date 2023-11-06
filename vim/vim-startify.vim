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
let g:startify_custom_header = 'startify#pad(g:ascii + startify#fortune#boxed())'
"let g:startify_custom_footer = 'startify#center(startify#fortune#boxed())'
