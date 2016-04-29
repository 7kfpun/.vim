call plug#begin('~/.vim/plugged')

" Utils {{{
" =========

    " Vim interface to Web API
    Plug 'mattn/webapi-vim'

    Plug 'Yggdroot/indentLine'
        let g:indentLine_char = '┊'
        let g:indentLine_color_term = 239

    " Vim plugin for the Perl module / CLI script 'ack'
    Plug 'mileszs/ack.vim'
    if executable('ag')
        let g:ackprg = "ag --nogroup --column --smart-case --follow"
    endif
    nmap <leader>a <Esc>:Ack!

    " An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
    Plug 'dyng/ctrlsf.vim'
    nmap     <c-f>f <Plug>CtrlSFPrompt
    vmap     <c-f>f <Plug>CtrlSFVwordPath
    vmap     <c-f>F <Plug>CtrlSFVwordExec
    nmap     <c-f>n <Plug>CtrlSFCwordPath
    nmap     <c-f>p <Plug>CtrlSFPwordPath
    nnoremap <c-f>o :CtrlSFOpen<CR>
    nnoremap <c-f>t :CtrlSFToggle<CR>
    inoremap <c-f>t <Esc>:CtrlSFToggle<CR>

    " Edit large files quickly
    " Plug 'LargeFile'

    " pseudo clipboard register for non-GUI version of Vim
    Plug 'unphased/vim-fakeclip'

    " Powerful shell implemented by vim.
    Plug 'Shougo/vimshell.vim'
        " nnoremap <silent> <F5> :VimShell<CR>

    " Intelligently reopen files where you left off.
    Plug 'dietsche/vim-lastplace'

    " Make scrolling in Vim more pleasant.
    Plug 'terryma/vim-smooth-scroll'
        noremap <silent> <c-k> :call smooth_scroll#up(&scroll/2, 0, 4)<CR>
        noremap <silent> <c-j> :call smooth_scroll#down(&scroll/2, 0, 4)<CR>
        noremap <silent> <c-u> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
        noremap <silent> <c-d> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
        " noremap <silent> <pageup> :call smooth_scroll#up(&scroll, 0, 2)<CR>
        " noremap <silent> <pagedown> :call smooth_scroll#down(&scroll, 0, 2)<CR>

    " Hyperfocus-writing in Vim
    Plug 'junegunn/limelight.vim', {'on': 'Limelight'}
        " au VimEnter * Limelight

    " A calendar application for Vim
    Plug 'itchyny/calendar.vim', {'on': 'Calendar'}
        let g:calendar_first_day = 'sunday'

    " Maximizes and restores the current window in Vim.
    Plug 'szw/vim-maximizer', {'on': 'MaximizerToggle'}
        nnoremap <silent><F3> :MaximizerToggle<CR>
        vnoremap <silent><F3> :MaximizerToggle<CR>gv
        inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

    " A Vim alignment plugin
    Plug 'junegunn/vim-easy-align'

    " css/less/sass/html color preview for vim.
    Plug 'gorodinskiy/vim-coloresque'

    " Highlight colors in css files
    Plug 'skammer/vim-css-color'

    " Add CSS3 syntax support to vim's built-in `syntax/css.vim`.
    Plug 'hail2u/vim-css3-syntax'

    " Highlight lines or patterns of interest in different colors.
    Plug 'vim-scripts/highlight.vim'

" }}}


