set nocompatible               " be iMproved
filetype off                   " required!

" 自动安装Vundle
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    if has('Linux')
        silent !apt-get install ctags
    endif
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" IDE
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'majutsushi/tagbar'
Bundle 'kien/ctrlp.vim'
Bundle 'fisadev/vim-ctrlp-cmdpalette'
Bundle 'tacahiroy/ctrlp-funky'
" Fugitive: Git 集成，强烈推荐！
Bundle 'tpope/vim-fugitive'
Bundle 'Xuyuanp/nerdtree-git-plugin'
Bundle 'mhinz/vim-signify'
" Tab list panel
Bundle 'kien/tabman.vim'
" Airline
Bundle 'bling/vim-airline'
Bundle 'bling/vim-bufferline'
" Python and other languages code checker
Bundle 'scrooloose/syntastic'
Bundle 'bronson/vim-trailing-whitespace'

"-----------------
" Fast navigation
"-----------------
Bundle 'Lokaltog/vim-easymotion'
" XML/HTML tags navigation
Bundle 'matchit.zip'

"--------------
" Fast editing
"--------------
" Code commenter
Bundle 'scrooloose/nerdcommenter'
" Surround
Bundle 'tpope/vim-surround'
" for repeat -> enhance surround.vim, . to repeat command
Bundle 'tpope/vim-repeat'
" 多光标编辑 (该插件的ctrl-p可以正常使用，当到达最后一个的时候ctrlp才会起作用)
Bundle 'terryma/vim-multiple-cursors'
" 自动补全单引号，双引号等
Bundle 'Raimondi/delimitMate'
Bundle 'sjl/gundo.vim'
Bundle 'godlygeek/tabular'
" Bundle 'nathanaelkane/vim-indent-guides'

" Snippets & AutoComplete
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'SirVer/ultisnips'
"Bundle 'honza/vim-snippets'
Bundle 'Shougo/neocomplete.vim.git'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
Bundle 'honza/vim-snippets'

" Go language
Bundle 'fatih/vim-go'

"  HTML&JavaScript
Bundle 'amirh/HTML-AutoCloseTag'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'gorodinskiy/vim-coloresque'
Bundle 'tpope/vim-haml'
Bundle 'mattn/emmet-vim'

"------- FPs ------
Bundle 'kien/rainbow_parentheses.vim'
" 有道翻译
Bundle 'ianva/vim-youdao-translater'

Bundle 'elzr/vim-json'
Bundle 'plasticboy/vim-markdown'

"--------------
" Color Schemes
"--------------
Bundle 'rickharris/vim-blackboard'
Bundle 'altercation/vim-colors-solarized'
Bundle 'rickharris/vim-monokai'
Bundle 'tpope/vim-vividchalk'
Bundle 'Lokaltog/vim-distinguished'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'fisadev/fisa-vim-colorscheme'
Bundle 'vim-airline/vim-airline-themes'

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

let mapleader=','

set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1 " encoding dectection

" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on

" color scheme
set background=dark
"color solarized

set tabpagemax=15               " Only show 15 tabs
set showmode                    " Display the current mode

" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tab length exceptions on some file types
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120

syntax on                      " syntax highlight on
set cursorline                 " Highlight current line
set nu 			               " show line numbers
set ls=2 		               " always show status bar
set incsearch                  " incremental search
set hlsearch                   " highlighted search results
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present

set confirm                    " prompt when existing from an unsaved file
ca w!! w !sudo tee "%"         " save as sudo
set scrolloff=3                " when scrolling, keep cursor 3 lines away from screen border
set showmatch                  " show matching bracket (briefly jump)
set showcmd                    " show typed command in status bar
set history=1000               " history
set title                      " show file in titlebar
set laststatus=2               " use 2 lines for the status bar

"取消查找高亮
nmap <silent> <leader>/ :nohlsearch<CR>

" NerdTree
"autocmd vimenter * NERDTree
map <F2> <Esc> :NERDTreeTabsToggle<CR>
"let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
"let NERDTreeChDirMode=0
"let NERDTreeQuitOnOpen=1
"let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
"let NERDTreeKeepTreeInNewTab=1
"let g:nerdtree_tabs_open_on_gui_startup=1

"设置有道翻译
map <F1> <Esc>:Ydc<CR>
""点击引导键再点y，d，可以在命令行输入要翻译的单词
noremap <leader>yd :Yde<CR>

map <leader><space> :FixWhitespace<cr>    " +space去掉末尾空格

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" " disable autofocus on tagbar open
let g:tagbar_autofocus = 0

