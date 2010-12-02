call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

:set ts=4
:filetype plugin on
:syntax on
:colorscheme golden 
set number

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
endif

let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>