" Git {{{
" =======

    " A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks.
    Plug 'airblade/vim-gitgutter', {'on': 'GitGutterToggle'}
        let g:gitgutter_sign_column_always = 1
        let g:gitgutter_enabled = 1
        " nnoremap <silent> <F9> :GitGutterToggle<CR>
        nnoremap <leader>gg :GitGutterToggle<CR>

    " a Git wrapper
    Plug 'tpope/vim-fugitive'
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
        nnoremap <silent> <leader>gw :Gwrite<CR>
        nnoremap <silent> <leader>gr :Gremove<CR>
        au BufReadPost fugitive://* set bufhidden=delete

    " Fugitive extension to manage and merge Git branches
    Plug 'idanarye/vim-merginal' | Plug 'tpope/vim-fugitive', {'on': 'MerginalToggle', 'branch': 'develop'}
        nnoremap <silent> <C-F9> :MerginalToggle<CR>

    " gitk for Vim
    Plug 'gregsexton/gitv' | Plug 'tpope/vim-fugitive', {'on':'Gitv'}
        nnoremap <silent> <leader>gv :Gitv<CR>
        nnoremap <silent> <leader>gV :Gitv!<CR>

    " Browse GitHub events in Vim
    Plug 'junegunn/vim-github-dashboard', {'on': ['GHDashboard', 'GHActivity']}

    " A powerful Git log viewer
    Plug 'cohama/agit.vim', {'on': 'Agit'}
        noremap <silent> <F9> :Agit<CR>

    " Another git manipulation plugin; An alternative of vim-fugitive.
    Plug 'lambdalisue/vim-gita', {'on': 'Gita'}

" }}}


" Edit {{{
" ========

    " Vim plugin to sort python imports using isort
    Plug 'fisadev/vim-isort', {'for': 'python'}
        nnoremap <C-i> :Isort<CR>

    " Vim plugin for intensely orgasmic commenting
    Plug 'scrooloose/nerdcommenter'
        let NERDSpaceDelims = 1
        let g:NERDCustomDelimiters = { 'ansible': { 'left': '#'} }

    " Vim script for text filtering and alignment
    Plug 'godlygeek/tabular'

    " True Sublime Text style multiple selections for Vim
    Plug 'terryma/vim-multiple-cursors'

    " visually select increasingly larger regions of text using the same
    " key combination.
    Plug 'terryma/vim-expand-region'

    " The plugin provides mappings to easily delete, change and add such surroundings in pairs.
    Plug 'tpope/vim-surround'

    " enable repeating supported plugin maps with "."
    Plug 'tpope/vim-repeat'

    " insert or delete brackets, parens, quotes in pair
    Plug 'jiangmiao/auto-pairs'

    " Turn your raw template into concated string
    Plug '29decibel/vim-stringify', {'on': 'Stringify'}

    " Delete unwanted whitespace at the end of lines.
    Plug 'vim-scripts/DeleteTrailingWhitespace', {'on': 'DeleteTrailingWhitespace'}

" }}}


" Status line {{{
" ===============

    " lean & mean statusline for vim that's light as air
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
        let g:airline#extensions#tabline#enabled = 1
        let g:airline_detect_iminsert = 1
        let g:airline_left_sep = ''
        let g:airline_right_sep = ''
        let g:airline_theme = 'wombat'
        function! AirlineInit()
            let g:airline_section_y = airline#section#create(['ffenc', '%{strftime("%H:%M")}'])
        endfunction
        autocmd VimEnter * call AirlineInit()

" }}}


