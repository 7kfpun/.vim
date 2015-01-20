set nocompatible  " No compatibility with vi, enable vim features
set backupdir=$HOME/.cache/vim/backup      " where to put backup file
set backup                                 " make backup file and leave it around
set backupskip+=svn-commit.tmp,svn-commit.[0-9]*.tmp
set directory=/tmp                         " where to put swap file
let g:SESSION_DIR = $HOME.'/.cache/vim/sessions'

" Create system vim dirs
if finddir(&backupdir) == ''
    silent call mkdir(&backupdir, "p")
endif

if finddir(g:SESSION_DIR) == ''
    silent call mkdir(g:SESSION_DIR, "p")
endif

" Load Vundle for all plugins
filetype off                  " required
set rtp+=$HOME/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree.git'
Bundle 'majutsushi/tagbar.git'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'tpope/vim-surround.git'
Bundle 'tpope/vim-fugitive.git'
" Bundle 'vim-scripts/TaskList.vim.git'
Bundle 'JessicaKMcIntosh/TagmaTasks'
Bundle 'mileszs/ack.vim.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'klen/python-mode.git'
Bundle 'sjl/gundo.vim.git'
Bundle 'vim-scripts/taglist.vim.git'
Bundle 'ervandew/supertab'
Bundle 'kana/vim-fakeclip.git'
Bundle 'bling/vim-airline.git'
Bundle 'chrisbra/SudoEdit.vim.git'
Bundle 'davidhalter/jedi-vim.git'
" Bundle 'kshenoy/vim-signature.git'
" Bundle 'mattn/emmet-vim.git'
Bundle 'tyru/open-browser.vim'
" Bundle 'scrooloose/syntastic'
Bundle 'othree/html5.vim'
Bundle 'sukima/xmledit.git'
Bundle 'tpope/vim-abolish'
Bundle 'Yggdroot/indentLine'
Bundle 'vim-scripts/HTML-AutoCloseTag'
Bundle 'Valloric/MatchTagAlways'
Bundle 'pangloss/vim-javascript.git'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'heavenshell/vim-pydocstring'
Bundle 'heavenshell/vim-jsdoc'
Bundle 'jistr/vim-nerdtree-tabs'

Bundle 'ingydotnet/yaml-vim'

Bundle 'terryma/vim-multiple-cursors'

Bundle 'godlygeek/tabular'
Bundle 'moll/vim-node'
Bundle 'hallettj/jslint.vim'

Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-endwise'


let g:JSLintHighlightErrorLine = 0

" Bundle 'Rykka/InstantRst'
" Bundle 'Rykka/clickable.vim'
" Bundle 'Rykka/riv.vim'

" All of your Plugins must be added before the following line
" call vundle#end()            " required
filetype plugin indent on    " required

" Buffer options
set hidden                  " hide buffers when they are abandoned
set autoread                " auto reload changed files
set autowrite               " automatically save before commands like :next and :make

" Display options
set title                   " show file name in window title
set visualbell              " mute error bell
set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,eol:$,nbsp:~
set linebreak               " break lines by words
set winminheight=0          " minimal window height
set winminwidth=0           " minimal window width
set scrolloff=4             " min 4 symbols bellow cursor
set sidescroll=4            " ?
set sidescrolloff=10        " ?
set showcmd                 " ?
set whichwrap=b,s,<,>,[,],l,h
set completeopt=menu,preview
set infercase               " ?
set cmdheight=2             " ?

" Tab options
set autoindent              " copy indent from previous line
set smartindent             " enable nice indent
set expandtab               " tab with spaces
set smarttab                " indent using shiftwidth"
set shiftwidth=4            " number of spaces to use for each step of indent
set softtabstop=4           " tab like 4 spaces
set shiftround              " drop unused spaces

autocmd BufRead,BufNewFile *.erb set filetype=eruby

autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype eruby setlocal ts=2 sts=2 sw=2

" Backup and swap files
set history=1000            " history length
set viminfo+=h              " save history
set ssop-=blank             " dont save blank vindow
set ssop-=options           " dont save options

" Search options
set hlsearch                " Highlight search results
set ignorecase              " Ignore case in search patterns
set smartcase               " Override the 'ignorecase' option if the search pattern contains upper case characters
set incsearch               " While typing a search command, show where the pattern

" Matching characters
set showmatch               " Show matching brackets
set matchpairs+=<:>         " Make < and > match as well

" Localization
set langmenu=none            " Always use english menu
" set keymap=russian-jcukenwin " Alternative keymap
set iminsert=0               " English by default
set imsearch=-1              " Search keymap from insert mode
set spelllang=en,ru          " Languages
set encoding=utf-8           " Default encoding
set fileencodings=utf-8,cp1251,koi8-r,cp866
set termencoding=utf-8
set bomb

" Wildmenu
set wildmenu                " use wildmenu ...
set wildcharm=<TAB>
set wildignore=*.pyc        " ignore file pattern

