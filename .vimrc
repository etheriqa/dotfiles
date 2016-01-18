" NeoBundle {{{1
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Chiel92/vim-autoformat'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'fatih/vim-go'
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

" Variables
let g:neocomplcache_enable_at_startup = 1
let g:quickrun_config = {}
let g:quickrun_config['*'] = {'runmode': 'async:remote:vimproc', 'split': 'below'}
let g:vimfiler_as_default_explorer = 1


" Commands {{{1
command! -nargs=0 Reload source $MYVIMRC
command! -nargs=0 -bang WASD call <SID>wasd_switch('<bang>')
function! s:wasd_switch(bang)
  if a:bang == ''
    nnoremap w k
    nnoremap a h
    nnoremap s j
    nnoremap d l
  else
    nunmap w
    nunmap a
    nunmap s
    nunmap d
  endif
endfunction


" Key Mapping {{{1
let mapleader=' '

" Basic
nnoremap <silent> <Leader>q :<C-u>quit<CR>
nnoremap <silent> <Leader>w :<C-u>write<CR>

nnoremap <silent> t1 :<C-u>tabnext 1<CR>
nnoremap <silent> t2 :<C-u>tabnext 2<CR>
nnoremap <silent> t3 :<C-u>tabnext 3<CR>
nnoremap <silent> t4 :<C-u>tabnext 4<CR>
nnoremap <silent> t5 :<C-u>tabnext 5<CR>
nnoremap <silent> t6 :<C-u>tabnext 6<CR>
nnoremap <silent> tc :<C-u>tabnew<CR>
nnoremap <silent> tn :<C-u>tabnext<CR>
nnoremap <silent> tp :<C-u>tabprevious<CR>

nnoremap <silent> <Leader>h :<C-u>split<CR>
nnoremap <silent> <Leader>v :<C-u>vsplit<CR>

nnoremap : ;
nnoremap ; :
vnoremap : ;
vnoremap ; :

" Edit
vnoremap          a<Space> :Alignta<Space>
vnoremap <silent> s :sort i<CR>

nmap <silent> <C-h> <Plug>(caw:i:toggle)
vmap <silent> <C-h> <Plug>(caw:i:toggle)

" Unite
call unite#custom#profile('default', 'context', {
  \ 'split': 0,
  \ })

let s:unite_source_grep_context_git = {
  \ 'custom_grep_command': 'git',
  \ 'custom_grep_default_opts': 'grep -inH',
  \ 'custom_grep_recursive_opt': '',
  \ }

function! s:unite_cword_contextual()
  if finddir('.git', getcwd()) != ''
    let context = deepcopy(s:unite_source_grep_context_git)
    let context.input = expand('<cword>')
    call unite#start([['grep', '!']], context)
  else
    call unite#start([['grep', getcwd(), '', expand('<cword>')]])
  endif
endfunction

function! s:unite_cfile_contextual()
  if finddir('.git', getcwd()) != ''
    call unite#start(['file_rec/git'], {
      \ 'input': expand('<cfile>'),
      \ 'force_immediately': 1,
      \ })
  else
    call unite#start(['file_rec/async'], {
      \ 'input': expand('<cfile>'),
      \ 'force_immediately': 1,
      \ })
  endif
endfunction

function! s:unite_grep_contextual()
  if finddir('.git', getcwd()) != ''
    call unite#start([['grep', '!']], s:unite_source_grep_context_git)
  else
    call unite#start([['grep', getcwd()]])
  endif
endfunction

function! s:unite_project_contextual()
  if finddir('.git', getcwd()) != ''
    call unite#start(['file_rec/git'], {'start_insert': 1})
  else
    call unite#start(['file_rec/async'], {'start_insert': 1})
  endif
endfunction

function! s:unite_file()
  call unite#start(['file', 'file/new', 'directory/new'], {'start_insert': 1})
endfunction

nnoremap <silent> /         :<C-u>Unite line:forward -start-insert<CR>
nnoremap <silent> <Leader>b :<C-u>Unite buffer<CR>
nnoremap <silent> <Leader>c :<C-u>call <SID>unite_cword_contextual()<CR>
nnoremap <silent> <Leader>C :<C-u>call <SID>unite_cfile_contextual()<CR>
nnoremap <silent> <Leader>f :<C-u>call <SID>unite_file()<CR>
nnoremap <silent> <Leader>g :<C-u>call <SID>unite_grep_contextual()<CR>
nnoremap <silent> <Leader>p :<C-u>call <SID>unite_project_contextual()<CR>
nnoremap <silent> <Leader>r :<C-u>UniteResume<CR>
nnoremap <silent> <Leader>u :<C-u>Unite -start-insert<CR>
nnoremap <silent> ?         :<C-u>Unite line:backward -start-insert<CR>

