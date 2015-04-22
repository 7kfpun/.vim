" Utils {{{
" =========

    NeoBundle 'mattn/webapi-vim'

    " Interactive command execution in Vim.
    NeoBundle 'Shougo/vimproc.vim', {
                \ 'build' : {
                \     'windows' : 'tools\\update-dll-mingw',
                \     'cygwin' : 'make -f make_cygwin.mak',
                \     'mac' : 'make -f make_mac.mak',
                \     'linux' : 'make',
                \     'unix' : 'gmake',
                \    },
                \ }

    NeoBundle 'Yggdroot/indentLine'
        let g:indentLine_char = '┊'
        let g:indentLine_color_term = 239

    NeoBundle 'mileszs/ack.vim'
    if executable('ag')
        let g:ackprg = "ag --nogroup --column --smart-case --follow"
    endif
    nmap <leader>a <Esc>:Ack!

    " Edit large files quickly
    " NeoBundle 'LargeFile'

    " pseudo clipboard register for non-GUI version of Vim
    NeoBundle 'unphased/vim-fakeclip'

    " Powerful shell implemented by vim.
    NeoBundle 'Shougo/vimshell.vim'
        " nnoremap <silent> <F5> :VimShell<CR>

    " Intelligently reopen files where you left off.
    NeoBundle 'dietsche/vim-lastplace'

    " Make scrolling in Vim more pleasant.
    NeoBundle 'terryma/vim-smooth-scroll'
        noremap <silent> <c-k> :call smooth_scroll#up(&scroll/2, 0, 4)<CR>
        noremap <silent> <c-j> :call smooth_scroll#down(&scroll/2, 0, 4)<CR>
        noremap <silent> <c-u> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
        noremap <silent> <c-d> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
        " noremap <silent> <pageup> :call smooth_scroll#up(&scroll, 0, 2)<CR>
        " noremap <silent> <pagedown> :call smooth_scroll#down(&scroll, 0, 2)<CR>

    NeoBundleLazy 'junegunn/limelight.vim', {'autoload': {'commands': 'Limelight'}}
        " au VimEnter * Limelight

    " Screensavers
    NeoBundleLazy 'itchyny/screensaver.vim', {'autoload': {'commands': 'ScreenSaver'}}
        " autocmd CursorHold * ScreenSaver

    " A calendar application for Vim
    NeoBundleLazy 'itchyny/calendar.vim', {'autoload': {'commands': 'Calendar'}}

    " Maximizes and restores the current window in Vim.
    NeoBundleLazy 'szw/vim-maximizer', {'autoload': {'commands': 'MaximizerToggle'}}
        nnoremap <silent><F3> :MaximizerToggle<CR>
        vnoremap <silent><F3> :MaximizerToggle<CR>gv
        inoremap <silent><F3> <C-o>:MaximizerToggle<CR>

    " NeoBundle 'xolox/vim-misc'
    " NeoBundle 'junegunn/vim-easy-align'

    " css/less/sass/html color preview for vim.
    NeoBundle 'gorodinskiy/vim-coloresque'

    " Highlight colors in css files
    NeoBundle 'skammer/vim-css-color'

    " Add CSS3 syntax support to vim's built-in `syntax/css.vim`.
    NeoBundle 'hail2u/vim-css3-syntax'

    NeoBundle 'haya14busa/incsearch.vim'
        let g:incsearch#auto_nohlsearch = 1
        map /  <Plug>(incsearch-forward)
        map ?  <Plug>(incsearch-backward)
        map g/ <Plug>(incsearch-stay)

" }}}


" Git {{{

    " A Vim plugin which shows a git diff in the gutter (sign column) and stages/reverts hunks.
    NeoBundle 'airblade/vim-gitgutter'
    NeoBundleLazy 'airblade/vim-gitgutter', {'autoload': {'commands': 'GitGutterToggle'}}
        let g:gitgutter_sign_column_always = 1
        let g:gitgutter_enabled = 1
        " nnoremap <silent> <F9> :GitGutterToggle<CR>
        nnoremap <leader>gg :GitGutterToggle<CR>

    " a Git wrapper
    NeoBundle 'tpope/vim-fugitive'
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
    NeoBundleLazy 'idanarye/vim-merginal', {'depends': ['tpope/vim-fugitive'], 'autoload': {'commands': 'MerginalToggle'}}
        nnoremap <silent> <F10> :MerginalToggle<CR>

    " gitk for Vim
    NeoBundleLazy 'gregsexton/gitv', {'depends': ['tpope/vim-fugitive'], 'autoload':{'commands':'Gitv'}}
        nnoremap <silent> <leader>gv :Gitv<CR>
        nnoremap <silent> <leader>gV :Gitv!<CR>

    " Browse GitHub events in Vim
    NeoBundleLazy 'junegunn/vim-github-dashboard', {'autoload': {'commands': ['GHDashboard', 'GHActivity']}}

    " A powerful Git log viewer
    NeoBundleLazy 'cohama/agit.vim', {'autoload': {'commands': 'Agit'}}
        noremap <silent> <F9> :Agit<CR>

