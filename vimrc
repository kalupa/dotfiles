set nocompatible               " be iMproved

source ~/dotfiles/vim/bundle_list.vim " load bundle list with vundler

set encoding=utf-8
set showcmd		" display incomplete commands
set autoread " re-read files if they change on disk

set nowrap
set tabstop=2 shiftwidth=2
set expandtab smarttab
set backspace=indent,eol,start
set autoindent

set hlsearch incsearch
set ignorecase smartcase

set history=500		" keep 500 lines of command line history
set ruler		" show the cursor position all the time
set showmatch " show matching braces
set scrolloff=8
set sidescrolloff=10
set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files
set winminheight=2
set viminfo+=!

set laststatus=2  " Always show status line.
set number " show line numbers
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line

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

" gui-specific commands
if &t_Co > 2 || has("gui_running")
  map <D-/> :TComment<CR>
  set hlsearch
  map <D-d> :IndentGuidesToggle<CR>
  set guioptions-=T
  set guifont=Meslo\ LG\ S\ DZ:h13 " set font
endif

" using leader instead of ctrl-w for window switching is amazing
map <Leader>w <C-w>w

imap <C-l> <Space>=><Space>
map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c
map <C-n> :cn<CR>
map <C-p> :cp<CR>

map <C-h> :nohl<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

" Expand the command line using tab
set wildchar=<Tab>

" 1000 undo levels
set undolevels=1000

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

" Use _ as a word-separator
set iskeyword-=_

" Use Ack instead of grep
set grepprg=ack

" set shell to sh so RVM doesn't bungle the bundles
set shell=/bin/sh

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
