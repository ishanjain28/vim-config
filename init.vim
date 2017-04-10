" Minimal neovim configuration for go
"
" deoplete requires neovim, so this will not work with regular vim
"
" prereqs:
" - neovim
" - neovim python3 (pip3 install --upgrade neovim)
"
" includes:
" - syntax checking on save (using neomake, go and gometalinter)
" - goimports on save (using vim-go)
" - auto-completion (using deoplete)
"
" First install vim-plug:
" curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" Then save this file as ~/.config/nvim/init.vim

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible
endif

let g:mapleader = "\<SPACE>"

" deoplete
set completeopt=longest,menuone " auto complete setting
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#keyword_patterns = {}
let g:deoplete#keyword_patterns['default'] = '\h\w*'
let g:deoplete#omni#input_patterns = {}
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#align_class = 1

" neomake
autocmd BufWritePost * Neomake
let g:neomake_error_sign   = {'text': '✖', 'texthl': 'NeomakeErrorSign'}
let g:neomake_warning_sign = {'text': '∆', 'texthl': 'NeomakeWarningSign'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeMessageSign'}
let g:neomake_info_sign    = {'text': 'ℹ', 'texthl': 'NeomakeInfoSign'}
let g:neomake_go_enabled_makers = [ 'go', 'gometalinter' ]
let g:neomake_go_gometalinter_maker = {
  \ 'args': [
  \   '--tests',
  \   '--enable-gc',
  \   '--concurrency=3',
  \   '--fast',
  \   '-D', 'aligncheck',
  \   '-D', 'dupl',
  \   '-D', 'gocyclo',
  \   '-D', 'gotype',
  \   '-E', 'errcheck',
  \   '-E', 'misspell',
  \   '-E', 'unused',
  \   '%:p:h',
  \ ],
  \ 'append_file': 0,
  \ 'errorformat':
  \   '%E%f:%l:%c:%trror: %m,' .
  \   '%W%f:%l:%c:%tarning: %m,' .
  \   '%E%f:%l::%trror: %m,' .
  \   '%W%f:%l::%tarning: %m'
  \ }

" vim-go
let g:go_def_mapping_enabled = 0
let g:go_fmt_command = 'goimports'
let g:go_fmt_fail_silently = 1
let g:go_term_enabled = 1

" use real tabs in .go files, not spaces
autocmd FileType go setlocal shiftwidth=4 tabstop=4 softtabstop=4 noexpandtab

" plugins
call plug#begin()

Plug 'neomake/neomake'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'kien/ctrlp.vim'
" Plug 'scrooloose/nerdtree'

" Add plugins to &runtimepath
call plug#end()

" install missing plugins on start
autocmd VimEnter *
  \  if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall
  \| endif

call deoplete#custom#set('_', 'converters',
      \ ['converter_auto_paren',
      \  'converter_auto_delimiter',
      \  'converter_remove_overlap'])

" mappings

" deoplete
imap <expr> <tab>   pumvisible() ? "\<c-n>" : "\<tab>"
imap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<tab>"
imap <expr> <cr>    pumvisible() ? deoplete#close_popup() : "\<cr>"

" vim-go mappings
autocmd FileType go nmap <buffer> <leader>r <plug>(go-run)
autocmd FileType go nmap <buffer> <leader>b <plug>(go-build)
autocmd FileType go nmap <buffer> <leader>t <plug>(go-test)
autocmd FileType go nmap <buffer> <leader>e <plug>(go-rename)
autocmd FileType go nmap <buffer> gd <plug>(go-def-vertical)
autocmd FileType go nmap <buffer> <c-]> <plug>(go-def-vertical)
autocmd FileType go nmap <buffer> <leader>i <plug>(go-info)



" Generals
set laststatus=2
set timeout
set ttimeoutlen=50

" Search
set ignorecase
set smartcase
set gdefault
set magic

" Formatting
set showcmd
set showmatch
set showmode
set ruler
set number
set expandtab
set tabstop=2
set splitbelow
set splitright


" UI
set bg=dark
colorscheme gruvbox

" Airline
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'gruvbox'

" Key remaps
nnoremap ; :
nnoremap Q @q
