" ycm path for rust autocompletion
let g:ycm_rust_src_path="/home/ishan/.rust-master/src/"

" RustFmt on save
let g:rustfmt_autosave = 1

" RustRun on Ctrl+R
nnoremap <C-r> :RustRun <CR>

" Tagbar configuration
let g:tagbar_type_rust = {
    \ 'ctagstype' : 'rust',
    \ 'kinds' : [
        \'T:types,type definitions',
        \'f:functions,function definitions',
        \'g:enum,enumeration names',
        \'s:structure names',
        \'m:modules,module names',
        \'c:consts,static constants',
        \'t:traits',
        \'i:impls,trait implementations',
    \]
    \}

" Syntastic Configuration 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_quiet_messages = { "!level": "errors" }

let g:syntastic_rust_checkers = ['cargo']
let g:syntastic_auto_jump = 3

" Code folding
" set foldmethod=indent
" nnoremap <Leader>f za
" Disable folding when opening a file
" set nofoldenable
