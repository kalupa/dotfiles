" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
    let g:make = 'make'
endif

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'mac' : 'make -f make_mac.mak',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }

" js
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'vim-scripts/JavaScript-Indent'
NeoBundleLazy 'othree/javascript-libraries-syntax.vim'
let g:used_javascript_libs = 'jquery, jasmine, prototype, underscore, react, lo-dash, requirejs, '
NeoBundleLazy 'mxw/vim-jsx'

" other
NeoBundleLazy 'tpope/vim-markdown'
NeoBundleLazy 'chrisbra/csv.vim'
NeoBundleLazy 'tpope/vim-haml'
NeoBundleLazy 'vim-ruby/vim-ruby'
NeoBundleLazy 'tpope/vim-rails'
NeoBundleLazy 'tpope/vim-rbenv'
NeoBundleLazy 'tpope/vim-bundler'
NeoBundleLazy 'tpope/vim-rake'
NeoBundleLazy 'tpope/vim-cucumber'

" tpope rules
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'tpope/vim-rsi'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-projectile'
NeoBundle 'tpope/vim-jdaddy'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-tbone'

NeoBundle 'bling/vim-airline'
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'

" ctrlp
NeoBundle 'kien/ctrlp.vim'
let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\.git$\|\.hg$\|\.svn$',
      \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
" Make CtrlP use ag for listing the files. Way faster and no useless files.
if executable('ag')
  let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
endif
let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': s:ctrlp_fallback
      \ }
" ag is fast enough that CtrlP doesn't need to cache "
let g:ctrlp_use_caching = 0
"
" General
NeoBundle 'godlygeek/tabular'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'bruno-/vim-vertical-move'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/nerdcommenter'

" YouCompleteMe
NeoBundle 'Valloric/YouCompleteMe', {
      \ 'build' : {
      \     'mac' : './install.sh',
      \    },
      \ }
let g:acp_enableAtStartup = 0

" enable completion from tags
let g:ycm_collect_identifiers_from_tags_files = 1

NeoBundle 'scrooloose/syntastic'
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" tmux integrations
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'christoomey/vim-tmux-navigator'
let g:tmuxline_preset = {
  \'a'    : [ '#(moonmoji) ' ],
  \'b'    : [ '#W' ],
  \'c'    : [ '#(whoami)' ],
  \'win'  : ['#I','#W'],
  \'cwin' : ['#I','#W #F'],
  \'x'    : [ '%a %Y/%m/%d' ],
  \'y'    : [ '%R %Z' ]}

" NerdTree
NeoBundle 'scrooloose/nerdtree'
map <C-e> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


" experimentals
"NeoBundle 'sjl/gundo.vim'
" Gundo commands. (u)
"nmap <silent> <leader>u :GundoToggle<CR>

NeoBundle 'PeterRincker/vim-argumentative'


" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.

NeoBundleCheck

" Shows the errors window. (e)
nmap <silent> <leader>e :Errors<CR>

nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Enable indent guides on boot and allow colorschemes to style them.
nmap <silent> <leader>i :IndentGuidesToggle<CR>
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0

" Enable omni completion.
autocmd FileType css,scss setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Disable the neosnippet preview candidate window
" When enabled, there can be too much visual noise
" especially when splits are used.
set completeopt-=preview

" solarized
NeoBundle 'altercation/vim-colors-solarized'
call neobundle#end()

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

