"*****************************************************************************
" Maintainer: 
"   Michael Henke
"   http://gethub/vim/<repo>
"
" Version: 
"   0.1 - 2017/03/05
"
" Location:
"   Install the from:
"       https://github.com/<repo>/vimrc
"
" Raw_version: 
"   http://github/<repo>/vim/vimrc
"
" Sections:
"   -> General Settings
"   -> Indent Settings
"   -> Basic Settings
"   -> Backup settings
"   -> Search Setting
"   -> Visual Settings
"   -> Color Settings
"   -> Filetype Settings
"   -> Functions
"   -> Autocmd Rules
"   -> Key Mappings
"   -> Map Leader - map with extra key combinations
"   -> Plugins
"
"*****************************************************************************
if v:progname =~? "evim"
  finish
endif

"*****************************************************************************
"" -> General Settings
"*****************************************************************************

"" Set 'nocompatible' to enable Vi Improved enhancements.
set nocompatible

"" Set to auto read when a file is changed from the outside
set autoread

"" Enable hidden buffers
set hidden

"" Set the title of the window to file name
set title                   " Set title of window to titlestring
set titleold="Terminal"     " Set original window title
"set titlestring=%F          " Set string to filename

"*****************************************************************************
"" -> Indent Settings
"*****************************************************************************

"" Indentation settings for using 4 spaces instead of tabs.
set shiftwidth=4
set softtabstop=4
set expandtab
"" Do not change 'tabstop' from its default value of 8 with this setup.
"set tabstop=4

"" Setup indent options
set autoindent
set smartindent
"set cindent

"" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

"*****************************************************************************
"" -> Basic Settings
"*****************************************************************************

"" Stop certain movements from always going to the first character of a line.
set nostartofline

"" Improve window performance
set ttyfast                   " Improves smoothness of redrawing
set lazyredraw                " no redraw during macros (perf)

"" Show partial commands in the last line of the screen
set showcmd

"" Better command-line completion
set wildmenu
set wildmode=longest:full,full
set wildignore+=.git,.hg,.svn " Ignore version control repos
set wildignore+=*.o           " Ignore C compiled files
set wildignore+=*.6           " Ignore Go compiled files
set wildignore+=*.pyc,*.pyo   " Ignore Python object and compiled files
set wildignore+=*.rbc         " Ignore Rubinius compiled files
set wildignore+=*.DS_Store    " Ignore OSX attribute files
set wildignore+=*.bak         " Ignore vim backups
set wildignore+=*.swp         " Ignore vim swap files
set wildignore+=*.zip         " Ignore zip files

"" Set file format precedence
set fileformats=unix,dos,mac

"" Set default shell
set shell=/bin/sh

"*****************************************************************************
"" -> Backup settings
"*****************************************************************************
set autowrite           " Automatically save before cmd like :next and :make
set backup

set backupdir=$HOME/.vim/.backup//
set directory=$HOME/.vim/.swp//
set undodir=$HOME/.vim/.undo//

"" Create vim home directory
if !isdirectory($HOME."/.vim/")
    call mkdir($HOME."/.vim",'p')
endif

"" Create directories for backup, undo, and swp
if !isdirectory($HOME."/.vim/.backup")
    call mkdir($HOME."/.vim/.backup",'p')
endif

if !isdirectory($HOME."/.vim/.swp")
    call mkdir($HOME."/.vim/.swp",'p')
endif
if !isdirectory($HOME."/.vim/.undo")
   call mkdir($HOME."/.vim/.undo",'p')
endif

"" Create directories for bundles
if !isdirectory($HOME."/.vim/bundle")
    call mkdir($HOME."/.vim/bundle",'p')
endif

"*****************************************************************************
"" -> Search Setting
"*****************************************************************************
set hlsearch        " Highlight searches
set incsearch       " Incremental search
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching

"*****************************************************************************
"" -> Visual Settings
"*****************************************************************************
set ruler           " Show current possition
set number          " Show line numbers
set showmatch       " Show matching brackets.

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=           " Reset code for visualbell, ie no flash
set tm=500

"" Enable use of the mouse
set mousemodel=popup
set mouse=a         " Enable mouse usage (all modes)
"set mousehide      " Hide the mouse when typing text

" Set default window size
set lines=30
set columns=84
set colorcolumn=80

"*****************************************************************************
"" -> Color Settings
"*****************************************************************************

" Set nice colors
set t_Co=256        " use 256 colors

"" Enable syntax highlighting
syntax enable

