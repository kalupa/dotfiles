source $HOME/.vim/unite.vim
source $HOME/.vim/neocomplete.vim

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'

let g:used_javascript_libs = 'jquery, jasmine, prototype, underscore, react, lo-dash, requirejs'

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

let g:tmuxline_preset = {
  \'a'    : [ '#(moonmoji) ' ],
  \'b'    : [ '#W' ],
  \'c'    : [ '#(whoami)' ],
  \'win'  : ['#I','#W'],
  \'cwin' : ['#I','#W #F'],
  \'x'    : [ '%a %Y/%m/%d' ],
  \'y'    : [ '%R %Z' ]}

"map <C-e> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>


" Org Mode
"au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
"au BufEnter *.org            call gitgutter#disable()
"au BufEnter *.org            call org#SetOrgFileType()
"let g:org_command_for_emacsclient = "/usr/local/bin/emacsclient"

