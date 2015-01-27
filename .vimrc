set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Plugin dependencies
Plugin 'kana/vim-textobj-user'
Plugin 'MarcWeber/vim-addon-mw-utils'

" Plugins with dependencies
Plugin 'garbas/vim-snipmate'
Plugin 'nelstrom/vim-textobj-rubyblock'

" Plugin bundles
Plugin 'honza/vim-snippets'
Plugin 'tacahiroy/ctrlp-funky'

Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'itchyny/lightline.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'benmills/vim-golang-alternate'
Plugin 'fatih/vim-go'

" Language bundles
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'slim-template/vim-slim'
Plugin 'sunaku/vim-ruby-minitest'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'vim-ruby/vim-ruby'
Plugin 'elixir-lang/vim-elixir'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'



" Color scheme
Plugin 'nanotech/jellybeans.vim'

" All of your Plugins must be added before the following line
call vundle#end()

filetype plugin indent on

let mapleader='\'

set hidden
set cursorline
set modelines=3
set shiftwidth=2
set clipboard=unnamed,unnamedplus
set synmaxcol=256
set ttyscroll=3
set ttyfast
set encoding=utf-8 termencoding=utf-8
set tabstop=2
set nowrap
set number
set expandtab
set nowritebackup
set noswapfile
set nobackup
set ignorecase
set smartcase
set lazyredraw
set splitright
set scrolloff=4
set sidescroll=1
set sidescrolloff=1
set noshowmode
set list listchars=tab:▸\ ,trail:·,extends:>,precedes:<
set omnifunc=syntaxcomplete#Complete
set cryptmethod=blowfish

" Disable preview window
set completeopt-=preview

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Vim annoyances
" http://blog.sanctum.geek.nz/vim-annoyances/
vnoremap u y
nnoremap U <C-r>
nnoremap Q <nop>
nnoremap K <nop>
nnoremap J mzJ`z
nnoremap Y y$
inoremap jk <Esc>
inoremap JK <Esc>
inoremap Jk <Esc>
inoremap jK <Esc>

nnoremap <silent> <F5> :set paste!<CR>

set shortmess+=I
set virtualedit=block

" Disable cursor line in insert mode
au InsertEnter * set nocursorline
au InsertLeave * set cursorline nopaste

" Change the cursor in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

autocmd FileType * if &completefunc != '' | let &omnifunc=&completefunc | endif

" Automatic formatting
function! <SID>StripTrailingSpace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre *.rb,*.js,*.coffee :call <SID>StripTrailingSpace()
autocmd BufWritePre *.scss,*.haml,*.slim,*.html,*.builder :call <SID>StripTrailingSpace()
autocmd BufWritePre *.txt,*.md,*.markdown :call <SID>StripTrailingSpace()

au BufNewFile * set noeol

" No show command
autocmd VimEnter * set nosc

" Use space for :
noremap <space> :

" Quick ESC
imap jj <ESC>

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk

" format the entire file
nmap <leader>fef ggVG=

" Open new buffers
nmap <leader>s<left>   :leftabove  vnew<cr>
nmap <leader>s<right>  :rightbelow vnew<cr>
nmap <leader>s<up>     :leftabove  new<cr>
nmap <leader>s<down>   :rightbelow new<cr>

" Tab between buffers
noremap <tab> <c-w>w
noremap <S-tab> <c-w>W

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" Go to home and end using capitalized directions
noremap H ^
noremap L $

" Resize buffers
if bufwinnr(1)
  nmap ö <C-W><<C-W><
  nmap ä <C-W>><C-W>>
  nmap Ä <C-W>-<C-W>-
  nmap Ö <C-W>+<C-W>+
endif

" Matchparen.vim
let g:loaded_matchparen = 0

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

let NERDTreeMapOpenInTab='\t'
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg', 'reports', 'Godeps', '_workspace', 'gin-bin']

" SuperTab
let g:SuperTabDefaultCompletionType = "context"

" CtrlP
nnoremap <silent> t :CtrlP<cr>
nnoremap <silent><leader>t :CtrlP<cr>
nnoremap <silent><leader>r :CtrlPMRUFiles<cr>
        if isdirectory(expand("~/.vim/bundle/ctrlp.vim/"))
            let g:ctrlp_working_path_mode = 'ra'
            nnoremap <silent> <D-t> :CtrlP<CR>
            nnoremap <silent> <D-r> :CtrlPMRU<CR>
            let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

            " On Windows use "dir" as fallback command.
            let s:ctrlp_fallback = 'dir %s /-n /b /s /a-d'
            if executable('ag')
                let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
            elseif executable('ack-grep')
                let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
            elseif executable('ack')
                let s:ctrlp_fallback = 'ack %s --nocolor -f'
            else
                let s:ctrlp_fallback = 'find %s -type f'
            endif
            let g:ctrlp_user_command = {
                \ 'types': {
                    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': s:ctrlp_fallback
            \ }

            if isdirectory(expand("~/.vim/bundle/ctrlp-funky/"))
                " CtrlP extensions
                let g:ctrlp_extensions = ['funky']

                "funky
                nnoremap <Leader>fu :CtrlPFunky<Cr>
            endif
        endif


let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0

let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 0
let g:ctrlp_max_files = 512
let g:ctrlp_max_depth = 6
let g:ctrlp_root_markers = ['.git']
let g:ctrlp_user_command = {
  \ 'types': { 1: ['.git/', 'cd %s && git ls-files --cached --exclude-standard --others | grep -v _workspace | grep -v private_gems'] },
  \ 'fallback': 'ack -f %s --ignore-dir=.git | head -' . g:ctrlp_max_files
  \ }

" Ack
nmap <leader>a :Ack! 
set shellpipe=>

" Sass
au BufRead,BufNewFile *.scss set filetype=sass

" Slim
au BufRead,BufNewFile *.slim set filetype=slim

" Go programming
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim

au BufRead,BufNewFile *.go setl filetype=go nolist noexpandtab syntax=go
au BufEnter *.go setl nolist noexpandtab
autocmd BufWritePre *.go :%s/\s\+$//e
autocmd FileType go compiler go

au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>d <Plug>(go-doc-vertical)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)

let g:go_disable_autoinstall = 1
let g:go_gocode_bin="/home/nir/Projects/robohold/.vendor/bin/gocode"
let g:go_goimports_bin="/home/nir/Projects/robohold/.vendor/bin/goimports"
let g:go_godef_bin="/home/nir/Projects/robohold/.vendor/bin/godef"
let g:go_oracle_bin="/home/nir/Projects/robohold/.vendor/bin/oracle"
let g:go_golint_bin="/home/nir/Projects/robohold/.vendor/bin/golint"
let g:go_fmt_command = "goimports"


nmap <leader>gb :Gblame<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Glog<CR>
nmap <leader>gc :Gcommit<CR>
nmap <leader>gp :Git push<CR>

"autocmd VimEnter *  TagbarToggle

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


nnoremap <silent> <leader>tt :TagbarToggle<CR>



 
set tags=./tags;/,~/.vimtags

" Make tags placed in .git/tags file available in all levels of a repository
let gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif

colorscheme jellybeans
set t_Co=256
nnoremap <leader><leader> <C-^>


let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
