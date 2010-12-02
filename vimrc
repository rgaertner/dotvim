:set ts=4
:filetype plugin on
:syntax enable
:colorscheme golden 

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>
