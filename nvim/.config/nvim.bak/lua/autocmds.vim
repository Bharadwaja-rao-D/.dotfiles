set guicursor = 
" let g:gruvbox_contrast_dark = 'hard'
" colorscheme gruvbox
" let g:netrw_banner = 0
" hi Normal ctermbg=16 guibg=#000000
" hi SignColumn guibg=none
" hi ColorColumn ctermbg=lightgrey guibg=#333333
" hi CursorLineNR guibg=None
" highlight Normal guibg=none
" highlight LineNr guifg=#5eacd3
" highlight netrwDir guifg=#5eacd3
" highlight qfFileName guifg=#aed75f
" hi TelescopeBorder guifg=#5eacd

augroup for_cp
    autocmd!
	autocmd FileType cpp nnoremap cp :! g++ % -o %:r  <Cr>
	"autocmd FileType cpp nnoremap cp :! g++ % -o %:r && %:r < input
	autocmd FileType c nnoremap cp :! gcc % -o %:r && %:r < input
augroup END