" }}}


" Edit {{{
" ========

    " Vim plugin for intensely orgasmic commenting
    NeoBundle 'scrooloose/nerdcommenter'
        let NERDSpaceDelims = 1
        let g:NERDCustomDelimiters = { 'ansible': { 'left': '#'} }

    " Vim script for text filtering and alignment
    NeoBundle 'godlygeek/tabular'

    " True Sublime Text style multiple selections for Vim
    NeoBundle 'terryma/vim-multiple-cursors'

    " visually select increasingly larger regions of text using the same
    " key combination.
    NeoBundle 'terryma/vim-expand-region'

    " The plugin provides mappings to easily delete, change and add such surroundings in pairs.
    NeoBundle 'tpope/vim-surround'

    " enable repeating supported plugin maps with "."
    NeoBundle 'tpope/vim-repeat'

    " insert or delete brackets, parens, quotes in pair
    NeoBundle 'jiangmiao/auto-pairs'

    " Turn your raw template into concated string
    NeoBundleLazy '29decibel/vim-stringify', {'autoload': {'commands': 'Stringify'}}

    " Delete unwanted whitespace at the end of lines.
    NeoBundleLazy 'vim-scripts/DeleteTrailingWhitespace', {'autoload': {'commands': 'DeleteTrailingWhitespace'}}

" }}}


" Status line {{{
" ===============

    " lean & mean statusline for vim that's light as air
    NeoBundle 'bling/vim-airline'
        " let g:airline#extensions#tabline#enabled = 1
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
    NeoBundleLazy 'scrooloose/nerdtree', {'autoload': {'commands': ['NERDTreeToggle', 'NERDTreeFind']}}
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

    NeoBundleLazy 'jistr/vim-nerdtree-tabs', {'autoload': {'commands': 'NERDTreeTabsToggle'}}
        let g:nerdtree_tabs_open_on_console_startup = 1
        map <Leader>n :NERDTreeTabsToggle<CR>

    NeoBundleLazy 'majutsushi/tagbar.git', {'autoload': {'commands': ['TagbarToggle']}}
        let g:tagbar_width = 30
        let g:tagbar_foldlevel = 1
        " let g:tagbar_autofocus = 1  " set focus to TagBar when opening it
        let g:tagbar_type_rst = {
                    \ 'ctagstype': 'rst',
                    \ 'kinds': ['r:references', 'h:headers'],
                    \ 'sort': 0,
                    \ 'sro': '..',
                    \ 'kind2scope': {'h': 'header'},
                    \ 'scope2kind': {'header': 'h'}
                    \ }
        nnoremap <silent> <F7> :TagbarToggle<CR>
        " Start TagbarToggle when vim starts up
        " au VimEnter * TagbarToggle

    " Find files
    NeoBundle 'kien/ctrlp.vim'
        let g:ctrlp_show_hidden = 1
        let g:ctrlp_dont_split = 'NERD_tree_2'
        " let g:ctrlp_map = '<leader>p'
        let g:ctrlp_map = '<c-p>'
        let g:ctrlp_custom_ignore = {
                    \ 'dir':  '\v[\/](\.git|\.hg|\.svn|\.env|\.tmp|node_modules|bower_components|vendor)$',
                    \ 'file': '\v\.(exe|so|dll)$',
                    \ 'link': 'some_bad_symbolic_links',
                    \ }

    " Generate the Task List.
    NeoBundleLazy 'JessicaKMcIntosh/TagmaTasks', {'autoload': {'commands': 'TagmaTaskToggle'}}
        let g:TagmaTasksAutoUpdate = 1
        nnoremap <silent> <leader>td :TagmaTaskToggle<CR>
        nnoremap <silent> <F8> :TagmaTaskToggle<CR>

    " Display your undo history in a graph.
    NeoBundleLazy 'mbbill/undotree', {'autoload': {'commands': 'UndotreeToggle'}}
        let g:undotree_WindowLayout = 3
        nnoremap <leader>ud :UndotreeToggle<CR>

" }}}


