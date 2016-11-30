call plug#begin()

source $HOME/.vim/bundlesNeoVimRc

call plug#end()

" -----------------------------------------------------
" General
" -----------------------------------------------------

set nocompatible      " not compatible with vi
set autoread          " reload files when changed on disk

let mapleader = "\<Space>"
let g:mapleader = "\<Space>"

set title             " Set terminal title
set ruler             " Show where you are
set history=500

" Tab control
set softtabstop=2     " insert mode tab and backspace uses 2 spaces
set shiftwidth=2      " normal mode indentation commands uses 2 spaces
set expandtab         " expand tabs to spaces
set tabstop=2         " actual tab uses 8 spaces

set mouse=a           " click tabs, drag tabs, and drag split bars
set clipboard=unnamed " yank and paste with the system clipboard

set directory-=.      " don't store swapfiles in the current directory
set list              " show trailing whitespace
set listchars=""
set listchars=tab:\ \
set listchars+=trail:.
set tabpagemax=30
set showcmd           " show current command going on

" Code folding settings
set foldmethod=indent
set nofoldenable      " Remove ugly folds
set diffopt=filler,context:9999 "nofold in diff mode

set inccommand=split

" -----------------------------------------------------
" User Interface
" -----------------------------------------------------

set wildmenu          " enhanced command line completion
set wildmode=list:longest,full
set wildignore=log/**,target/**
set wildignore+=*.DS_Store
set wildignore+=*/_build**
set wildignore+=*/node_modules/**
set wildignore+=target/**
set wildignore+=tmp/**
set wildignore+=.meteor/local/**
set hidden            " allow buffer to be hidden when writing to disk
set scrolloff=5       " show context above/below cursor line
set shell=$SHELL

" Searching
set ignorecase        " case-insensitive search
set smartcase         " case-sensitive search if any caps
set hlsearch
set incsearch         " search as you type

set showmatch         " highlight matching on {[()]}
set mat=2             " how many tenths of a second to blink

" Error bells
set noerrorbells
set visualbell

syntax on             " enable syntax highlighting

" set es to javascript syntax
au BufNewFile,BufReadPost *.es6 set filetype=javascript
au BufNewFile,BufReadPost *.json set filetype=javascript
au BufRead,BufNewFile *.bash_profile set filetype=sh
au BufRead,BufNewFile Fastfile set filetype=ruby

" Theme
set encoding=utf8
let base16colorspace=256
set t_Co=256          " explicitly tell vim the terminal supports 256
set background=dark
colorscheme spacegray

set number            " show the current line number

set autoindent        " automatically set indent of new line
set smartindent

" highlight the 80st character in each line
highlight MyLineTooLongMarker ctermbg=magenta guibg=Magenta
autocmd WinEnter * match MyLineTooLongMarker '\%81v'

" -----------------------------------------------------
" Files, backups and undo
" -----------------------------------------------------
set noswapfile        " Don't make backups.
set nowritebackup     " Even if you did make a backup, don't keep it around.
set nobackup

" -----------------------------------------------------
" Statusline
" -----------------------------------------------------

set laststatus=2      " show the status line all the time

" -----------------------------------------------------
" Mappings
" -----------------------------------------------------

" hjkl keys navigate buffer splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" to save all files
nnoremap <Leader>w :wa<CR>

" enter visual line mode
nmap <Leader><Leader> V

" Get rid of trailing whitespace
nnoremap <Leader>WS :%s/\s\+$//<CR>

" buffer nav shortcuts
nnoremap <leader>b :ls<CR>
nnoremap <leader>H :bn<CR>
nnoremap <leader>L :bp<CR>

" nvim-terminal-emulator
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" -----------------------------------------------------
" Plugins
" -----------------------------------------------------

" :Neomake
let g:neomake_error_sign = {
    \ 'text': '💩',
    \ 'texthl': 'ErrorMsg',
    \ }

let g:neomake_warning_sign = {
    \ 'text': '😷',
    \ 'texthl': 'WarningMsg',
    \ }
hi WarningMsg ctermfg=3 ctermbg=18
hi ErrorMsg ctermfg=1 ctermbg=18
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']
autocmd! BufWritePost * Neomake

" :ultisnips
let g:UltiSnipsSnippetsDir=$HOME . '/.vim'
let g:UltiSnipsSnippetDirectories=['myUltiSnippets']

" :TComment
vmap <Leader>c <c-_><c-_>
vmap <Leader>C <c-_>b
" mapping to `gc` doesn't toggle one visually selected line - only multiples.
nmap <D-/> gc$

" :dragvisuals
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
let g:DVB_TrimWS = 1  " Remove any introduced trailing whitespace after moving

" :AutoComplPop
let g:acp_ignorecaseOption = 1

" :fugitive
nnoremap <leader>gs :Gstatus<CR>

" :vim-jsx
let g:jsx_ext_required = 0

" :VimJSDocSnippets
let g:JSDocSnippetsMapping='<D-C>'

" :rainbow_parentheses
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
augroup rainbow_js
  autocmd!
  autocmd FileType javascript,js,jsx,es6 RainbowParentheses
augroup END

" :NERDTree
let g:NERDTreeDirArrows = 1 " nice arrow
let g:NERDTreeMinimalUI = 1 " not so much cruft
let g:NERDTreeShowBookmarks = 1
hi def link NERDTreeRO Normal
hi def link NERDTreePart StatusLine
hi def link NERDTreeDirSlash Directory
hi def link NERDTreeCurrentNode Search
hi def link NERDTreeCWD Normal
let g:NERDChristmasTree = 0 " Not so much color

" :NERDTreeTabs
nnoremap <leader>d :NERDTreeTabsToggle<CR>
nnoremap <leader>f :NERDTreeTabsFind<CR>
" don't auto open NERDTree
let g:nerdtree_tabs_open_on_gui_startup = 1

" :CtrlP
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
noremap <C-h> <C-w>h

" :deoplete
let g:deoplete#enable_at_startup = 1
