" vim: fdm=marker ts=4 sts=4 sw=4 fdl=0

scriptencoding utf-8

" detect OS {{{
" =============
    let s:is_windows = has('win32') || has('win64')
    let s:is_cygwin = has('win32unix')
    let s:is_macvim = has('gui_macvim')
"}}}


" Setup {{{
" =========

    if has('vim_starting')

        set nocompatible                           " enable vim features

        set backupdir=$HOME/.cache/vim/backup      " where to put backup files
        set backup                                 " make backup file and leave it around 
        set backupskip+=svn-commit.tmp,svn-commit.[0-9]*.tmp

        set directory=/tmp                         " where to put swap files
        let g:SESSION_DIR   = $HOME.'/.cache/vim/sessions'

        " Create directories
        if finddir(&backupdir) == ''
            silent call mkdir(&backupdir, "p")
        endif

        if finddir(g:SESSION_DIR) == ''
            silent call mkdir(g:SESSION_DIR, "p")
        endif

        " Setup Bundler {{{
        " =================

        if s:is_windows
            set rtp+=~/.vim
        endif
        set rtp+=$HOME/.vim/bundle/neobundle.vim
        let g:neobundle#types#git#clone_depth = 2
        call neobundle#begin($HOME . '/.vim/bundle')
        NeoBundleFetch 'Shougo/neobundle.vim'

        filetype plugin indent on
        syntax on

    endif

" }}}


" Options {{{
" ===========

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
    set incsearch               " While typing a search command, show where the pattern
    set ignorecase              " Ignore case in search patterns
    set smartcase               " Override the 'ignorecase' option if the search pattern contains upper case characters
    if executable('ack')
        set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
        set grepformat=%f:%l:%c:%m
    endif
    if executable('ag')
        set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
        set grepformat=%f:%l:%c:%m
    endif

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
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
    set wildignore+=*/bower_components/*,*/node_modules/*

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

    nnoremap <leader>/ :nohl<CR>

    " Common command line typos
    cmap W w
    cmap Q q"
    cmap WA wa
    cmap WAQ waq

    " Set paste
    nnoremap <F10> :set invpaste paste?<CR>
    set pastetoggle=<F10>

    " Tab Switching
    noremap <leader>1 1gt
    noremap <leader>2 2gt
    noremap <leader>3 3gt
    noremap <leader>4 4gt
    " noremap <C-1> 1gt
    " noremap <C-2> 2gt
    " noremap <C-3> 3gt
    " noremap <C-4> 4gt

    nnoremap <Leader>s :so%<CR>

    " Insert newline without entering insert mode
    nmap <Leader><CR> o<Esc>k

" }}}


" bundles.vim
source $HOME/.vim/bundles.vim


" " functions.vim
" source $HOME/.vim/functions.vim


" Project settings {{{
" ====================

" enables the reading of .vimrc, .exrc and .gvimrc in the current directory.
set exrc

" must be written at the last.  see :help 'secure'.
set secure

call neobundle#end()


" functions {{{
" =============
" set winwidth=40
" set winminwidth=40
function! SplitToggle()
    if(&winwidth == &winminwidth)
        set winwidth=999
    else
        set winwidth=60
        wincmd =
    endif
endfunc

nnoremap <leader>= :call SplitToggle()<cr>

" }}}



" " Bundle 'kshenoy/vim-signature.git'
" " Bundle 'scrooloose/syntastic'

" Bundle 'Valloric/MatchTagAlways'
" Bundle 'chrisbra/SudoEdit.vim.git'
" Bundle 'davidhalter/jedi-vim.git'
" Bundle 'ervandew/supertab'
" Bundle 'ingydotnet/yaml-vim'
" Bundle 'moll/vim-node'
" Bundle 'sukima/xmledit.git'
" Bundle 'tpope/vim-endwise'
" Bundle 'tyru/open-browser.vim'

" " Bundle 'Rykka/InstantRst'
" " Bundle 'Rykka/clickable.vim'
" " Bundle 'Rykka/riv.vim'
