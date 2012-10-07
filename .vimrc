" neobundle.vim {{{1
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif


" bundles {{{2
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'skammer/vim-css-color'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-surround'
NeoBundle 'ujihisa/unite-colorscheme'

let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:neocomplcache_enable_at_startup = 1
let g:quickrun_config = {}
let g:quickrun_config['*'] = {'runmode': "async:remote:vimproc", 'split': 'below'}




" keymaps {{{1
nnoremap <Space>gC :<C-u>Gcommit -v --amend<CR>
nnoremap <Space>gb :<C-u>Gblame<CR>
nnoremap <Space>gc :<C-u>Gcommit -v<CR>
nnoremap <Space>gd :<C-u>Gdiff<CR>
nnoremap <Space>gg :<C-u>Ggrep 
nnoremap <Space>gm :<C-u>Gmove<CR>
nnoremap <Space>gr :<C-u>Gread<CR>
nnoremap <Space>gs :<C-u>Gstatus<CR>
nnoremap <Space>gw :<C-u>Gwrite<CR>
nnoremap <Space>Gp :<C-u>Gist<CR>
nnoremap <Space>h :<C-u>split<CR>
nnoremap <Space>q :<C-u>quit<CR>
nnoremap <Space>r :<C-u>QuickRun<CR>
nnoremap <Space>s :<C-u>VimShell<CR>
nnoremap <Space>v :<C-u>vsplit<CR>
nnoremap <Space>w :<C-u>write<CR>
nnoremap <Left> <C-w><C-h>
nnoremap <Down> <C-w><C-j>
nnoremap <Up> <C-w><C-k>
nnoremap <Right> <C-w><C-l>

vnoremap <Space>a :Alignta 
vnoremap <Space>s :sort 




" display {{{1
set number
set laststatus=2
set statusline=
  \%y
  \%{'['.(&fenc!=''?&fenc:&enc).']'}
  \%{'['.&ff.']'}\ 
  \%<
  \%f\ 
  \%m
  \%=
  \%{fugitive#statusline()}
  \%8(%l,%v%)
  \%8(%P%)
set foldmethod=marker




" search {{{1
set ignorecase
set nohlsearch
set incsearch




" edit {{{1
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis
set autoindent
set history=100
set undolevels=1000
set showcmd
set list
set listchars=tab:☞\ ,trail:-
colorscheme jellybeans
set directory=~/.vim/tmp
set shell=/bin/zsh
set modeline
set modelines=2
set autoread
set updatetime=100




" filetype {{{1
" default {{{2
syntax enable
filetype plugin indent on
set autoindent
set expandtab tabstop< softtabstop=2 shiftwidth=2


" C {{{2
autocmd FileType c setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=2
  \ shiftwidth=2


" C++ {{{2
autocmd FileType cpp setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=2
  \ shiftwidth=2


" CoffeeScript {{{2
autocmd FileType coffee setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=2
  \ shiftwidth=2


" CSS {{{2
autocmd FileType css setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=2
  \ shiftwidth=2


" Cucumber {{{2
autocmd FileType cucumber setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=2
  \ shiftwidth=2


" Haml {{{2
autocmd FileType css setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=2
  \ shiftwidth=2


" Haskell {{{2
autocmd FileType haskell setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=4
  \ shiftwidth=4


" HTML {{{2
autocmd FileType html setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=2
  \ shiftwidth=2


" JavaScript {{{2
autocmd FileType javascript setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=2
  \ shiftwidth=2


" Markdown {{{2
autocmd FileType markdown setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=4
  \ shiftwidth=4


" PHP {{{2
autocmd FileType php setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=4
  \ shiftwidth=4
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_sql_query = 1
let g:ref_phpmanual_path = expand('~/doc/php-chunked-xhtml/')


" PHPUnit {{{2
augroup QuickRunPHPUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile *Test.php setlocal filetype=php.unit
augroup END
let g:quickrun_config['php.unit'] = {'command': 'phpunit'}


" RSpec {{{2
augroup QuickRunRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb setlocal filetype=ruby.rspec
augroup END
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}


" Ruby {{{2
autocmd FileType ruby setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=2
  \ shiftwidth=2


" Sass {{{2
autocmd FileType sass setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=2
  \ shiftwidth=2


" Scala {{{2
autocmd FileType scala setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=2
  \ shiftwidth=2


" Scss {{{2
autocmd FileType scss setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=2
  \ shiftwidth=2


" Smarty {{{2
autocmd FileType smarty setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=2
  \ shiftwidth=2


" Vim script {{{2
autocmd FileType vim setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=2
  \ shiftwidth=2
let g:vim_indent_cont = 2




" load .vimrc.local {{{1
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
