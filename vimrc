call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set ts=4
set sm
set ai
filetype plugin on
syntax on
colorscheme af
set number

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
	autocmd BufRead,BufNewFile *.json setfiletype javascript
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

autocmd vimenter * if !argc() | NERDTree | endif

" Press F3 to toggle insert(paste) on/off.
:noremap <F3> :set paste! paste?<CR>
" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>

let java_highlight_all=1
let java_highlight_functions="style"

let java_allow_cpp_keywords=1
