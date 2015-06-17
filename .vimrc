" neobundle.vim {{{1
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'groenewege/vim-less'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'hynek/vim-python-pep8-indent'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript', 'develop'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \   },
  \ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'sophacles/vim-processing'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tyru/caw.vim.git'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'vim-jp/vim-go-extra'
NeoBundle 'vim-jp/vimdoc-ja'
NeoBundle 'vim-scripts/gtags.vim'
NeoBundle 'vim-scripts/VimCoder.jar'
call neobundle#end()

" bundles {{{2

let g:neocomplcache_enable_at_startup = 1
let g:quickrun_config = {}
let g:quickrun_config['*'] = {'runmode': "async:remote:vimproc", 'split': 'below'}
let g:vimfiler_as_default_explorer = 1
let g:unite_enable_start_insert = 1
let g:unite_source_file_mru_limit = 1000




" keymaps {{{1


" basic {{{2

nnoremap <silent> <Space>c :<C-u>close<CR>
nnoremap <silent> <Space>q :<C-u>quit<CR>
nnoremap <silent> <Space>w :<C-u>write<CR>

nnoremap <silent> <Space>h :<C-u>split<CR>
nnoremap <silent> <Space>v :<C-u>vsplit<CR>

nnoremap <silent> <C-n> :<C-u>cnext<CR>
nnoremap <silent> <C-p> :<C-u>cprevious<CR>
nnoremap <silent> <C-c> :<C-u>cclose<CR>

nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :


" edit {{{2
nnoremap <silent> tn :tabnext<CR>
nnoremap <silent> tp :tabprevious<CR>

vnoremap          a<Space> :Alignta<Space>
vnoremap <silent> s :sort i<CR>

nmap <silent> <C-h> <Plug>(caw:i:toggle)
vmap <silent> <C-h> <Plug>(caw:i:toggle)


" git {{{2
nnoremap <silent> <Space>gb :<C-u>Gblame<CR>
nnoremap <silent> <Space>gC :<C-u>Gcommit -v --amend<CR>
nnoremap <silent> <Space>gc :<C-u>Gcommit -v<CR>
nnoremap <silent> <Space>gd :<C-u>Gdiff<CR>
nnoremap          <Space>gg :<C-u>Ggrep<Space>
nnoremap <silent> <Space>gr :<C-u>Gread<CR>
nnoremap <silent> <Space>gs :<C-u>Gstatus<CR>
nnoremap <silent> <Space>gw :<C-u>Gwrite<CR>


" global {{{2
nnoremap          <C-g><Space> :<C-u>Gtags<Space>
nnoremap <silent> <C-g>c :<C-u>GtagsCursor<CR>
nnoremap <silent> <C-g>f :<C-u>Gtags -f %<CR>
nnoremap          <C-g>g :<C-u>Gtags -g<Space>
nnoremap          <C-g>r :<C-u>Gtags -r<Space>


" unite {{{2
nnoremap <Space>u<Space> :<C-u>Unite<Space>
nnoremap <silent> <Space>ub :<C-u>Unite buffer<CR>
nnoremap <silent> <Space>uf :<C-u>Unite file<CR>
nnoremap <silent> <Space>um :<C-u>Unite file_mru<CR>
nnoremap <silent> <Space>ur :<C-u>Unite file_rec/async<CR>


" others {{{2
nnoremap <Space>f :<C-u>VimFiler<CR>
nnoremap <Space>r :<C-u>QuickRun<CR>
nnoremap <Space>s :<C-u>VimShell<CR>




" display {{{1
set relativenumber
set laststatus=2
set foldmethod=marker
set ambiwidth=double




" search {{{1
set ignorecase
set nohlsearch
set incsearch




" edit {{{1
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis
set fileencoding=utf-8
set fileformats=unix,dos,mac
set fileformat=unix
set autoindent
set history=100
set undolevels=1000
set showcmd
set list
set listchars=tab:➭\ ,trail:-
set background=dark
if neobundle#is_installed("jellybeans.vim")
  colorscheme jellybeans
endif
set directory=~/.vim/tmp
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
set expandtab tabstop=8 softtabstop=4 shiftwidth=4

command! -nargs=1 SoftIndent
  \ setlocal
  \ expandtab
  \ tabstop<
  \ softtabstop=<args>
  \ shiftwidth=<args>

command! -nargs=1 HardIndent
  \ setlocal
  \ noexpandtab
  \ tabstop=<args>
  \ softtabstop=0
  \ shiftwidth=<args>


" BIND {{{2
autocmd FileType bindzone HardIndent 8


" C, C++ {{{2
autocmd FileType c,cpp SoftIndent 2
autocmd BufWinEnter,BufNewFile *.ic setlocal filetype=cpp


" CoffeeScript {{{2
autocmd FileType coffee SoftIndent 2


" CSS, SASS, SCSS {{{2
autocmd FileType css,sass,scss SoftIndent 2


" Cucumber {{{2
autocmd FileType cucumber SoftIndent 2


" gitconfig {{{2
autocmd FileType gitconfig HardIndent 8


" Golang {{{2
autocmd FileType go HardIndent 4
autocmd FileType go autocmd BufWritePre <buffer> Fmt


" Haskell {{{2
autocmd FileType haskell SoftIndent 4


" HTML {{{2
autocmd FileType html SoftIndent 2


" JavaScript {{{2
autocmd FileType javascript SoftIndent 2


" Markdown {{{2
autocmd FileType markdown SoftIndent 4


" PHP {{{2
autocmd FileType php SoftIndent 4
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_sql_query = 1
let g:ref_phpmanual_path = expand('~/doc/php-chunked-xhtml/')


" Processing {{{2
autocmd FileType processing SoftIndent 4
let g:quickrun_config['processing'] = {
  \ 'command': 'processing-java',
  \ 'exec': '%c --sketch=`dirname %s` --output=$HOME/Library/Processing --run --force'
  \ }


" Python {{{2
autocmd FileType python SoftIndent 4


" RSpec {{{2
augroup QuickRunRSpec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb setlocal filetype=ruby.rspec
augroup END
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}


" Ruby {{{2
autocmd FileType ruby SoftIndent 2


" Scala {{{2
autocmd FileType scala SoftIndent 2


" Shell {{{2
autocmd FileType sh,zsh SoftIndent 2


" Smarty {{{2
autocmd FileType smarty SoftIndent 2


" SQL {{{2
autocmd FileType sql SoftIndent 2
let g:sql_type_default='mysql'


" TeX {{{2
autocmd FileType tex SoftIndent 2


" Vim script {{{2
autocmd FileType vim SoftIndent 2
let g:vim_indent_cont = 2


" YAML {{{2
autocmd FileType yaml SoftIndent 2



" load .vimrc.local {{{1
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
