command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor

augroup SOME_BASIC_AUTO_COMMANDS
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e "deletes all extra white spaces
	autocmd VimEnter * WipeReg "deletes all registers
	"autocmd filetype markdown, text setlocal nonumber nornu colorcolumn=0 wrap
augroup END

augroup COMMANDS
	autocmd!
	autocmd FileType c nnoremap <leader>cp :! gcc % -o %:r && ./%:r<input <cr>
	autocmd FileType cpp nnoremap <leader>cp :! g++ % -o %:r && ./%:r<input <cr>
augroup END
