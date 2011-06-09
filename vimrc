filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
call ucompleteme#Setup()

" ================
" Ruby stuff
" ================
syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  " autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END
" ================

let mapleader = ","

" map <Leader>h :FuzzyFinderFileWithCurrentBufferDir<CR>
" map <Leader>h :FuzzyFinderTextMate<CR>

map <Leader>co :TComment<CR>
if &t_Co > 2 || has("gui_running")
  map <D-/> :TComment<CR>
endif

" Some new git bindings.  I do this stuff too often not to have shortcuts.
map <Leader>gc :Gcommit -m ""<LEFT>
" map <Leader>gac :Gcommit -m -a ""<LEFT>
map <Leader>gst :GStatus<CR>


" map <Leader>rf :FuzzyFinderTextMateRefreshFiles<CR>
" remove trailing whitespace
" map <Leader>rw :%s/\s\+$//

map <Leader>w <C-w>w

map <C-h> :nohl<CR>
imap <C-l> <Space>=><Space>
" map <C-s> <esc>:w<CR>
" imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c
map <C-n> :cn<CR>
map <C-p> :cp<CR>
" if has("gui_macvim")
"  macmenu &File.New\ Tab key=<nop>
"  map <D-t> <Plug>PeepOpen
" end
nnoremap <silent> <C-l> :nohl<CR><C-l>

set nocompatible
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

" we use a dark background, don't we?
set bg=dark
if has('gui_running')
    set background=light
else
    set background=dark
endif

" use our nice colortheme
colorscheme solarized
" colorscheme ir_black
" colorscheme 10fwd

" set font
set gfn=Menlo:h12
" Use _ as a word-separator
set iskeyword-=_

" Use Ack instead of grep
set grepprg=ack

" Make the omnicomplete text readable
:highlight PmenuSel ctermfg=black

" Fuzzy finder: ignore stuff that can't be opened, and generated files
" let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow
" Format xml files
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null" 

set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" set nofoldenable " Fuck code folding...
set foldmethod=marker

command Q q " Bind :Q to :q
command Qall qall 

set statusline+=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" better html mode
let html_use_css = 1

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
 filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
"  augroup vimrcEx
"  au!

  " For all text files set 'textwidth' to 78 characters.
"  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
"  autocmd BufReadPost *
"    \ if line("'\"") > 0 && line("'\"") <= line("$") |
"    \   exe "normal g`\"" |
"    \ endif

"  augroup END

  " scss/sass highlighting
  au BufRead,BufNewFile *.scss set filetype=scss
endif " has("autocmd")

" au BufNewFile,BufRead *.liquid	 setf liquid
