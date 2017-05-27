call pathogen#infect()


syntax enable
set number
set ts=4
set autoindent
set expandtab
set shiftwidth=4
set cursorline
set showmatch


" Python Setup
let python_highlight_all = 1


" Golang Setup
let g:go_disable_autoinstall = 0
autocmd FileType go autocmd BufWritePre <buffer> GoFmt

" Highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

" Start neocomplete on startup
let g:neocomplete#enable_at_startup = 1

" Color Scheme
colorscheme molokai

" tagbar configuration, requires ctags
let g:tagbar_type_go = {  
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Key Mappings
nmap <F8> :TagbarToggle<CR> 
map <C-n> :NERDTreeToggle<CR>
nnoremap ; :
nnoremap Q @q
nnoremap <leader><space> :nohlsearch<CR>
nnoremap gV `[v`]
inoremap ;[ <esc>
nnoremap <leader>s :mksession<CR>
