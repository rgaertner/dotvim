call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set ts=4
filetype plugin on
syntax on
colorscheme golden 
set number

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

" move single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" move mutliple visually selected lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>