" Tools {{{
" ==========

    " A tree explorer plugin for vim.
    Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
        let g:NERDTreeWinSize = 30
        let g:NERDTreeIgnore = ['\~$', '\.AppleDouble$', '\.beam$', 'build$',
                    \'dist$', '\.DS_Store$', '\.egg$', '\.egg-info$', '\.la$',
                    \'\.lo$', '\.\~lock.*#$', '\.mo$', '\.o$', '\.pt.cache$',
                    \'\.pyc$', '\.pyo$', '__pycache__$', '\.Python$', '\..*.rej$',
                    \'\.rej$', '\.ropeproject$', '\.svn$', '\.tags$']
        nnoremap <silent> <F6> :NERDTreeToggle<CR>
        nnoremap <silent> <leader>t :NERDTreeToggle<CR>
        nnoremap <silent> <leader>f :NERDTreeFind<CR>

        " Start NERDTree when vim starts up
        au VimEnter * NERDTreeToggle

    Plug 'jistr/vim-nerdtree-tabs', {'on': 'NERDTreeTabsToggle'}
        let g:nerdtree_tabs_open_on_console_startup = 1
        " map <Leader>n :NERDTreeTabsToggle<CR>

    " Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
    "     let g:tagbar_width = 30
    "     let g:tagbar_foldlevel = 1
    "     " let g:tagbar_autofocus = 1  " set focus to TagBar when opening it
    "     let g:tagbar_type_rst = {
    "                 \ 'ctagstype': 'rst',
    "                 \ 'kinds': ['r:references', 'h:headers'],
    "                 \ 'sort': 0,
    "                 \ 'sro': '..',
    "                 \ 'kind2scope': {'h': 'header'},
    "                 \ 'scope2kind': {'header': 'h'}
    "                 \ }
    "     nnoremap <silent> <C-F6> :TagbarToggle<CR>
    "     " Start TagbarToggle when vim starts up
    "     " au VimEnter * TagbarToggle

    " Find files
    Plug 'kien/ctrlp.vim'
        let g:ctrlp_show_hidden = 1
        let g:ctrlp_dont_split = 'NERD_tree_2'
        " let g:ctrlp_map = '<leader>p'
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_custom_ignore = {
                    \ 'dir':  '\v[\/](\.git|\.hg|\.svn|\.env|\.tmp|node_modules|bower_components|vendor)$',
                    \ 'file': '\v\.(exe|so|dll)$',
                    \ 'link': 'some_bad_symbolic_links',
                    \ }

    " Jump to a function via ctrlp.vim interface
    Plug 'tacahiroy/ctrlp-funky'
        nnoremap <Leader>fu :CtrlPFunky<Cr>
        " narrow the list down with a word under cursor
        nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

    " Generate the Task List.
    Plug 'JessicaKMcIntosh/TagmaTasks', {'on': 'TagmaTaskToggle'}
        let g:TagmaTasksAutoUpdate = 1
        nnoremap <silent> <leader>td :TagmaTaskToggle<CR>
        nnoremap <silent> <F8> :TagmaTaskToggle<CR>

    " Display your undo history in a graph.
    Plug 'mbbill/undotree', {'on': 'UndotreeToggle'}
        let g:undotree_WindowLayout = 3
        nnoremap <leader>ud :UndotreeToggle<CR>

" }}}