"" Set light or dark scheme
if has('gui_running')
    set background=light
else
    set background=dark
endif

"" Set color scheme
try
    " https://github.com/chriskempson/tomorrow-theme/tree/master/vim/colors
    if &background == "dark"
        colorscheme Tomorrow-Night-Bright
    else
        colorscheme Tomorrow
    endif
catch /^Vim\%((\a\+)\)\=:E185/
    "" Set default colors for gvim
    "" - Background for normal text is light grey
    "" - Text below the last line is darker grey
    "" - Cursor is green, Cyan when ":lmap" mappings are active
    "" - Constants are not underlined but have a slightly lighter background
    if has('gui_running')
        highlight Normal guibg=white
        highlight Cursor guibg=Green guifg=NONE
        highlight lCursor guibg=Cyan guifg=NONE
        highlight NonText guibg=grey90
        highlight Constant gui=NONE guibg=grey95
        highlight Special gui=NONE guibg=grey95
    endif
endtry

"" Set gui font
set guifont=Monospace\ Bold\ 12

"*****************************************************************************
"" -> Filetype Settings
"*****************************************************************************

"" Enable file type detection and load the indent and plugin files
filetype indent plugin on

"" Change setting based on file type
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab    " C
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab  " Cpp
autocmd FileType java set sw=2                                  " java
autocmd Filetype html setlocal ts=2 sw=2 expandtab              " html
autocmd FileType make set ts=4                                  " makefile

" And Markdown
autocmd FileType mkd set sw=4
autocmd FileType mkd set sts=4
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.cql set filetype=cql

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

"*****************************************************************************
"" -> Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" -> Autocmd Rules
"*****************************************************************************

"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=4|set shiftwidth=4|set expandtab softtabstop=4
augroup END

" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

augroup vimrc-ruby
  autocmd!
  autocmd BufNewFile,BufRead *.rb,*.rbw,*.gemspec setlocal filetype=ruby
  autocmd FileType ruby set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
augroup END

"*****************************************************************************
"" -> Key Mappings
"*****************************************************************************
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
cmap <C-v> <C-r>+

"" Make moving around works well in multi lines
nmap <silent> j gj
nmap <silent> k gk

"" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q> <C-V>

"" Remap q record command to ,q
noremap <Leader>q q
noremap q <Nop>

"" Command to write as root if we dont' have permission
cmap w!! %!sudo tee > /dev/null %

"" Remap a key sequence in insert mode to kick me out to normal
"" mode. This makes it so this key sequence can never be typed
"" again in insert mode, so it has to be unique.
inoremap jj <esc>

"" For when you forget to sudo... Really Write the file.
if !has("gui_running")
    command! W w !sudo tee % > /dev/null
endif

"*****************************************************************************
"" -> Map Leader - map with extra key combinations
"*****************************************************************************
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

"*****************************************************************************
"" -> Plugins
"*****************************************************************************

"" let Vundle manage Vundle, required
if isdirectory(expand("~/.vim/bundle/Vundle.vim"))

    "" set the runtime path to include Vundle and initialize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    "" https://github.com/VundleVim/Vundle.vim
    Plugin 'VundleVim/Vundle.vim'

    "" vim-pandoc: https://github.com/vim-pandoc/vim-pandoc
    Plugin 'vim-pandoc/vim-pandoc'
    Plugin 'vim-pandoc/vim-pandoc-syntax'

    "" https://github.com/docker/docker/contrib/syntax/vim
    "Plugin 'docker/docker' , {'rtp': '~/.vim/bundle/Dockerfile.vim'}
    Plugin 'ekalinin/Dockerfile.vim'

    "" https://github.com/chase/vim-ansible-yaml.git
    "Plugin 'chase/vim-ansible-yaml'
    "" https://github.com/pearofducks/ansible-vim
    Plugin 'pearofducks/ansible-vim'

    "" Provides automatic closing of quotes, parenthesis, brackets, etc.
    "" https://github.com/Raimondi/delimitMate
    Plugin 'Raimondi/delimitMate'

    "" Solarized Colorscheme for Vim
    "" https://github.com/altercation/vim-colors-solarized
    "Plugin 'altercation/vim-colors-solarized'

    "" Sublime Text's awesome multiple selection feature in Vim
    "" https://github.com/terryma/vim-multiple-cursors/#mapping
    "Plugin 'terryma/vim-multiple-cursors'

    "" All of your Plugins must be added before the following line
    call vundle#end()            " required

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

