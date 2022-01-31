nnoremap <leader>dd	:call vimspector#Launch()<cr>
nnoremap <leader>dr	:call vimspector#Reset()<cr>
nnoremap <leader>dc :call vimspector#Continue()<cr>

nnoremap <leader>di :call vimspector#StepInto() <cr>
nnoremap <leader>do :call vimspector#StepOver() <cr>
nnoremap <leader>du :call vimspector#StepOut() <cr>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>db <Plug>VimspectorToggleBreakpoint
nmap <leader>dcb <Plug>VimspectorToggleConditionalBreakpoint


