" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    set nocompatible               " Be iMproved

    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

let g:make = 'gmake'
if system('uname -o') =~ '^GNU/'
    let g:make = 'make'
endif

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Unite for lazy-search fun
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'mac' : 'make -f make_mac.mak',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }
NeoBundle 'Shougo/unite.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'Shougo/neomru.vim'

" intelligent completion
NeoBundle 'Shougo/neocomplete.vim'

" js syntax
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'vim-scripts/JavaScript-Indent'
NeoBundleLazy 'othree/javascript-libraries-syntax.vim'
NeoBundleLazy 'mxw/vim-jsx'

" other lang syntax
NeoBundleLazy 'vim-ruby/vim-ruby'

" colors
NeoBundle 'altercation/vim-colors-solarized'

" tpope rules
NeoBundleLazy 'tpope/vim-markdown'
NeoBundleLazy 'tpope/vim-haml'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-ragtag'
NeoBundle 'tpope/vim-rsi'
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-vinegar'
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'tpope/vim-projectile'
NeoBundle 'tpope/vim-jdaddy'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-tbone'

" General
"NeoBundle 'rizzatti/dash.vim'
NeoBundle 'bling/vim-airline'
NeoBundle 'godlygeek/tabular'
NeoBundle 'marijnh/tern_for_vim', {
            \ 'build' : {
            \     'mac' : 'npm install',
            \     'linux' : 'npm install',
            \     'unix' : 'npm install',
            \    },
            \ }
NeoBundle 'myusuf3/numbers.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bruno-/vim-vertical-move'
NeoBundle 'Raimondi/delimitMate'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'

" tmux integrations
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'christoomey/vim-tmux-navigator'

NeoBundle 'zhaocai/GoldenView.Vim' "Always have a nice view for vim split windows

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.

NeoBundleCheck
