" Add better UTF-8 support.
scriptencoding utf-8

set nocompatible               " Be iMproved

" Enable better indentation.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set autoindent
set expandtab
set nowrap                      " Do not wrap long lines
set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)
set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

let g:html_indent_inctags='html,body,head,tbody'

source $HOME/.vim/keys.vim
source $HOME/.vim/neobundle.vim
source $HOME/.vim/pluginsconfig.vim

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

set backup " don't litter
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set noswapfile

set title " Show the file name in the window title bar.
set number " Enable line numbers.
set list " show tab characters and line endings
"set mousehide               " Hide the mouse cursor while typing
"set mouse=a
set textwidth=90 " Show a column marker at 90
set colorcolumn=90
set hlsearch " Highlight searches.
set ignorecase " Ignore case of searches.

" If the search contains an upper-case character, become case sensitive.
set smartcase

" Configure the spelling language and file.
set spelllang=en_us
set spellfile=$HOME/.vim/spell/en.utf-8.add
set spell
set diffopt+=vertical " Always use vertical diffs
set noerrorbells visualbell t_vb= " Disable error bells.
set nostartofline " Don't reset cursor to start of line when moving around.
set shortmess=atI " Don't show the intro message when starting vim.
set binary
set noeol " Disable the extra line at the end of files.
set scrolloff=3 " Scroll when with more context

if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif

set cursorline                  " Highlight current line
highlight clear SignColumn      " SignColumn should match background
highlight clear LineNr          " Current line number row will have same background color in relative mode

" STATUS LINE
" Broken down into easily includeable segments
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
"set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info

" visualize the invisibles
set listchars=tab:▸\ ,trail:¬,extends:>,precedes:.

augroup vimrcEx
    autocmd!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it for commit messages, when the position is invalid, or when
    " inside an event handler (happens when dropping a file on gvim).
    autocmd BufReadPost *
                \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif

    autocmd FileType markdown setlocal spell " Enable spellchecking for Markdown

    " Automatically wrap at 80 characters for Markdown
    autocmd BufRead,BufNewFile *.md setlocal textwidth=80

    " Automatically wrap at 72 characters and spell check git commit messages
    autocmd FileType gitcommit setlocal textwidth=72
    autocmd FileType gitcommit setlocal spell

    " Allow stylesheets to autocomplete hyphenated words
    autocmd FileType css,scss,sass setlocal iskeyword+=-

    autocmd GUIEnter * set visualbell t_vb=

    " fix trailing whitespace
    autocmd FileType coffee,sh,javascript,json,python,yml,ruby autocmd BufWritePre <buffer> call StripTrailingWhitespace()

    autocmd FileType xml exe ":silent %!xmllint --format --recover - 2>/dev/null"

    "autocmd BufNewFile,BufRead *.coffee set filetype=coffee
    autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
    "autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent
    autocmd BufNewFile,BufRead *.cap set filetype=ruby
augroup END

" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor " Use Ag over Grep
endif

set tags=./tags;/,~/.vimtags

" make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

" Strip whitespace
function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
