"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=/Users/crenwick/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('/Users/crenwick/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:

NeoBundle "jordwalke/VimCleanColors"
" =========================== Bootstrap for Vim ================================
NeoBundle "tpope/vim-sensible"
" ==============================================================================

" ======================= AutoMakeDirectory if needed ==========================
NeoBundle "jordwalke/VimAutoMakeDirectory"
" ==============================================================================

" ======================= Custom Resizing for SplitBalancer ====================
NeoBundle "git://github.com/jordwalke/VimSplitBalancer.git"
" ==============================================================================

" ================== Allow plugins to tap into repeating =======================
NeoBundle "git://github.com/tpope/vim-repeat.git"
" ==============================================================================
NeoBundle 'tpope/vim-fugitive'

" ========== Use arrow keys in block mode to move things around ================
NeoBundle "git://github.com/gavinbeatty/dragvisuals.vim.git"
vmap  <expr>  <LEFT>   DVB_Drag('left')
vmap  <expr>  <RIGHT>  DVB_Drag('right')
vmap  <expr>  <DOWN>   DVB_Drag('down')
vmap  <expr>  <UP>     DVB_Drag('up')
" vmap  <expr>  D        DVB_Duplicate() (Causes hanving on linewise visual mode)
" Remove any introduced trailing whitespace after moving..
let g:DVB_TrimWS = 1
" ==============================================================================

" ====================== Vim Surround ==========================================
NeoBundle "git://github.com/tpope/vim-surround.git"
" ==============================================================================

" =============================== Thumbnail ===================================
NeoBundle "https://github.com/itchyny/thumbnail.vim.git"
" ==============================================================================

" =============================== Better Markdown ==============================
NeoBundle "https://github.com/tpope/vim-markdown.git"
" ==============================================================================

" =========================== Unite.vim uses ===================================
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
"
NeoBundle "git://github.com/Shougo/unite.vim.git"
" source ~/.vim/pluginRc/uniteVimRc

" =================================== Closer  ==================================
" Go to Left when closing like everything else in the world
NeoBundle "jordwalke/VimCloser"
" ==============================================================================

" =============================== SmartGUITabs =================================
NeoBundle "jordwalke/MacVimSmartGUITabs"
" Make sure to have `set guioptions+=e` in your `.gvimrc`.
map <D-Cr> :SmartGUITabsToggleFullScreen<CR>
imap <D-Cr> <Esc>:SmartGUITabsToggleFullScreen<CR>
nmap <D-Cr> <Esc>:SmartGUITabsToggleFullScreen<CR>
" ==============================================================================

" =================================== NERDTree =================================
" Q : How can I open a NERDTree automatically when vim starts up if no files
" were specified?  A : NerdTreeTabs handles this
NeoBundle "https://github.com/scrooloose/nerdtree"
" source ~/.vim/pluginRc/nerdTreeVimRc
" Also see ~/.vim/nerdtree_plugin/myMappings.vim (NERDTree requires mappings
" exist there)
" ==============================================================================


" ============================= NERDTreeSideBar ================================
NeoBundle "https://github.com/jistr/vim-nerdtree-tabs"
" source ~/.vim/pluginRc/nerdTreeTabsVimRc
" ==============================================================================

" ============================ OCaml ===========================================
" Bundles installed with OPAM:
" ==============================================================================
"Merlin AutoComplete:
"Just install OCaml/OPAM
" # wget http://www.ocamlpro.com/pub/opam_installer.sh
" # sh ./opam_installer.sh /usr/local/bin 4.00.1
"
" > To find the "share_dir", do: `opam config var share`
" < /Users/jwalke/.opam/4.00.1/share
"
" Hacked ACP to support this and haxe.
if !empty(system('which opam'))
  " =================================== Merlin ================================
  let s:ocamlmerlin=substitute(system('opam config var share'),'\n$','','') . "/merlin"
  execute "set rtp+=".s:ocamlmerlin."/vim"
  execute "set rtp+=".s:ocamlmerlin."/vimbufsync"
  let g:syntastic_ocaml_checkers=['merlin']
else
  " TODO: figure out opam for windows
endif

" ==============================================================================

" =================== Web Dev Icons ===========================================
NeoBundle "https://github.com/ryanoasis/vim-webdevicons"
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
" Doesn't work
" let g:WebDevIconsUnicodeDecorateFolderNodeDefaultSymbol = ' '
" =============================================================================

" ======================= A lighterweight Powerline ============================
NeoBundle "https://github.com/jordwalke/vim-airline"
let g:airline_powerline_fonts = 1
set laststatus=2
" Disable truncation
let g:airline#extensions#default#section_truncate_width = {}
" ==============================================================================

" ============================== Smooth-Scroll =================================
NeoBundle "git://github.com/terryma/vim-smooth-scroll.git"
"Normal mode
noremap <silent> <c-u> :call smooth_scroll#up(40, 20, 6)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(40, 20, 6)<CR>

" smooth_scroll is broken in visual mode currently - unmap
vnoremap <silent> <c-u> <c-u>
vnoremap <silent> <c-d> <c-d>
" ==============================================================================

" ================================ Flatlandia ==================================
NeoBundle "git://github.com/jordwalke/flatlandia"
" ==============================================================================

" ================================= Solarized ==================================
NeoBundle "git://github.com/altercation/vim-colors-solarized"
"default value is 1
let g:solarized_underline=0
"default value is 16
let g:solarized_termcolors=256
"default value is normal
let g:solarized_contrast="high"
"default value is normal
let g:solarized_visibility="high"
" ==============================================================================

" ================================= Ctrl-p =====================================
" See ~/.gvimrc as well
NeoBundle "git://github.com/kien/ctrlp.vim.git"
" source ~/.vim/pluginRc/ctrlPVimRc
" ==============================================================================

" ============================= ACP Forked =========================
" Check out snippets in ~/.vim/personalSnippets/
NeoBundle "https://github.com/jordwalke/AutoComplPop"
let g:acp_ignorecaseOption = 1
" ==============================================================================

" ============================= UltiSnips ======================================
"See corresponding entries in `.keysVimRc`.
NeoBundle "git://github.com/SirVer/ultisnips.git"
if has('gui_win32')
  let g:UltiSnipsSnippetsDir=$HOME
  let g:UltiSnipsSnippetDirectories=["myUltiSnippets"]
else
  let g:UltiSnipsSnippetsDir="~/.vim"
  let g:UltiSnipsSnippetDirectories=["myUltiSnippets"]
endif
" ==============================================================================

" ======== Combine Previous Plugins For Modern Completion Experience ===========
NeoBundle "jordwalke/VimCompleteLikeAModernEditor"
" ==============================================================================

" ============================= Commenter ======================================
NeoBundle "https://github.com/tomtom/tcomment_vim"
" ==============================================================================

" =============================Javascript-Indent================================
" I suspect this is doing nothing since JavaScript-Indent overwrites the
" indentation hooks, but I cannot prove it.
NeoBundle "https://github.com/pangloss/vim-javascript"
" ==============================================================================

" =============================Javascript-Indent================================
NeoBundle "git://github.com/vim-scripts/JavaScript-Indent.git"
" ==============================================================================

" ================================= Less========================================
NeoBundle "git://github.com/groenewege/vim-less.git"
" ==============================================================================

" ======================= Parameter Text Objects ===============================
" ciP  (change in paramater  - changes the single argument under cursor!
NeoBundle "git://github.com/vim-scripts/Parameter-Text-Objects.git"
" ==============================================================================

" ============================ GUndo ===========================================
" Visualize a tree of your document history
NeoBundle "http://github.com/sjl/gundo.vim.git"
nnoremap <D-U> :GundoToggle<CR>
let g:gundo_close_on_revert=1
" ==============================================================================

" ========================== Undo Quit of a window =============================
NeoBundle "https://github.com/AndrewRadev/undoquit.vim"
map <D-T> <Esc>:Undoquit<CR>
" ==============================================================================

" =======================GUI File Browser like CMD+T ===========================
" NeoBundle "https://github.com/twe4ked/vim-peepopen"
" if has("gui_macvim")
"   map <D-t> <Plug>PeepOpen
" end
" ==============================================================================

NeoBundle "https://github.com/mxw/vim-jsx"

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

filetype plugin on    " Required for NeoBundle and also good.
filetype indent on    " Required for NeoBundle and also good.
if has('vim_starting')
  set nocompatible               " Be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

set noswapfile        " Don't make backups.
set nowritebackup     " Even if you did make a backup, don't keep it around.
set nobackup

syntax on             " enable syntax highlighting

set title hlsearch history=500
set smartindent
set autoindent
set mouse=a           " click tabs, drag tabs, and drag split bars
set autoread          " reload files when changed on disk, i.e. via `git checkout`
set clipboard=unnamed " yank and paste with the system clipboard
set directory-=.      " don't store swapfiles in the current directory
set expandtab         " expand tabs to spaces
set ignorecase        " case-insensitive search
set smartcase         " case-sensitive search if any caps
set incsearch         " search as you type
" set laststatus=2      " always show status
set number            " show line numbers
set ruler             " show where you are
set scrolloff=5       " show context above/below cursor line
set sidescroll=1
set shiftwidth=2      " normal mode indentation commands uses 2 spaces
set softtabstop=2     " insert mode tab and backspace uses 2 spaces
set tabstop=2         " actual tab uses 8 spaces
set showmatch         " highlight matching on {[()]}
set list              " show trailing whitespace
set listchars=""
set listchars=tab:\ \
set listchars+=trail:.
set tabpagemax=30
set showcmd           " show current command going on
set wildignore=log/**,node_modules/**,target/**,tmp/**,.meteor/**,tmp/**
set wildmenu          " show a navigable menu for tab completion
set wildmode=longest,list,full

" Mac Support bootstrap
set wildignore+=*.DS_Store
set wildignore+=*/_build**
" Remove ugly folds
set nofoldenable
" nofoldenable doesn't work in diff mode so do something similar
set diffopt=filler,context:9999
" ============= Configure as Privacy Plugin =========================
" All sensitive data is not stored in your ~/.vimrc folder
" Configure the spelling language and file.
" ================================================================
set spelllang=en
set spellfile=$HOME/vim_spell/en.utf-8.add
" UndoDir:
let s:homeFolder = $HOME
let s:undoDir = s:homeFolder . '/vimUndo'
set undofile
" " Create undo dir if needed - not in your dotVim folder! It should be local to
" " your computer.
if !isdirectory(s:undoDir)
  call mkdir(s:undoDir)
