" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/local/share/nvim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'morhetz/gruvbox'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Plugin vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'


" Initialize plugin system
call plug#end()


" --------------------------------  PLUGIN  SETUP  - -----------------------------------	

" Show line numbers.(Default)
set number

" Turn on syntax highlighting. (Default)
syntax enable

" Auto-Indent on
set autoindent

"Enter the current millenium. (Default)
set nocompatible

" Enabling plugin for netrw. (Default)
filetype plugin on

" Setting File Format
set fileformat=unix

" Setting mouse movement
set mouse=a

"Setting Encoding
set encoding=utf-8

" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Disable audible bell because it's annoying.
set noerrorbells
set softtabstop=4
set tabstop=4
set shiftwidth=4
set textwidth=79

" expandtab turns <TAB>s into spaces. That's it. So <TAB> just becomes a shortcut for insert four spaces.
set expandtab

" showcmd shows the last command entered in the very bottom right of nvim
set showcmd 

" load filetype-specific indent files
filetype indent on     

" redraw only when we need to.
set lazyredraw 

" highlight matching [{()}] 
" set showmatch                   

" This enables relative line numbering mode. With both number and relativenumber enabled, the current line shows the true line number, while all other lines (above and below) are numbered relative to the current line. This is useful because you can tell, at a glance, what count is needed to jump up or down to a particular line, by {count}k to go up or {count}j to go down.
set relativenumber


" This setting makes search case-insensitive when all characters in the string being searched are lowercase. However, the search becomes case-sensitive if it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" highlight matches
set hlsearch            

" enable folding
set foldenable          


" Cursor
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10


" NERDTREE File Explorer
let g:NERDTreeWinSize=18
" map <C-f> :NERDTreeToggle<CR>
nnoremap <C-b> :NERDTreeToggle<CR>
inoremap <C-b> <Esc> :NERDTreeToggle<CR>

" Vim Airline
set showtabline=2
set laststatus=2
let g:airline_theme='powerlineish'
let g:airline_powerline_fonts = 1
" let g:airline_section_b = '%{strftime("%H:%M")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'


" Color Schemes
" font -> source code pro semibold italic , size -> 13.6
" hi Comment guifg=#52fc03
set background=dark
let g:gruvbox_italic=0
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_termcolors_dark="256"
colorscheme gruvbox

if (has("termguicolors"))
    set termguicolors
endif

" For setting the terminal to current dirctory
autocmd BufEnter * silent! lcd %:p:h


"		-------------------- Python Build System ----------------------
" autocmd Filetype python vnoremap <buffer> <F5> :w !python3<CR>

augroup Python3
	autocmd! Python3
	autocmd Filetype python nnoremap <buffer> <F5> :w<CR>:sp<bar><CR>:term python3 "%"<CR><c-w>J:resize8<CR>:startinsert<CR>
	autocmd Filetype python inoremap <buffer> <F5> <Esc>:w<CR>:sp<bar><CR>:term python3 "%"<CR><c-w>J:resize8<CR>:startinsert<CR>
augroup end

" 		-------------------------- C++ ---------------------------------
autocmd FileType cpp nnoremap <F5> :w<CR>:sp<bar><CR>:term g++ -Wall --std=c++17 %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR><c-w>J:resize8<CR>:startinsert<CR>

autocmd FileType cpp inoremap <F5> <Esc> :w<CR>:sp<bar><CR>:term g++ -Wall --std=c++17 %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR><c-w>J:resize8<CR>:startinsert<CR>


" 		-------------------------- C ---------------------------------

autocmd FileType c nnoremap <buffer> <F5> :w<CR>:sp<bar><CR>:term gcc -o a.out "%" && ./a.out<CR><c-w>J:resize8<CR>:startinsert<CR>
autocmd FileType c inoremap <buffer> <F5> <Esc> :w<CR>:sp<bar><CR>:term gcc -o a.out "%" && ./a.out<CR><c-w>J:resize8<CR>:startinsert<CR>


" autocmd vimEnter *.cpp nnoremap <F5> :w<CR>:sp<bar>term g++ % -ggdb -o %:r && ./%:r; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR><c-w>J:resize8<CR>:startinsert<CR>

" autocmd vimEnter *.cpp inoremap <F5> <Esc> :w<bar><CR>:sp<bar>term g++ --std=c++17 %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR><c-w>J:resize8<CR>:startinsert<CR>

" autocmd vimEnter *.cpp map <F5> :w<bar> <CR> :term g++ --std=c++17 %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR>:startinsert<CR>


