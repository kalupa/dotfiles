set nocompatible               " be iMproved

" bundles for awesomeness
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundle/vimscript managers
Bundle "gmarik/vundle"
Bundle "tpope/vim-pathogen"

" Themes 
" Bundle "tpope/vim-vividchalk"
" Bundle "kalupa/vim-tenforward"
Bundle "altercation/vim-colors-solarized"

" Git tools
Bundle "tpope/vim-git"
Bundle "tpope/vim-fugitive"

" Global editor usefulness
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-ragtag"
Bundle "tsaleh/vim-tcomment"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-endwise"
Bundle "MartinLafreniere/vim-PairTools"
Bundle "godlygeek/tabular"
Bundle "aaronj1335/ucompleteme"
Bundle "vim-scripts/IndexedSearch"
Bundle "shemerey/vim-peepopen"
Bundle "mattn/gist-vim"
Bundle "airblade/vim-rooter"
Bundle "nathanaelkane/vim-indent-guides"
Bundle "sjl/gundo.vim"
Bundle "scrooloose/nerdtree"
Bundle "taglist.vim"

" syntax checking
Bundle "tsaleh/vim-supertab"
Bundle "msanders/snipmate.vim"
Bundle "scrooloose/syntastic"

" Ruby and Rails 
Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-rails"
" Bundle "astashov/vim-ruby-debugger"
Bundle "tpope/vim-cucumber"
Bundle "tsaleh/vim-shoulda"
Bundle "dbext.vim"
Bundle "tpope/vim-abolish"
Bundle "tpope/vim-bundler"

" Javascript/Coffeescript
" Bundle "javaScriptLint"
Bundle "hallettj/jslint.vim"
Bundle "kchmck/vim-coffee-script"
Bundle "itspriddle/vim-jquery"

" HTML/CSS generating modes
Bundle "tpope/vim-haml"
Bundle "tpope/vim-markdown"
Bundle "timcharper/textile.vim"
Bundle "digitaltoad/vim-jade"
Bundle "wavded/vim-stylus"
" Bundle "cakebaker/scss-syntax.vim" 
Bundle "vesan/scss-syntax.vim" 
" using this one until official version does pull request

" PHP-Related
Bundle "vim-scripts/php.vim"

" Clojure
Bundle "VimClojure"

" Misc
" Bundle "davidoc/todo.txt-vim"

" DISABLED FOR NOW
" Bundle "tsaleh/vim-align"

syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END
" ================

let g:gist_clip_command = 'pbcopy'
let mapleader = ","

map <Leader>co :TComment<CR>
if &t_Co > 2 || has("gui_running")
  map <D-/> :TComment<CR>
endif

" window movement speed
map <Leader>w <C-w>w

imap <C-l> <Space>=><Space>
map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c
map <C-n> :cn<CR>
map <C-p> :cp<CR>

map <C-h> :nohl<CR>
" nnoremap <silent> <C-l> :nohl<CR><C-l>

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set autoindent
set showmatch
set scrolloff=4
" set nowrap
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
set autoread
set wmh=0
set viminfo+=!
" set guioptions-=T
set et
set sw=2
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2  " Always show status line.
set number 
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" Expand the command line using tab
set wildchar=<Tab>

" show line numbers
set number

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" 1000 undo levels
set undolevels=1000

" show matching braces
set showmatch

" write before hiding a buffer
set autowrite

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
let g:solarized_termcolors=256
syntax enable
set bg=dark
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=0
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_termcolors=16
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
" let g:solarized_diffmode="normal"
" let g:solarized_menu=1

" colorscheme ir_black
" colorscheme 10fwd

if has("gui_running")
  set guioptions-=T
  " set font
  set guifont=Meslo\ LG\ S\ DZ:h13
endif
" Use _ as a word-separator
set iskeyword-=_

" Use Ack instead of grep
set grepprg=ack

" Make the omnicomplete text readable
:highlight PmenuSel ctermfg=black

" Highlight the status line
" highlight StatusLine ctermfg=blue ctermbg=yellow
" Format xml files
" au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null" 

set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

set foldmethod=marker

set statusline+=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" better html mode
let html_use_css = 1

au BufRead,BufNewFile *.scss set filetype=scss

" auto-format cucumber-type tables
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" Syntastic setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'

" indent guides
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
