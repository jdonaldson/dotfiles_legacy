" A great overview of the rationale behind some of these options is given here:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/

vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" source all of the included vundles
source ~/.vimrc_vundle

"MODE/LEADER SWITCHING
" change the mapleader from \ to ,
let mapleader=","
"lazy commands
nnoremap ; :
"SEARCHING/MOVING
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
"nnoremap <tab> %
"vnoremap <tab> %
nnoremap <space> /\v
vnoremap <space> /\v
nmap <silent> ,<space> :nohlsearch<CR>
" requires ack plugin
nnoremap <leader>a :Ack<space>
let g:ackprg="ack -Hi --nocolor --ignore-dir=bin --nogroup --follow --column"

" requires ctrlp plugin
let g:ctrlp_follow_symlinks = 1


"REFORMATTING
" reformat paragraph
nnoremap <leader>q gqip
" strip whitespace
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>


"GLOBAL AUTOMATIC ACTIONS
" autosave on lost focus
"au FocusLost * :wa
" open directory in NerdTree mode
au VimEnter * wincmd p


"SPLIT WINDOW MANAGEMENT
" vertical split
nnoremap <leader>w <C-w>v<C-w>l
" easier split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" BUFFER MANAGEMENT
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>


"BASIC OPTIONS
set tags=./tags;/
set shell=bash
set encoding=utf-8
set nocompatible
set laststatus=2  " Always show the statusline
set number        " show line numbers
set nowrap        " don't wrap lines
set tabstop=8     " a tab is eight spaces
set shiftwidth=4  " number of spaces to use for autoindenting
set expandtab     " expand tabs to spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
"set smartindent   " use smart indenting for c/c++
set nosmartindent
set cindent       " useful for python
set number        " always show line numbers
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class,*.sass-cache
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " no, seriously, don't beep
set nobackup             " I'm using autosave/git, don't need backup files
set noswapfile           " I'm on a modern machine, don't need swapfiles
set autowrite            " automatically write before make, tag, etc.
set completeopt=menuone

" DISPLAY STYLE OPTIONS
" color too-wide columns
syntax on         " syntax highlighting, natch
if exists('+colorcolumn')
  set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


if has("gui_running") || &term == "xterm-256color" || &term == 'screen'
    let g:molokai_original = 1
    colors molokai
    set t_Co=256 " Explicitly tell vim that the terminal has 256 colors
    " requires vim-powerline
    let g:Powerline_symbols = 'fancy'
    set guifont=Monaco\ for\ Powerline:h13
    " hide the toolbar for macvim
    set guioptions=egmrt
    highlight ColorColumn ctermbg=16
    highlight ColorColumn guibg=Black
    set background=dark
else
    highlight ColorColumn ctermbg=8
    "set t_Co=16
    colors desert
endif

set mouse=a

" MISC KEY MAPPING

" force write a file
cmap w!! w !sudo tee % >/dev/null
" insert a newline  below in normal mode
nnoremap <C-J> hmao<esc>`a
" execute the current line as a shell command, insert
" results below the line
nnoremap <leader>r :exe ':r ! '.getline('.') <CR>


map <leader>pc :call ToggleEnablePreview()<CR>

" requires vaxe
map <leader>oh :call vaxe#OpenHxml()<CR>
map <leader>ct :call vaxe#Ctags()<CR>
map <leader>ic :call vaxe#ImportClass()<CR>
map <leader>pj :call vaxe#ProjectHxml()<CR>

" All of my 'panels'
nmap <silent> <leader>1 :call ToggleList("Quickfix List", 'c')<CR>
map <leader>2 :NERDTreeToggle<CR>
map <leader>3 :GundoToggle<CR>
map <leader>4 :TagbarToggle<CR>
map <leader>5 :BuffergatorToggle<CR>
map <leader>6 :YRShow<CR>

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>ev :e $MYVIMRC<CR>
nmap <Leader>sv :so $MYVIMRC<CR>

" browser refresh settings
let g:RefreshRunningBrowserDefault = 'chrome'

" echo current syntax scope
map <Leader>ss :echo "hi<" . synIDattr(synID(line("."), col("."), 1), "name")
            \. "> trans<"
            \. synIDattr(synID(line("."),col("."),0),"name")
            \. "> lo<"
            \. synIDattr(synIDtrans(synID(line("."),col("."),1)), "name")
            \. ">"<CR>

"showmarks
highlight ShowMarksHLl   cterm=bold ctermfg=1 ctermbg=12 gui=bold guifg=black guibg=lightblue
highlight ShowMarksHLu   cterm=bold ctermfg=1 ctermbg=12 gui=bold guifg=darkblue guibg=lightblue
highlight ShowMarksHLo   cterm=bold ctermfg=8 ctermbg=12 gui=bold guifg=darkgray guibg=lightblue
highlight ShowMarksHLm   cterm=bold ctermfg=1 ctermbg=4 gui=bold guifg=white guibg=lightblue

