"set char
set encoding=utf-8
scriptencoding utf-8
set fenc=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

"set
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set spell
set wildmenu
set history=5000

"indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent

"search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"style
set number
set cursorline
set ruler
set showmatch
set virtualedit=onemore
set laststatus=2
set wildmode=list:longest

"custom
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>
cnoremap gosh GoshREPLWithBuffer

"color
syntax on

"plugins
:let g:neobundle_default_git_protocol='https'
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/

    if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
        echo "install NeoBundle..."
        :call system("git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
    endif
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

"----------------------------------------------------------
"set
NeoBundle 'tomasr/molokai'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'Yggdroot/indentLine'
NeoBundle 'scrooloose/nerdtree'

"search
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'haya14busa/incsearch.vim'

"gosh
NeoBundle 'aharisu/vim_goshrepl'
NeoBundle 'aharisu/vim-gdev'
NeoBundle 'Shougo/vimproc.vim'

"ruby
NeoBundle 'tpope/vim-endwise'
NeoBundle 'szw/vim-tags'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'marcus/rsense'

"html
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'hokaccha/vim-html5validator'

"css
NeoBundle 'hail2u/vim-css3-syntax'

"javascript
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jiangmiao/simple-javascript-indenter'

"----------------------------------------------------------
call neobundle#end()
NeoBundleCheck

filetype plugin indent on

"---------------------------------------------------------
"plugins set

" molokai
if neobundle#is_installed('molokai')
    colorscheme molokai
endif

set t_Co=256
syntax enable

"lightline
set laststatus=2
set showmode
set showcmd
set ruler 

"NERDTREE
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"incsearch.vim
map / <Plug>(incsearch-forward)

" Rsense
let g:rsenseHome = '/usr/local/lib/rsense-0.3'
let g:rsenseUseOmniFunc = 1

"emmet
let g:user_emmet_settings = {'variables': {'lang' : 'ja'}}
