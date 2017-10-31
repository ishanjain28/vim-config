
" Set <SPACE> as <Leader>
let mapleader = " "

call pathogen#infect()

" Enable filetype plugins
filetype plugin on

syntax enable
set number
set relativenumber
set ts=4
set autoindent
set expandtab
set shiftwidth=4
set cursorline
set showmatch
set mouse=a
set encoding=utf-8

" Color Scheme
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Key Mappings
nmap <F8> :TagbarToggle<CR> 
map <C-n> :NERDTreeToggle<CR>
nnoremap ; :
nnoremap <Leader> :nohlsearch<CR>
inoremap ;[ <esc>
nnoremap <leader>s :mksession<CR>
" nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>


