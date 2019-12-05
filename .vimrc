" set char
set encoding=utf-8
scriptencoding utf-8
set fenc=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac

" set
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set spell
set wildmenu
set history=5000
set backspace=indent,eol,start

" indent
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set list
set listchars=tab:¦_,trail:~,nbsp:~
hi SpecialKey ctermfg=darkmagenta
command I set list!

" search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

" style
set number
set cursorline
set ruler
set showmatch
set virtualedit=onemore
set laststatus=2
set wildmode=list:longest

" Custom map
command Ss :split
command P set paste
command Np set nopaste
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>
cnoremap rep %s/before/after/g
cnoremap jc! !javac
cnoremap ja! !java
nnoremap <C-O> :<C-u>call append(expand('.'), '')<Cr>j
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nmap # <Space><Space>:%s/<C-r>///g<Left><Left>
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]
vnoremap v $h
inoremap <C-t> <Esc><Left>"zx"zpa
inoremap jj <ESC>
" move
nnoremap j gj
nnoremap k gk
" split
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
" tarm emacs
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" Custom Leader
let mapleader = ","
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>vs :vs<CR>
nnoremap <Leader>ss :split<CR>
nnoremap <Leader>h ^
nnoremap <Leader>l $
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

if has("autocmd")
	autocmd BufReadPost *
	\ if line("'\"") > 0 && line ("'\"") <= line("$") |
	\	exe "normal! g'\"" |
	\ endif
endif

" Color
syntax on

" Plugins
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
" set
NeoBundle 'tomasr/molokai'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Shougo/neocomplcache.vim'

" snippet
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'no1fushi/mysnippets'

" Search
NeoBundle 'thinca/vim-visualstar'
NeoBundle 'haya14busa/incsearch.vim'

" gosh
NeoBundle 'aharisu/vim_goshrepl'
NeoBundle 'aharisu/vim-gdev'

" Ruby
NeoBundle 'tpope/vim-endwise'
NeoBundle 'szw/vim-tags'
NeoBundle 'marcus/rsense'

" HTML
NeoBundle 'mattn/emmet-vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'hokaccha/vim-html5validator'

" CSS
NeoBundle 'hail2u/vim-css3-syntax'

" JavaScript
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'jiangmiao/simple-javascript-indenter'

"json
NeoBundle 'elzr/vim-json'

" Git
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'tpope/vim-fugitive'

"----------------------------------------------------------
call neobundle#end()
NeoBundleCheck

filetype plugin indent on

"---------------------------------------------------------
" plugins set

" molokai
if neobundle#is_installed('molokai')
	colorscheme molokai
	autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
	autocmd VimEnter * match FullWidthSpace /　/
endif

set t_Co=256
syntax enable

" lightline
set laststatus=2
set showmode
set showcmd

" NERDTree
if neobundle#is_installed('nerdtree')
	autocmd StdinReadPre * let s:std_in=1
	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	cnoremap nt! NERDTree
endif

" incsearch.vim
if neobundle#is_installed('incsearch.vim')
	map / <Plug>(incsearch-forward)
endif

" Rsense
if neobundle#is_installed('rsense')
	let g:rsenseHome = '/usr/local/lib/rsense-0.3'
	let g:rsenseUseOmniFunc = 1
endif

" gauche
if neobundle#is_installed('vim_goshrepl')
	cnoremap gosh GoshREPLWithBuffer
endif

" emmet
if neobundle#is_installed('emmet')
	let g:user_emmet_settings = {'variables': {'lang' : 'ja'}}
endif

" vim-json
if neobundle#is_installed('vim-json')
	let g:vim_json_syntax_conceal = 0
endif

" snippet
if neobundle#is_installed('neosnippet')
	imap <C-k>	<Plug>(neosnippet_expand_or_jump)
	smap <C-k>	<Plug>(neosnippet_expand_or_jump)
	xmap <C-k>	<Plug>(neosnippet_expand_target)
	if has('conceal')
		set conceallevel=2 concealcursor=niv
	endif
	let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/snippets/,~/.vim/bundle/mysnippets/snippets/'
endif

" multiple-cursors
if neobundle#is_installed('vim-multiple-cursors')
	let g:multi_cursor_use_default_mapping = 0
	let g:multi_cursor_start_word_key      = '<C-n>'
	let g:multi_cursor_select_all_word_key = '<A-n>'
	let g:multi_cursor_start_key           = 'g<C-n>'
	let g:multi_cursor_select_all_key      = 'g<A-n>'
	let g:multi_cursor_next_key            = '<C-n>'
	let g:multi_cursor_prev_key            = '<C-p>'
	let g:multi_cursor_skip_key            = '<C-x>'
	let g:multi_cursor_quit_key            = '<Esc>'
endif

" vim-fugitive
if neobundle#is_installed('vim-fugitive')
	set statusline+=%{fugitive#statusline()}
	cnoremap gs! Gstatus
	cnoremap ga! Gwrite
	cnoremap gc! Gcommit -m
	cnoremap gps! Git push
	cnoremap gpl! Git pull
	cnoremap gl! Git log
	cnoremap gco! Git checkout
	cnoremap gb! Git branch
	cnoremap gbd! Git branch -d
	cnoremap gr! Git reset
	cnoremap grh! Git reset --hard
	cnoremap gra! Git remote add origin
endif

" neocomplcache
if neobundle#is_installed('neocomplcache.vim')
	command Ncomp :NeoComplCacheDisable
	command Ycomp :NeoComplCacheEnable

	let g:acp_enableAtStartup = 0
	let g:neocomplcache_enable_at_startup = 1
	let g:neocomplcache_enable_smart_case = 1
	let g:neocomplcache_min_syntax_length = 3
	let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

	let g:neocomplcache_dictionary_filetype_lists = {
				\ 'default' : ''
				\ }

	inoremap <expr><C-g>     neocomplcache#undo_completion()
	inoremap <expr><C-l>     neocomplcache#complete_common_string()

	inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
	function! s:my_cr_function()
		return neocomplcache#smart_close_popup() . "\<CR>"
	endfunction
	inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
	inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
	inoremap <expr><C-y>  neocomplcache#close_popup()
	inoremap <expr><C-e>  neocomplcache#cancel_popup()
endif