" Languages {{{
" =============

    " Plug 'Shougo/neocomplcache.vim'
    "     let g:neocomplcache_enable_at_startup=1
    "     let g:neocomplcache_enable_fuzzy_completion=1

    Plug 'scrooloose/syntastic'
        let g:loaded_syntastic_python_flake8_checker = 0
        let g:loaded_syntastic_python_frosted_checker = 0
        let g:loaded_syntastic_python_mypy_checker = 0
        let g:loaded_syntastic_python_pep257_checker = 0
        let g:loaded_syntastic_python_pep8_checker = 0
        let g:loaded_syntastic_python_prospector_checker = 0
        let g:loaded_syntastic_python_py3kwarn_checker = 0
        let g:loaded_syntastic_python_pyflakes_checker = 0
        let g:loaded_syntastic_python_pylama_checker = 0
        let g:loaded_syntastic_python_pylint_checker = 0
        let g:loaded_syntastic_python_python_checker = 0
        let g:syntastic_javascript_checkers = ['jscs']
    "     let g:syntastic_error_symbol = '✗'
    "     let g:syntastic_style_error_symbol = '✠'
    "     let g:syntastic_warning_symbol = '∆'
    "     let g:syntastic_style_warning_symbol = '≈'
        let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
        let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go']}

    " Plug 'othree/html5.vim', {'for': ['html', 'xhtml', 'css']}
    " Plug 'vim-scripts/HTML-AutoCloseTag', {'for': ['html', 'xhtml']}
    Plug 'mattn/emmet-vim', {'for': ['html', 'xhtml', 'css', 'xml', 'xls', 'markdown']}
        au BufNewFile,BufRead *.md setf markdown

    Plug 'heavenshell/vim-pydocstring', {'for': 'python'}
    Plug 'klen/python-mode', {'for': 'python', 'branch': 'develop'}
        " C901 is too complex
        " C0110 Exported classes should have docstrings.
        " C0111 Missing docstring.
        let g:pymode_breakpoint_cmd = "import ipdb; ipdb.set_trace()  # XXX BREAKPOINT"
        let g:pymode_lint_checkers = ['pep8', 'pep257', 'pyflakes', 'mccabe']
        let g:pymode_lint_ignore = 'D100,C901,C0110,C0111'
        let g:pymode_lint_sort = ['E', 'C', 'W', 'R', 'I', 'F', 'D']
        let g:pymode_lint_unmodified = 1
        let g:pymode_options_max_line_length = 120
        let g:pymode_rope = 0
        let g:pymode_rope_lookup_project = 0
        let g:pymode_syntax_highlight_equal_operator = 0
        " let g:pymode_python = 'python3'

    Plug 'davidhalter/jedi-vim', {'for': 'python'}
        let g:jedi#popup_on_dot=0

    Plug 'ervandew/supertab'

    Plug 'mitsuhiko/vim-jinja', {'for': 'jinja'}
        au BufNewFile,BufRead *.j2 set ft=jinja
        let g:htmljinja_disable_html_upgrade = 1

    Plug 'chase/vim-ansible-yaml', {'for': ['yaml', 'ansible']}

    Plug 'pangloss/vim-javascript', {'for': 'javascript'}
    " Plug 'heavenshell/vim-jsdoc', {'for': 'javascript'}
    " Plug 'wookiehangover/jshint.vim', {'for': 'javascript'}
    "     " let g:JSLintHighlightErrorLine = 0
    "     let JSHintUpdateWriteOnly = 1
    Plug 'maksimr/vim-jsbeautify', {'for': 'javascript'}
        au FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
        au FileType eruby vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
        au FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
        au FileType javascript vnoremap <buffer> <c-f> :call RangeJsBeautify()<cr>
        au BufNewFile,BufRead *.js setf javascript
        au BufNewFile,BufRead *.jsm setf javascript
        au BufNewFile,BufRead Jakefile setf javascript

    Plug 'leshill/vim-json', {'for': ['javascript', 'json']}

    Plug 'groenewege/vim-less', {'for': 'less'}

    " Plug 'mxw/vim-jsx'

    " Go development plugin for Vim
    Plug 'fatih/vim-go'
        let g:go_bin_path = "/usr/local/opt/go/bin"
        let g:go_fmt_command = "goimports"  " format with goimports instead of gofmt
        let g:go_fmt_autosave = 0  " disable fmt on save
        let g:go_highlight_functions = 1
        let g:go_highlight_methods = 1
        let g:go_highlight_structs = 1
        let g:go_highlight_interfaces = 1
        let g:go_highlight_operators = 1
        let g:go_highlight_build_constraints = 1
        au BufRead,BufNewFile *.go set filetype=go

" }}}


" Unite {{{
" =========

    " " Unite and create user interfaces.
    " Plug 'Shougo/unite.vim', {'on': 'Unite'}
    "     nnoremap <C-l> :Unite<CR>

    " Plug 'junkblocker/unite-tasklist'
    " Plug 'moznion/unite-git-conflict.vim'
    " Plug 'thinca/vim-unite-history', {'autoload': {'unite_sources': ['history/command', 'history/search']}}
    " Plug 'ujihisa/unite-colorscheme', {'autoload': {'unite_sources': 'colorscheme'}}
    " Plug 'tsukkee/unite-help', {'autoload': {'unite_sources': 'help'}}

" }}}


" My utils {{{
" ============

    Plug '7kfpun/checkip.vim', {'on': 'CheckIp'}
    Plug '7kfpun/pypi.vim'
        let g:enable_add_latest_version = 1
    " Plug '7kfpun/pypi.vim', {'on': 'Pypi'}

    Plug '7kfpun/bing.vim'

    Plug '7kfpun/finance.vim'

" }}}


" Add plugins to &runtimepath
call plug#end()
