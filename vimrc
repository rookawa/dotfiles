set nocompatible " not vi compatible

call plug#begin('~/.vim/plugged')

" NERDTree: directory tree viewer
"
Plug 'preservim/nerdtree'
"
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$', '__pycache__']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let NERDTreeShowBookmarks=0
let NERDTreeCaseSensitiveSort = 1
"
map <F9> :NERDTreeToggle <CR>

" UltiSnips: snippets engine
"
" Use ultisnips if your Vim has Python support,
" otherwise you can use SnipMate ('garbas/vim-snipmate').
"
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
"
nnoremap <Leader>se :UltiSnipsEdit<cr>

" YouCompleteMe: code-completion engine
"
" Compiling YCM with semantic support for Go and JavaScript:
" see https://github.com/Valloric/YouCompleteMe for more languages.
" $ cd ./plugged/YouCompleteMe
" $ ./install.py --go-completer --ts-completer
"
Plug 'Valloric/YouCompleteMe'
"
let g:ycm_dont_warn_on_startup = 0
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_filetype_blacklist = {}
"
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" Supertab: enhanced tab behavior based on context
"
Plug 'ervandew/supertab'
"
" make YCM compatible with UltiSnips (using supertab)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

" Syntastic: syntax checking
"
Plug 'vim-syntastic/syntastic'
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = {
	\ "mode": "active",
    \ "active_filetypes": ["py", "go"],
	\ "passive_filetypes": [] }
"
map <Leader>s :SyntasticCheck <CR>
map <Leader>t :SyntasticToggleMode <CR>
"
" Python Linter
let g:syntastic_python_checkers = ['pyflakes', 'pep8']

" NERD Commenter:
"
Plug 'preservim/nerdcommenter'
"
map <Leader>/ ,ccj

" Git:
"
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Tagbar:
"
" You need to install ctags and gotags, see
" https://github.com/majutsushi/tagbar/wiki
Plug 'majutsushi/tagbar'
"
map <F8> :TagbarToggle<CR>

" Golang:
"
Plug 'fatih/vim-go'
"
" Vim-go Syntax Highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"
" Enable goimports
let g:go_fmt_command = "goimports"
"
" Go Linter
let g:go_list_type = "quickfix"
"
" Mappings
au FileType go nmap <leader>gr <Plug>(go-run)
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <Leader>gds <Plug>(go-def-split)
au FileType go nmap <Leader>gdv <Plug>(go-def-vertical)
au FileType go nmap <Leader>gdt <Plug>(go-def-tab)
au FileType go nmap <Leader>ggd <Plug>(go-doc)
au FileType go nmap <Leader>ggv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>ggb <Plug>(go-doc-browser)
au FileType go nmap <Leader>gs <Plug>(go-implements)
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <Leader>gm <Plug>(go-rename)

" HTML Editing
Plug 'gregsexton/MatchTag'

" Plugins for Hashicorp tools
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-vaultproject'

" Yaml Syntax
"
Plug 'stephpy/vim-yaml'

" GPG support
Plug 'jamessan/vim-gnupg'

Plug '/usr/local/opt/fzf'

" OneDark Theme
Plug 'joshdick/onedark.vim'

" Vim polyglot
Plug 'sheerun/vim-polyglot'

" Vim-airline onedark
Plug 'vim-airline/vim-airline'
let g:airline_theme='onedark'

" Initialize plugin system
call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

colorscheme onedark

"---------------------
" Basic editing config
"---------------------
set shortmess+=I " disable startup message
set nu " number lines
set rnu " relative line numbering
set incsearch " incremental search (as string is being typed)
set hls " highlight search
set listchars=tab:>>,nbsp:~ " set list to see tabs and non-breakable spaces
set lbr " line break
set ruler " show current position in file
set scrolloff=5 " show lines above and below cursor (when possible)
set noshowmode " hide mode
set laststatus=2
set showcmd " show current command
set backspace=indent,eol,start " allow backspacing over everything
set timeout timeoutlen=1000 ttimeoutlen=100 " fix slow O inserts
set lazyredraw " skip redrawing screen in some cases
set autochdir " automatically set current directory to directory of last opened file
set hidden " allow auto-hiding of edited buffers
set history=8192 " more history
set nojoinspaces " suppress inserting two spaces between sentences
" use 4 spaces instead of tabs during formatting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
" smart case-sensitive search
set ignorecase
set smartcase
" tab completion for files/bufferss
set wildmode=longest,list
set wildmenu
set mouse+=a " enable mouse mode (scrolling, selection, etc)
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

"------------------
" Syntax and indent
"------------------
syntax on " turn on syntax highlighting
set showmatch " show matching braces when text indicator is over them

"--------------------
" Misc configurations
"--------------------

" unbind keys
map <C-a> <Nop>
map <C-x> <Nop>
nmap Q <Nop>

" disable audible bell
set noerrorbells visualbell t_vb=

" open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" toggle relative numbering
nnoremap <C-n> :set rnu!<CR>

" save read-only files
command -nargs=0 Sudow w !sudo tee % >/dev/null

"---------------------
" Plugin configuration
"---------------------

" markdown
let g:markdown_fenced_languages = [
    \ 'bash=sh',
    \ 'c',
    \ 'coffee',
    \ 'erb=eruby',
    \ 'javascript',
    \ 'json',
    \ 'perl',
    \ 'python',
    \ 'ruby',
    \ 'yaml',
    \ 'go',
\]

"---------------------
" Local customizations
"---------------------

" local customizations in ~/.vimrc_local
let $LOCALFILE=expand("~/.vimrc_local")
if filereadable($LOCALFILE)
    source $LOCALFILE
endif