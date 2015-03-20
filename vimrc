call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set shell=/bin/bash
set ts=4
set sm
set ai
set encoding=utf-8

colorscheme af
set number
" default history just holds up to 20 entries
set history=1000
" show completion options
set wildmode=list:longest

set listchars=tab:>-,trail:- " show tabs like >---
set colorcolumn=80
" allow Vim to manage multiple buffers effectively
set hidden

" recommended settings from
" https://github.com/vim-ruby/vim-ruby/wiki/VimRubySupport
set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
filetype plugin indent on 
set omnifunc=syntaxcomplete#Complete

autocmd FileType rb,yml autocmd BufWritePre <buffer> :%s/\s\+$//e

" enable search highlighting
set hlsearch
" enable extended % matching
runtime macros/matchit.vim

au BufEnter *.hs compiler ghc

if has("autocmd")
	autocmd bufwritepost .vimrc source $MYVIMRC
	autocmd BufRead,BufNewFile *.json setfiletype javascript
endif


if exists("did_load_csvfiletype")
   finish
endif
let did_load_csvfiletype=1

augroup filetypedetect
   au! BufRead,BufNewFile *.csv,*.dat setfiletype csv
   au BufRead,BufNewFile *.md set filetype=markdown
augroup END

augroup HaskellCompile
	autocmd!
        set et ts=8 sw=4 sta
	autocmd bufwritepost *.hs :call CompileHaskell()
augroup END

function! CompileHaskell ()
	! ghc -o %< --make %
endfunction

" show highlighting groups for current word
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
		return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" define zen coding leader key
if !exists('g:user_zen_leader_key')
  let g:user_zen_leader_key = ';'
endif

"" tab navigation
nnoremap <C-Right> :tabn <CR>
nnoremap <C-Left> :tabp <CR>
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt
map <C-4> 4gt
map <C-5> 5gt
map <C-6> 6gt
map <C-7> 7gt
map <C-8> 8gt
map <C-9> 9gt
map <C-0> :tablast<CR>

"" move single lines
nmap <C-Up> [e
nmap <C-Down> ]e

" move mutliple visually selected lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

let g:haddock_browser = "/usr/bin/google-chrome"

let g:ghc = "/usr/bin/ghc"

let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>g :tabnew <CR>:Gstatus<CR>
nmap <leader>s :ConqueTermVSplit bash<CR>
nmap <leader>x :%!xmllint --encode UTF-8 --format -<CR>
nmap <leader>j :%!python -m json.tool<CR>
nmap <leader>nf :NERDTreeTabsFind<cr>

let g:airline_powerline_fonts = 1
let g:syntastic_ruby_checkers = ['rubocop','mri']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" autocmd vimenter * if !argc() | NERDTree | endif
" autocmd FileType javascript noremap <buffer>  <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

" Press F3 to toggle insert(paste) on/off.
:noremap <F3> :set paste! paste?<CR>
" Press F4 to toggle highlighting on/off, and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>
" Press F5 to toggle NERDTree 
:noremap <F5> :NERDTreeTabsToggle<CR>
" Pres F6 for search word under cursor in all files
map <F6> :execute " grep -srnw --binary-files=without-match --exclude-dir=.git --exclude-from=$HOME/.vim/exclude.list . -e " . expand("<cword>") . " " <bar> cwindow<CR>
" define code completion shortcut to Ctrl-Space
inoremap <Nul> <C-n>

" swap 'jump to mark' commands: ` is more useful but keyboard location is
" worse
nnoremap ' `
nnoremap ` '

" map escape to more convinient sequence 'jk' in insert mode
inoremap jk <Esc>

" change dir to open window
nnoremap <leader>cd :lcd%:p:h

" SML make code {{{
autocmd FileType sml setlocal makeprg=rlwrap\ sml\ -P\ full\ '%'
" }}}

let java_highlight_all=1
let java_highlight_functions="style"

let java_allow_cpp_keywords=1
