call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set ts=4
set sm
set ai
filetype plugin on 
set encoding=utf-8

syntax on
colorscheme af
set number

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
	autocmd BufNewFile,BufRead *.json set ft=javascript
endif

" show highlighting groups for current word
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"" move single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" move mutliple visually selected lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

let java_highlight_all=1
let java_highlight_functions="style"

let java_allow_cpp_keywords=1
