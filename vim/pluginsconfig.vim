source $HOME/.vim/unite.vim
source $HOME/.vim/neocomplete.vim

let g:used_javascript_libs = 'jquery, jasmine, prototype, react, lo-dash, requirejs'

" Syntastic

let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_jump=2
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"NERDCommenter
let NERDCompactSexyComs=1

" GoldenView
let g:goldenview__enable_default_mapping = 0

nmap <silent> <C-g> <Plug>GoldenViewSplit

" Shows the errors window. (e)
nmap <silent> <leader>e :Errors<CR>

" tern
let g:tern_show_signagute_in_pum=1
let g:tern_show_argument_hints='on_hold'

" run interactive
nnoremap <leader>ri :RunInInteractiveShell<space>

" solarized
try
    set t_Co=256 " 256 colors
    set background=dark
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
    let g:solarized_contrast="normal"
    let g:solarized_visibility="normal"
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
endtry

" Tabularize
nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
