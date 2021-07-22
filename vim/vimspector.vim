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