" Unite {{{
" =========

    " Unite and create user interfaces.
    NeoBundleLazy 'Shougo/unite.vim', {'autoload': {'commands': 'Unite'}}
        nnoremap <C-l> :Unite<CR>

    NeoBundle 'junkblocker/unite-tasklist'
    NeoBundle 'klen/unite-radio.vim'
    NeoBundle 'moznion/unite-git-conflict.vim'

" }}}


" Languages {{{
" =============

    NeoBundleLazy 'Shougo/neocomplcache.vim', {'autoload': {'insert': 1}}
        let g:neocomplcache_enable_at_startup=1
        let g:neocomplcache_enable_fuzzy_completion=1

    " NeoBundle 'scrooloose/syntastic'
    "     let g:syntastic_error_symbol = '✗'
    "     let g:syntastic_style_error_symbol = '✠'
    "     let g:syntastic_warning_symbol = '∆'
    "     let g:syntastic_style_warning_symbol = '≈'

    NeoBundleLazy 'othree/html5.vim', {'autoload': {'filetypes': ['html', 'xhtml', 'css']}}
    NeoBundleLazy 'vim-scripts/HTML-AutoCloseTag', {'autoload': {'filetypes': ['html', 'xhtml']}}
    NeoBundleLazy 'mattn/emmet-vim', {'autoload': {'filetypes': ['html', 'xhtml', 'css', 'xml', 'xls', 'markdown']}}
        au BufNewFile,BufRead *.md setf markdown

    NeoBundleLazy 'heavenshell/vim-pydocstring', {'autoload': {'filetypes': 'python'}}
    NeoBundleLazy 'klen/python-mode.git', {'autoload': {'filetypes': 'python'}}
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

    NeoBundleLazy 'davidhalter/jedi-vim', {'autoload': {'filetypes': ['python']}}
        let g:jedi#popup_on_dot=0

    NeoBundle 'ervandew/supertab'

    NeoBundleLazy 'mitsuhiko/vim-jinja', {'autoload': {'filetypes': ['jinja']}}
        au BufNewFile,BufRead *.j2 set ft=jinja
        let g:htmljinja_disable_html_upgrade = 1

    NeoBundleLazy 'chase/vim-ansible-yaml', {'autoload': {'filetypes': ['yaml', 'ansible']}}

    NeoBundleLazy 'pangloss/vim-javascript', {'autoload': {'filetypes': ['javascript']}}
    NeoBundleLazy 'heavenshell/vim-jsdoc', {'autoload': {'filetypes': ['javascript']}}
    NeoBundleLazy 'wookiehangover/jshint.vim', {'autoload': {'filetypes': ['javascript']}}
        " let g:JSLintHighlightErrorLine = 0
        let JSHintUpdateWriteOnly = 1
    NeoBundleLazy 'maksimr/vim-jsbeautify', {'autoload': {'filetypes': ['javascript']}}
        au FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>
        au FileType eruby vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
        au FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
        au FileType javascript vnoremap <buffer> <c-f> :call RangeJsBeautify()<cr>
        au BufNewFile,BufRead *.js setf javascript
        au BufNewFile,BufRead *.jsm setf javascript
        au BufNewFile,BufRead Jakefile setf javascript

    NeoBundleLazy 'leshill/vim-json', {'autoload': {'filetypes': ['javascript','json']}}

    NeoBundleLazy 'groenewege/vim-less', {'autoload': {'filetypes': 'less'}}

    " NeoBundle 'mxw/vim-jsx'

" }}}


" Unite {{{

    NeoBundle 'Shougo/unite.vim'
        nnoremap <C-l>  :Unite<CR>
    NeoBundleLazy 'thinca/vim-unite-history', {'autoload': {'unite_sources': ['history/command', 'history/search']}}
    NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload': {'unite_sources': 'colorscheme'}}
    NeoBundleLazy 'tsukkee/unite-help', {'autoload': {'unite_sources': 'help'}}

" }}}


" My utils {{{

    NeoBundleLazy '7kfpun/checkip.vim', {'autoload': {'commands': 'CheckIp'}}
    NeoBundle '7kfpun/pypi.vim'
        let g:enable_add_latest_version = 1
    " NeoBundleLazy '7kfpun/pypi.vim', {'autoload': {'commands': 'Pypi'}}

    NeoBundle '7kfpun/bing.vim'

    NeoBundle '7kfpun/finance.vim'
    set timeoutlen=10000
    autocmd FocusLost * call Finance()
        let g:finance_watchlist = ['0005.HK', '1211.HK', '1398.HK', '2318.HK', '2800.HK', '0388.HK', '1928.HK']

" }}}