" Airline ------------------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" ctrlp
set wildignore+=*/tmp/*,*.so,*.o,*.a,*.obj,*.swp,*.zip,*.pyc,*.pyo,*.class,.DS_Store " MacOSX/Linux
let g:ctrlp_working_path_mode = 'ra'
nnoremap <silent> <D-t> :CtrlP<CR>
nnoremap <silent> <D-r> :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }
let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
    \ 'fallback': s:ctrlp_fallback
    \ }

let g:ctrlp_extensions = ['funky']
nnoremap <Leader>fu :CtrlPFunky<Cr>

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 15
let g:neocomplete#force_overwrite_completefunc = 1


" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
\ 'default' : '',
\ 'vimshell' : $HOME.'/.vimshell_hist',
\ 'scheme' : $HOME.'/.gosh_completions'
\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings {
    " These two lines conflict with the default digraph mapping of <C-K>
    if !exists('g:spf13_no_neosnippet_expand')
        imap <C-k> <Plug>(neosnippet_expand_or_jump)
        smap <C-k> <Plug>(neosnippet_expand_or_jump)
    endif
    if exists('g:spf13_noninvasive_completion')
        inoremap <CR> <CR>
        " <ESC> takes you out of insert mode
        inoremap <expr> <Esc>   pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
        " <CR> accepts first, then sends the <CR>
        inoremap <expr> <CR>    pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
        " <Down> and <Up> cycle like <Tab> and <S-Tab>
        inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
        " Jump up and down the list
        inoremap <expr> <C-d>   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        inoremap <expr> <C-u>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
    else
        " <C-k> Complete Snippet
        " <C-k> Jump to next snippet point
        imap <silent><expr><C-k> neosnippet#expandable() ?
        \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
        \ "\<C-e>" : "\<Plug>(neosnippet_expand_or_jump)")
        smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

        inoremap <expr><C-g> neocomplete#undo_completion()
        inoremap <expr><C-l> neocomplete#complete_common_string()
        inoremap <expr><s-CR> pumvisible() ? neocomplete#smart_close_popup()."\<CR>" : "\<CR>"

        function! CleverCr()
if pumvisible()
    if neosnippet#expandable()
        let exp = "\<Plug>(neosnippet_expand)"
        return exp . neocomplete#smart_close_popup()
    else
        return neocomplete#smart_close_popup()
    endif
else
    return "\<CR>"
endif
        endfunction

        " <CR> close popup and save indent or expand snippet
        imap <expr> <CR> CleverCr()
        " <C-h>, <BS>: close popup and delete backword char.
        inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
        inoremap <expr><C-y> neocomplete#smart_close_popup()
    endif
    " <TAB>: completion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

    " Courtesy of Matteo Cavalleri

    function! CleverTab()
        if pumvisible()
return "\<C-n>"
        endif
        let substr = strpart(getline('.'), 0, col('.') - 1)
        let substr = matchstr(substr, '[^ \t]*$')
        if strlen(substr) == 0
" nothing to match on empty string
return "\<Tab>"
        else
" existing text matching
if neosnippet#expandable_or_jumpable()
    return "\<Plug>(neosnippet_expand_or_jump)"
else
    return neocomplete#start_manual_complete()
endif
        endif
    endfunction

    imap <expr> <Tab> CleverTab()

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

" Signify ------------------------------
"
" " this first setting decides in which order try to guess your current vcs
" " UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" don't put icons on the sign column (it hides the vcs status icons of signify))
let g:syntastic_enable_signs = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Golang  ==> vim-go
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
"leType go nmap <Leader>s <Plug>(go-implements)
"leType go nmap <Leader>i <Plug>(go-info)
"leType go nmap <Leader>e <Plug>(go-rename)
"leType go nmap <leader>r <Plug>(go-run)
"leType go nmap <leader>b <Plug>(go-build)
"leType go nmap <leader>t <Plug>(go-test)
"leType go nmap <Leader>gd <Plug>(go-doc)
"leType go nmap <Leader>gv <Plug>(go-doc-vertical)
"leType go nmap <leader>co <Plug>(go-coverage)

nmap <Leader>a& :Tabularize /&<CR>
vmap <Leader>a& :Tabularize /&<CR>
nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
nmap <Leader>a=> :Tabularize /=><CR>
vmap <Leader>a=> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>
nmap <Leader>a:: :Tabularize /:\zs<CR>
vmap <Leader>a:: :Tabularize /:\zs<CR>
nmap <Leader>a, :Tabularize /,<CR>
vmap <Leader>a, :Tabularize /,<CR>
nmap <Leader>a,, :Tabularize /,\zs<CR>
vmap <Leader>a,, :Tabularize /,\zs<CR>
nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
vmap <Leader>a<Bar> :Tabularize /<Bar><CR>

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gi :Git add -p %<CR>
nnoremap <silent> <leader>gg :SignifyToggle<CR>
