
" Default Command overrides
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These are ergonomic overrides for common vim triggers.  I rely heavily on search and leader based triggers, so these get key triggers that are easy to
" hit.

" You need to use the escape key quite often in vim, and on some modern
" keyboards it's a bit uncomfortable to reach.  Ctrl-c works mostly the same
" as escape, and this function makes it perform identically (:h ctrl-c)
inoremap <C-C> <Esc>

" I rely heavily on searching to navigate files (rather than directional
" arrows or word/character movements).  Remap search (/) to the spacebar since
" it's a lot easier to hit and I use search movements very often:
nnoremap <space> /
vnoremap <space> /

" The default leader character (;) is also a bit hard to hit, so I use comma.
" http://learnvimscriptthehardway.stevelosh.com/chapters/06.html
let mapleader=","
nnoremap ; :

" edit/source my vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
nmap <leader>ev :e $MYVIMRC<CR>


" Opinionated configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" these are the 'simple boolean flag' configurations

set nocompatible
set autowrite
set expandtab    " expand tabs to spaces
set hidden       " hide the old buffer when switching
set lazyredraw
set nowrap       " don't wrap lines
set formatoptions-=t " really don't wrap lines
set number       " always show line numbers
set shiftround   " use multiple of shiftwidth when indenting with '<' and '>'
set smartindent
set title        " change the terminal's title

" Silence
set visualbell   " don't beep
set noerrorbells " no, seriously, don't beep

" Search
set ignorecase   " search : ignore case
set smartcase    " search : smart case
set gdefault     " search : default
set hlsearch     " search : highlight

" Parameter options
set mouse=a         " use mouse in nvich modes
set clipboard+=unnamedplus
set encoding=utf-8
set tw=0
set shell=bash
set undolevels=1000
set ts=4            " a tab is four spaces by default
set sts=4
set sw=4

" Ignore all files like this
set wildignore=*.swp,*.bak,*.pyc,*.class,*.sass-cache,*/_site/*

set splitright "splits go to the right

" autosave on lost focus
au FocusLost * :wa

" give a nice color column that helps show an 80 character width
if exists('+colorcolumn')
  set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" strip whitespace at end of line
nnoremap <Leader>f$ :%s/\s\+$//<CR>:let @/=''<CR>

" force write/overwrite a file
cmap w!! w !sudo tee % >/dev/null

" use my personal python 3 installation for neovim python
let g:python3_host_prog = "/usr/local/bin/python3"

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif



" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Additional lsp support
Plug 'neovim/nvim-lspconfig'

" nice treesitter highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" my colors!
Plug 'morhetz/gruvbox'

Plug 'nvim-lua/completion-nvim'

Plug 'hoob3rt/lualine.nvim'

Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        map <C-P> :Files<CR>
        map <C-[> :Buffers<CR>

Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

Plug 'jremmen/vim-ripgrep'
    nmap <Leader><space> :Rg<space>


" Initialize plugin system
call plug#end()

colorscheme gruvbox
lua << EOF
    require'lualine'.setup()

    require'lspconfig'.kotlin_language_server.setup{}
    require'lspconfig'.pyright.setup{}
EOF