" Others
nnoremap          <Leader>R :<C-u>Reload<CR>


" Appearance {{{1
set ambiwidth=double
set background=dark
set helplang=ja,en
set laststatus=2
set list
set listchars=tab:🏳\ ,trail:🔥
set relativenumber
set showcmd

if neobundle#is_installed('jellybeans.vim')
  colorscheme jellybeans
endif


" Search {{{1
set ignorecase
set incsearch
set nohlsearch
set smartcase


" Edit {{{1
set autoread
set directory=~/.vim/tmp
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,euc-jp,sjis
set fileformat=unix
set fileformats=unix,dos,mac
set history=100
set modeline
set modelines=2
set undolevels=1000
set updatetime=100


" Filetypes {{{1

" Default
syntax enable
filetype plugin indent on
set autoindent
set expandtab tabstop=4 softtabstop=4 shiftwidth=4

" Functions
function! s:indent_soft(width)
  setlocal expandtab
  let &l:tabstop = a:width
  let &l:softtabstop = a:width
  let &l:shiftwidth = a:width
endfunction

function! s:indent_hard(width)
  setlocal noexpandtab
  let &l:tabstop = a:width
  let &l:softtabstop = a:width
  let &l:shiftwidth = a:width
endfunction

" BIND
autocmd! FileType bindzone call s:indent_hard(8)

" C, C++
autocmd! FileType c,cpp call s:indent_soft(2)
autocmd! BufWinEnter,BufNewFile *.ic setlocal filetype=cpp

" CoffeeScript
autocmd! FileType coffee call s:indent_soft(2)

" CSS, SASS, SCSS
autocmd! FileType css,sass,scss call s:indent_soft(2)

" Cucumber
autocmd! FileType cucumber call s:indent_soft(2)

" gitconfig
autocmd! FileType gitconfig call s:indent_hard(8)

" Golang
autocmd! FileType go call s:indent_hard(4)

" Haskell
autocmd! FileType haskell call s:indent_soft(4)

" HTML
autocmd! FileType html call s:indent_soft(2)

" JavaScript
autocmd! FileType javascript call s:indent_soft(2)

" Less
autocmd! FileType less call s:indent_soft(2)

" Markdown
autocmd! FileType markdown call s:indent_soft(4)

" PHP
autocmd! FileType php call s:indent_soft(4)
let php_htmlInStrings = 1
let php_noShortTags = 1
let php_sql_query = 1
let g:ref_phpmanual_path = expand('~/doc/php-chunked-xhtml/')

" Processing
autocmd! FileType processing call s:indent_soft(4)
let g:quickrun_config['processing'] = {
  \ 'command': 'processing-java',
  \ 'exec': '%c --sketch=`dirname %s` --output=$HOME/Library/Processing --run --force'
  \ }

" Protocol Buffers
autocmd! FileType proto call s:indent_soft(2)

" Python
autocmd! FileType python call s:indent_soft(4)

" RSpec
augroup QuickRunRSpec
  autocmd! BufWinEnter,BufNewFile *_spec.rb setlocal filetype=ruby.rspec
augroup END
let g:quickrun_config['ruby.rspec'] = {'command': 'rspec'}

" Ruby
autocmd! FileType ruby call s:indent_soft(2)

" Scala
autocmd! FileType scala call s:indent_soft(2)

" Shell
autocmd! FileType sh,zsh call s:indent_soft(2)

" Smarty
autocmd! FileType smarty call s:indent_soft(2)

" SQL
autocmd! FileType sql call s:indent_soft(2)
let g:sql_type_default='mysql'

" TeX
autocmd! FileType tex call s:indent_soft(2)

" Vim script {
autocmd! FileType vim call s:indent_soft(2)
let g:vim_indent_cont = 2

" YAML
autocmd! FileType yaml call s:indent_soft(2)


" .vimrc.local {{{1
if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif
