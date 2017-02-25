if v:progname =~? "evim"
  finish
endif

set nocompatible              " be iMproved, required
filetype off                  " required

" Create directories if not exist
"if !isdirectory(expand("~/.vim/"))
"    call mkdir($HOME . "/.vim")
"    if !isdirectory(expand("~/.vim/.backup"))
"        call mkdir($HOME . "/.vim/.backup")
"    endif
"    if !isdirectory(expand("~/.vim/.swp"))
"        call mkdir($HOME . "/.vim/.swp")
"    endif
"    if !isdirectory(expand("~/.vim/.undo"))
"       call mkdir($HOME . "/.vim/.undo")
"    endif
"    if !isdirectory(expand("~/.vim/bundle"))
"        call mkdir($HOME . "/.vim/bundle")
"    endif
"endif

set title

set ttyfast                   " Improves smoothness of redrawing
set lazyredraw                " no redraw during macros (perf)


" Configure default tabs
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab                 " Use spaces instead of tabs

" Tab completion settings
set wildmenu                  " Enable wild menus
set wildmode=longest:full,full
"set wildmode=list:longest     " Wildcard matches show a list, matching the longest first
set wildignore+=.git,.hg,.svn " Ignore version control repos
set wildignore+=*.o           " Ignore C compiled files
set wildignore+=*.6           " Ignore Go compiled files
set wildignore+=*.pyc,*.pyo   " Ignore Python object and compiled files
set wildignore+=*.rbc         " Ignore Rubinius compiled files
set wildignore+=*.DS_Store    " Ignore OSX attribute files
set wildignore+=*.bak         " Ignore vim backups
set wildignore+=*.swp         " Ignore vim swap files
set wildignore+=*.zip         " Ignore zip files

" Except for Makefiles: Hard tabs of width 2
autocmd FileType make set ts=4
" And Markdown
autocmd FileType mkd set sw=4
autocmd FileType mkd set sts=4
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.cql set filetype=cql
" And Java
autocmd FileType java set sw=2


set ruler           " Always show current possition
set number          " Show line numbers
set hidden		    " Hide buffers when they are abandoned

" Setup indent options
set autoindent
set smartindent
set cindent

set showcmd		    " Show (partial) command in status line.
set showmatch		" Show matching brackets.

" Search settings
set hlsearch
set incsearch		" Incremental search
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching

set mousem=popup
"set mouse=a		" Enable mouse usage (all modes)
"set mousehide		" Hide the mouse when typing text

" Default to Unix LF line endings
set ffs=unix

" Folding
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=20

" filetype specific folding
let g:vim_markdown_folding_disabled=1 " Markdown
let javaScript_fold=1                 " JavaScript
let ruby_fold=1                       " Ruby
let sh_fold_enabled=1                 " sh
let vimsyn_folding='af'               " Vim script
let xml_syntax_folding=1              " XML


" Backup settings
set autowrite		" Automatically save before cmd like :next and :make
set backup

set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//

" Set default window size
set lines=30
set columns=84

" Set nice colors
set t_Co=256                      " use 256 colors

" background for normal text is light grey
" Text below the last line is darker grey
" Cursor is green, Cyan when ":lmap" mappings are active
" Constants are not underlined but have a slightly lighter background
if has('gui_running')
    highlight Normal guibg=white
    highlight Cursor guibg=Green guifg=NONE
    highlight lCursor guibg=Cyan guifg=NONE
    highlight NonText guibg=grey90
    highlight Constant gui=NONE guibg=grey95
    highlight Special gui=NONE guibg=grey95

    set guifont=Monospace\ 12
endif

"----------------------------------------------------------------------
" Key Mappings
"----------------------------------------------------------------------
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
cmap <C-v> <C-r>+

" Make moving around works well in multi lines
nmap <silent> j gj
nmap <silent> k gk

" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>

" Remap q record command to ,q
noremap <Leader>q q
noremap q <Nop>

" Command to write as root if we dont' have permission
cmap w!! %!sudo tee > /dev/null %

" Remap a key sequence in insert mode to kick me out to normal
" mode. This makes it so this key sequence can never be typed
" again in insert mode, so it has to be unique.
inoremap jj <esc>

" For when you forget to sudo... Really Write the file.
if !has("gui_running")
    command! W w !sudo tee % > /dev/null
endif


syntax on

"----------------------------------------------------------------------
" Plugins
"----------------------------------------------------------------------
" let Vundle manage Vundle, required
if isdirectory(expand("~/.vim/bundle/Vundle.vim"))
    " set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    " https://github.com/VundleVim/Vundle.vim
    Plugin 'VundleVim/Vundle.vim'

    " vim-pandoc: https://github.com/vim-pandoc/vim-pandoc
    Plugin 'vim-pandoc/vim-pandoc'
    Plugin 'vim-pandoc/vim-pandoc-syntax'

    " https://github.com/docker/docker/contrib/syntax/vim
    "Plugin 'docker/docker' , {'rtp': '~/.vim/bundle/Dockerfile.vim'}
    Plugin 'ekalinin/Dockerfile.vim'

    " https://github.com/chase/vim-ansible-yaml.git
    "Plugin 'chase/vim-ansible-yaml'
    " https://github.com/pearofducks/ansible-vim
    Plugin 'pearofducks/ansible-vim'

    " All of your Plugins must be added before the following line
    call vundle#end()            " required

    filetype plugin indent on    " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on

    "------------------------------------------------------------------
    " Brief help
    "------------------------------------------------------------------
    " :PluginList       - lists configured plugins
    " :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
    " :PluginSearch foo - searches for foo; append `!` to refresh local cache
    " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line
endif

