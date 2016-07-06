let mapleader = " " " a more natural leader

" I never use Ex mode
nnoremap Q <Nop>

" esc key is evil
" inoremap jk <Esc>
" inoremap <Esc> <NOP>

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" enter key to clear those searches
nmap <silent> <CR> :nohlsearch<CR>

" Adjust viewports to the same size
map <Leader>= <C-w>=

" Allow using the repeat operator with a visual selection (!)
" http://stackoverflow.com/a/8064607/127816
vnoremap . :normal .<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>
