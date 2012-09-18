
" vi is dumb. Backspace should work across newlines and before the insertion mark
set nocompatible
set bs=2

" Tabs are dumb. ts=8 + expandtab allows smartindent to work properly without tabs
set sw=4
set sts=4
set ts=8
set expandtab

" autoindent and smartindent, very convenient
set ai
set si

" show row/col at the bottom
set ruler

" don't litter my HD with files~
set nobackup

" search features
set hlsearch
set incsearch
nmap <Leader>h :noh<CR>

" Tab completion awesomeness
set wildmenu

" Being able to click in the window and engage VISUAL is convenient, most of the time.
set mouse=a

" Change the default buffer to the clipboard
set clipboard=unnamed

autocmd FileType rst setlocal textwidth=80
autocmd FileType make setlocal noexpandtab
autocmd BufEnter fabfile setlocal ft=python
autocmd BufEnter wscript setlocal ft=python
autocmd BufRead */cmake/* setlocal ft=cmake

colorscheme koehler
syntax enable

map <f1> :bp<cr>
map <f2> :bn<cr>
map <f3> :TlistToggle<CR>
map <f4> @q
map <f5> :cp<CR>
map <f6> :cn<CR>
map <f7> :!single --srcRoot c:\work\metroid --dstRoot c:\work\metroid\build\debug --src %<CR>
map <f8> :ccl<CR>
map <f9> :setl ar \| silent !p4 edit % \| setl noar<CR>
map <f10> :!style.bat %<CR>
map <f11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
map <f12> :bd<cr>

" map <f6> :make `basename % .cpp`.o<CR>


let NERDChristmasTree = 1
" let NERDTreeQuitOnOpen = 1

au BufWinEnter * let w:m1=matchadd('WarningMsg', '\t', -1)
au BufWinEnter * let w:m2=matchadd('WarningMsg', '[\t ]\+$', -1)
hi WarningMsg guibg=DarkCyan
hi Search guibg=DarkGreen

" Display error window on bottom
au FileType qf wincmd J

set makeprg=smake
set tags=tags;/

let Tlist_Use_Right_Window = 1
let Tlist_Show_One_File = 1
let Tlist_WinWidth = 50

" command -nargs=* CG AsyncCommand ack --cc --cpp <q-args>

command -nargs=* -complete=dir A Ack --ignore-dir=boost --cc --cpp <args>
command -nargs=* -complete=dir AM Ack --ignore-dir=boost --cc --cpp <args> c:\work\metroid\nrdapp\src\platform\wiiu c:\work\metroid\3rdParty\cafe_sdk
nmap <Leader>f :execute "Ack --ignore-dir=boost --cpp --cc " . expand("<cword>")<CR>

" nmap <C-f> :FindFile<CR>
" nmap <C-s> :FindFileSplit<CR>
nmap <Leader>c :ccl<CR>

let g:CommandTMaxFiles=300000
"let g:CommandTMaxHeight=10
let g:CommandTNeverShowDotFiles=1
"let g:CommandTMatchWindowReverse=1
"let g:CommandTMatchWindowAtTop=1

au BufRead quickfix setlocal nobuflisted wrap number

set wildignore+=*.o,*.obj,.svn,*.elf,*.exe,*boost*

set guioptions+=LlRrb
set guioptions-=LlRrb
set guioptions+=mT
set guioptions-=mT

set guifont=ProggyCleanTTSZ:h12:cANSI

autocmd BufNewFile,BufRead *.h set formatprg=astyle\ --options=c:\work\metroid\tools\astyle\astyleOptions.txt
autocmd BufNewFile,BufRead *.c set formatprg=astyle\ --options=c:\work\metroid\tools\astyle\astyleOptions.txt
autocmd BufNewFile,BufRead *.cpp set formatprg=astyle\ --options=c:\work\metroid\tools\astyle\astyleOptions.txt

" CtrlP settings
let g:ctrlp_max_height = 50
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 'wr'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_files = 0
let g:ctrlp_user_command = "flashlight_srcs %s"
let g:ctrlp_root_markers = ['tags']
let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>', '<c-]>'],
    \ 'PrtDelete()':          ['<del>'],
    \ 'PrtDeleteWord()':      ['<c-w>'],
    \ 'PrtClear()':           ['<c-u>', '<c-l>'],
    \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<up>'],
    \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
    \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
    \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
    \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
    \ 'PrtHistory(-1)':       ['<c-n>'],
    \ 'PrtHistory(1)':        ['<c-p>'],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>'],
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
    \ 'AcceptSelection("t")': ['<c-t>'],
    \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
    \ 'ToggleFocus()':        ['<s-tab>'],
    \ 'ToggleRegex()':        ['<c-r>'],
    \ 'ToggleByFname()':      ['<c-d>'],
    \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
    \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
    \ 'PrtExpandDir()':       ['<tab>'],
    \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
    \ 'PrtInsert()':          ['<c-\>'],
    \ 'PrtCurStart()':        ['<c-a>'],
    \ 'PrtCurEnd()':          ['<c-e>'],
    \ 'PrtCurLeft()':         ['<c-h>', '<left>', '<c-^>'],
    \ 'PrtCurRight()':        ['<right>'],
    \ 'PrtClearCache()':      ['<F5>'],
    \ 'PrtDeleteEnt()':       ['<F7>'],
    \ 'CreateNewFile()':      ['<c-y>'],
    \ 'MarkToOpen()':         ['<c-z>'],
    \ 'OpenMulti()':          ['<c-o>'],
    \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
    \ }

