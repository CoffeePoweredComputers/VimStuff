call pathogen#infect()

echom "Hello again! >^.^<"

set number
set numberwidth=1

set encoding=utf-8
set nopaste
set autoindent
syntax enable
set nocompatible
filetype plugin indent on

set guifont=3270\ Narrow\ Nerd\ Font\ Complete\ 8

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

map + :call MoveLineUp()<CR>
map - :call MoveLineDown()<CR>


"Undo and redo
map <c-z> undo

if has('syntax')
	syntax enable
	silent! colorscheme eldar
	g:eldar_term_background = "Black"
endif

"enables zoom in and zoom out
let s:pattern = '^\(.* \)\([1-9][0-9]*\)$'
let s:minfontsize = 6
let s:maxfontsize = 16
function! AdjustFontSize(amount)
  if has("gui_gtk2") && has("gui_running")
    let fontname = substitute(&guifont, s:pattern, '\1', '')
    let cursize = substitute(&guifont, s:pattern, '\2', '')
    let newsize = cursize + a:amount
    if (newsize >= s:minfontsize) && (newsize <= s:maxfontsize)
      let newfont = fontname . newsize
      let &guifont = newfont
    endif
  else
    echoerr "You need to run the GTK2 version of Vim to use this function."
  endif
endfunction

function! LargerFont()
  call AdjustFontSize(1)
endfunction
command! LargerFont call LargerFont()

function! SmallerFont()
  call AdjustFontSize(-1)
endfunction
command! SmallerFont call SmallerFont()

"nerdtree hotkeys
nmap <F10> :NERDTreeToggle<CR>

"Some helpful abbriviations
iabbrev ssig -- <CR>David H Smith IV<CR>smithd77@wwu.edu<CR>

"auto reindent
map <F7> mzgg=G'z

"powerline 
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2

"set up syntastic 
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1


"c comment hotkey
vnoremap <silent> # :s/^/c/<cr>:noh<cr>
vnoremap <silent> -# :s/^c//<cr>:noh<cr>

"python comment hotkey
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>
