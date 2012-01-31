" bundles for awesomeness
filetype off 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundle/vimscript managers
Bundle "gmarik/vundle"
Bundle "tpope/vim-pathogen"

" Themes 
Bundle "altercation/vim-colors-solarized"

" Git tools
Bundle "tpope/vim-git"
Bundle "tpope/vim-fugitive"

" Global editor usefulness
Bundle "tpope/vim-repeat"
Bundle "tpope/vim-ragtag"
Bundle "tomtom/tcomment_vim"
Bundle "tpope/vim-surround"
Bundle "tpope/vim-endwise"
Bundle "MartinLafreniere/vim-PairTools"
Bundle "godlygeek/tabular"
Bundle "vim-scripts/IndexedSearch"
" Bundle "mattn/gist-vim"
Bundle "airblade/vim-rooter"
" Bundle "nathanaelkane/vim-indent-guides"
Bundle "sjl/gundo.vim"
Bundle "taglist.vim"
Bundle "wincent/Command-T"
Bundle "sickill/vim-pasta"
Bundle "kien/ctrlp.vim"

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
" Bundle "vim-rspec"

" Javascript/Coffeescript
" Bundle "javaScriptLint"
Bundle "hallettj/jslint.vim"
Bundle "kchmck/vim-coffee-script"
Bundle "itspriddle/vim-jquery"

" HTML/CSS generating modes
Bundle "tpope/vim-haml"
Bundle "tpope/vim-markdown"
" Bundle "wavded/vim-stylus"
Bundle "cakebaker/scss-syntax.vim" 

" PHP-Related
" Bundle "vim-scripts/php.vim"

" Clojure
" Bundle "VimClojure"

" Misc
" Bundle "davidoc/todo.txt-vim"

" DISABLED FOR NOW
" Bundle "tsaleh/vim-align"

syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins
