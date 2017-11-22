
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
set background=light
colorscheme solarized

" Key Mappings
" Plugins
nmap <F8> :TagbarToggle<CR> 
map <C-n> :NERDTreeToggle<CR>

nnoremap ; :
nnoremap <Leader> :nohlsearch<CR>
" Escape 
inoremap ;[ <esc>
nnoremap <leader>s :mksession<CR>
" nnoremap <C-Left> :tabprevious<CR>
" nnoremap <C-Right> :tabnext<CR>

" Splitting shortcuts
nnoremap <silent> <Leader>s :split<CR>
nnoremap <silent> <Leader>v :vsplit<CR>
nnoremap <silent> <Leader>q :close<CR>