" Undo
if has('persistent_undo')
    set undofile            " enable persistent undo
    set undodir=/tmp/       " store undofiles in a tmp dir
endif

" Folding
if has('folding')
    set foldmethod=marker   " Fold on marker
    set foldlevel=999       " High default so folds are shown to start
endif

" X-clipboard support
if has('unnamedplus')
    set clipboard+=unnamed     " enable x-clipboard
endif

" Term
if &term =~ "xterm"
    set t_Co=256            " set 256 colors
endif

colo wombat256mod  " default
" autocmd! BufEnter,BufNewFile *.html,*.vim,*xml,*.js colo mustang
" autocmd! BufLeave *.html,*.vim,*xml,*.js colo wombat256mod

let mapleader = ","

" Edit
set backspace=indent,eol,start " Allow backspace to remove indents, newlines and old text
set virtualedit=all         " on virtualedit for all modes

set confirm
set numberwidth=1              " Keep line numbers small if it's shown

" # Project settings
" enables the reading of .vimrc, .exrc and .gvimrc in the current directory.
set exrc

" must be written at the last.  see :help 'secure'.
set secure


" Personal settings
set noswapfile
set nobackup        " do not keep a backup file
set number          " show line numbers

" Quick vertical split
nnoremap <leader>w <C-w>v
" Switch splits with <C-h> & <C-l>
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Set the minimal split width
set winwidth=40
set winminwidth=40

" Using <leader>=, toggle the width of the current split. If it's set to 999, it
" takes up as much space as possible, without pushing the other ones under 60
" columns. The other option makes sure all splits are equally wide.
function! SplitToggle()
    if(&winwidth == &winminwidth)
        set winwidth=999
    else
        set winwidth=60
        wincmd =
    endif
endfunc

nnoremap <leader>= :call SplitToggle()<cr>

" Shortcut for Ack
let g:ackprg = 'ag --nogroup --nocolor --column'
nmap <leader>a <Esc>:Ack!

" Common command line typos
cmap W w
cmap Q q"

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
" Use CTRL-S for saving, also in Insert mode
nnoremap <C-S> :<C-u>Update<CR>
vnoremap <C-S> <C-C> <Esc>:Update<CR>
inoremap <C-S> <Esc>:Update<CR>

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" --- TagBar
" toggle TagBar with F8
nnoremap <silent> <F8> :TagbarToggle<CR>
" set focus to TagBar when opening it
let g:tagbar_autofocus = 1

" --- CtrlP
" Index dot files
let g:ctrlp_show_hidden = 1
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|env)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

set wildignore+=*/bower_components/*,*/node_modules/*

" --- My F functions
noremap <silent> <F2> :Gblame<CR>
noremap <silent> <F3> :TagmaTaskToggle<CR>
noremap <silent> <F6> :NERDTreeToggle<CR>
noremap <silent> <F7> :NERDTreeTabsToggle<CR>
noremap <silent> <F9> ::GitGutterToggle<CR>
" noremap <silent> <F9> :SignatureToggle<CR>
nnoremap <F10> :set invpaste paste?<CR>
set pastetoggle=<F10>
set showmode

" --- Python-mode                                
let g:pymode_breakpoint_cmd = "import ipdb; ipdb.set_trace()  # XXX BREAKPOINT"
" let g:pymode_lint_checkers = ['pylint', 'pep8', 'pep257', 'pyflakes', 'mccabe']
let g:pymode_lint_ignore = "C901,C0110,C0111"
let g:pymode_lint_sort = ['E', 'C', 'W', 'R', 'I', 'F', 'D']
let g:pymode_lint_unmodified = 1
" let g:pymode_options_max_line_length = 99
let g:pymode_rope_lookup_project = 0
let g:pymode_syntax_highlight_equal_operator = 0
let g:pymode_debug = 1
" let g:pymode_python = 'python3'

" Split screen when vim starts up
" au VimEnter * vsplit

" Start NERDTree when vim starts up
autocmd VimEnter * NERDTree

" Set indent line
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239

" --- NERDTree
" files/dirs to ignore in NERDTree
let NERDTreeIgnore=['\~$', '\.AppleDouble$', '\.beam$', 'build$',
\'dist$', '\.DS_Store$', '\.egg$', '\.egg-info$', '\.la$',
\'\.lo$', '\.\~lock.*#$', '\.mo$', '\.o$', '\.pt.cache$',
\'\.pyc$', '\.pyo$', '__pycache__$', '\.Python$', '\..*.rej$',
\'\.rej$', '\.ropeproject$', '\.svn$', '\.tags$' ]
let g:nerdtree_tabs_open_on_console_startup = 1

" --- NERDCommenter
let NERDSpaceDelims = 1
let g:NERDCustomDelimiters = { 'ansible': { 'left': '#'} }

" --- jsbeautify
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType eruby vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

" --- airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'