endif
execute "set undodir=".s:undoDir
" Since your file/folder history may show up in a git commit!
let g:netrw_dirhistmax=0
" ================================================================
" =========================== FIX SHELL ==========================
if &shell =~# 'fish$'
    set shell=sh
endif
" ================================================================

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
" <temporary until neobundle stops asking to hit enter for more>
if has("gui_macvim")
  set guifont=Monaco:h10
  set columns=195
endif
" </temporary until neobundle stops asking to hit enter for more>

" http://stackoverflow.com/questions/6852763/vim-quickfix-list-launch-files-in-new-tab
set switchbuf+=usetab,newtab

" persistent undo
if exists("&undodir")
  set undofile
  let &undodir=&directory
  set undolevels=500
  set undoreload=500
endif

" highlight last inserted text
nnoremap gV `[v`]

" allow buffer to be hideen within writing to disk
set hidden

let mapleader=','
" append a semicolon to the line
nnoremap <leader>; $a;<Esc>

" keyboard shortcuts
" hjkl keys navigate buffer splits
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" buffer nav shortcuts
nnoremap <leader>b :ls<CR>
nnoremap <leader>j :bn<CR>
nnoremap <leader>k :bp<CR>

" highlight the 81st character in each line
highlight MyLineTooLongMarker ctermbg=magenta guibg=Magenta
call matchadd('MyLineTooLongMarker', '\%81v', 100)

" markdown with fenced code gets marked
au BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['css', 'erb=eruby', 'javascript', 'js=javascript', 'json=javascript', 'ruby', 'sass', 'xml', 'html', 'sh']

" automatically reload vimrc when its saved
au BufWritePost .vimrc so ~/.vimrc

" open NERDTree automatically when vim starts
autocmd vimenter * NERDTree
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
" requires :Ctrl
nnoremap <leader>t :CtrlP<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>

if has("gui_running") " all this for gui use
  " ugly MacVim Cruft
  set guioptions-=r "remove scrollbars
  set guioptions-=R "remove scrollbars
  set guioptions-=l "remove scrollbars
  set guioptions-=L "remove scrollbars
  set guioptions-=T " Remove toolbars

  "========== Windows ===================================
" Shouldn't this check apply to windows in general, not just gui (want to
" include cygwin as well - but some settings don't really apply in cygwin
" windows)?
  if has("gui_win32")
    " http://unix.stackexchange.com/questions/44616/why-is-vim-creating-files-with-dos-line-endings
    " #Windwos
    set fileformats=unix,dos
    " set nobinary
    " remove tabs on Gvim - for different reasons than removing them on MacVim -
    " They do not play well with the fullscreen plugin for vim
    " https://github.com/derekmcloughlin/gvimfullscreen_win32
    set guioptions-=e
    set novisualbell     "Visual Bell Looks really ghetto on Windows GVim.
    set guioptions-=m
    set guifont=Lucida\ Console:h10.00
    " Needed to NOT break symlinks on windows! Will write to new file instead of
    " original symlinked file if you do not inclue the following line:
    " Doesn't seem to fix the issue - always go to the source when editing files!
    set backupcopy=yes
  else
    " Not has(gui_win32)
    set fileformats=unix
  endif

  "========== Mac OS X ==================================
  " Pro Tips:
  " Make sure to turn off anti-aliasing in general preferences panel.
  if has("gui_macvim") || has("gui_vimr")
    " Don't remove tabs on MacVim because VimGUITabs plugin makes them get out
    " of the way when we want them to get out of the way (in full screen mode).
    " set guioptions-=e
    " set guifont=Menlo:h12.00
    " like A CSS Reset:
    let macvim_skip_colorscheme = 1
    set transparency=0
    set fuoptions=maxvert,maxhorz
    set lines=45
    set guifont=Monaco:h10
    set columns=285
    set nolazyredraw
    " Change to `1` if your font is patched with webdev icons.
    let g:webdevicons_enable = 0
    autocmd VimEnter * exec ":set columns=85"
    autocmd VimEnter * exec ":set guifont=Inconsolata-dz\\ for\\ Powerline:h14"
    set linespace=-4

  endif
endif

" TComment
"Toggle comment
"mapping to `gc` doesn't toggle one visually selected line - only multiples.
vmap <D-/> <c-_><c-_>
vmap <D-s-/> <c-_>b
nmap <D-/> gc$

set shell=/bin/bash\ -li
