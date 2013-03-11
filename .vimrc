" neobundle.vim {{{1
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif


" bundles {{{2
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'croaker/mustang-vim'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'jeffreyiacono/vim-colors-wombat'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/zencoding-vim'
NeoBundle 'mrkn/mrkn256.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc'
NeoBundle 'Shougo/vimshell'
NeoBundle 'therubymug/vim-pyte'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tomasr/molokai'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-surround'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'vim-scripts/Lucius'
NeoBundle 'vim-scripts/Zenburn'
NeoBundle 'vol2223/vim-colorblind-colorscheme'

let g:gist_detect_filetype = 1
let g:gist_post_private = 1
let g:gist_show_privates = 1
let g:neocomplcache_enable_at_startup = 1
let g:quickrun_config = {}
let g:quickrun_config['*'] = {'runmode': "async:remote:vimproc", 'split': 'below'}
let g:vimfiler_as_default_explorer = 1
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_limit = 1000




" keymaps {{{1


" basic {{{2

nnoremap <silent> <Space>c :<C-u>close<CR>
nnoremap <silent> <Space>w :<C-u>write<CR>

nnoremap <silent> <Space>h :<C-u>split<CR>
nnoremap <silent> <Space>v :<C-u>vsplit<CR>

nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :


" edit {{{2
nnoremap <silent> tn :tabnext<CR>
nnoremap <silent> tp :tabprevious<CR>

vnoremap a :Alignta<Space>
vnoremap <silent> s :sort i<CR>


" git {{{2
nnoremap <silent> <Space>gb :<C-u>Gblame<CR>
nnoremap <silent> <Space>gC :<C-u>Gcommit -v --amend<CR>
nnoremap <silent> <Space>gc :<C-u>Gcommit -v<CR>
nnoremap <silent> <Space>gd :<C-u>Gdiff<CR>
nnoremap <silent> <Space>gg :<C-u>Ggrep<Space>
nnoremap <silent> <Space>gr :<C-u>Gread<CR>
nnoremap <silent> <Space>gs :<C-u>Gstatus<CR>
nnoremap <silent> <Space>gw :<C-u>Gwrite<CR>


" unite {{{2
nnoremap <Space>u<Space> :<C-u>Unite<Space>
nnoremap <silent> <Space>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <Space>uf :<C-u>Unite file<CR>
nnoremap <silent> <Space>um :<C-u>Unite file_mru<CR>
nnoremap <silent> <Space>ur :<C-u>Unite file_rec/async<CR>


" others {{{2
nnoremap <Space>f :<C-u>VimFiler<CR>
nnoremap <Space>r :<C-u>QuickRun<CR>




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
set ambiwidth=double




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
set listchars=tab:➭\ ,trail:-
set background=dark
colorscheme jellybeans
set directory=~/.vim/tmp
set shell=/bin/zsh
set modeline
set modelines=2
set autoread
set updatetime=100
set helplang=ja,en




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
