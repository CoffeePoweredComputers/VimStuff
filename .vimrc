call pathogen#infect()

echom "Hello again! >^.^<"

set number
set numberwidth=1

set nopaste
set autoindent
syntax enable
set nocompatible
filetype plugin indent on

set guifont=3270\ Narrow\ Nerd\ Font\ Complete\ 10

"set config file for ycm
let g:ycm_global_ycm_extra_conf ='~/.vim/.ycm_extra_conf.py'

"Some helpful keymappings
"
"

"Function moves lines up without accidentally deleting them
function! MoveLineUp()
	if line(".") == 1
		echom "Top of File!"
	else 
		:move -2
	endif
endfunction

"Function moves lines down without accidentally deleting them
function! MoveLineDown()
	if line(".") == line("$")
		echom "Bottom of File!"
	else
		:move +1
	endif
endfunction

map = :call MoveLineUp()<CR>
map - :call MoveLineDown()<CR>


"Undo and redo
map <c-z> undo

colorscheme jellybeans

"nerdtree hotkeys
nmap <F2> :NERDTreeToggle<CR>

"Some helpful abbriviations
iabbrev ssig -- <CR>David H Smith IV<CR>smithd77@wwu.edu<CR>
