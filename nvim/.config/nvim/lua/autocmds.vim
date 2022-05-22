augroup for_cp
    autocmd!
	autocmd FileType cpp nnoremap cp :! g++ % -o %:r && %:r > input
	autocmd FileType c nnoremap cp :! gcc % -o %:r && %:r > input
augroup END
