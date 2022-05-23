set guicursor = 
set mouse=a
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox
let g:netrw_banner = 0

augroup for_cp
    autocmd!
	autocmd FileType cpp nnoremap cp :! g++ % -o %:r && %:r < input
	autocmd FileType c nnoremap cp :! gcc % -o %:r && %:r < input
augroup END
