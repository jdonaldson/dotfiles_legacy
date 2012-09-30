" A great overview of the rationale behind some of these options is given

" here: http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" First, make the leader and command characters easier to type
let mapleader=","
nnoremap ; :

" Add some commands to quickly open or source this file
nmap <Leader>1 :e $MYVIMRC<CR>
nmap <Leader>so :so %<CR>

" Now we need to load vundle, it manages all of the extra plugins for vim
" It must be done first
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
source ~/.vim/settings/vundle.vim

" Vundle configs are stored in a separate file, source it.
nmap <Leader>vu :e ~/.vim/settings/vundle.vim<CR>


" These are all options releated to searching
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
" Use 'extra magic' for regex searches
nnoremap <space> /\v
vnoremap <space> /\v
nmap <silent> ,<space> :nohlsearch<CR>
" requires ack plugin
nnoremap <Leader>a :Ack<space>
let g:ackprg="ack -Hia --nocolor --ignore-dir=bin --nogroup --follow --column"
" requires ctrlp plugin
let g:ctrlp_follow_symlinks = 2


" Some  general reformatting command(s)
" strip whitespace
nnoremap <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>


"GLOBAL AUTOMATIC ACTIONS
" autosave on lost focus
au FocusLost * :wa
if len(argv())==0 || argv()[0] == '.'
    " If I open a directory, assume I want to hard set a working path
    let g:ctrlp_working_path_mode = ''
endif



" Window/buffer management courtesy of dwm.
" Override basic behavior
let g:dwm_map_keys = 0

" Cleans up the window layout if dwm buffer is closed arbitrarily
function! DWM_Fix()
    let w = 1
    " stack all windows
    while (w <= winnr("$"))
        exe w . "wincmd w"
        wincmd K
        let w+=1
    endwhile
    " make the last current window the main window
    wincmd H
    " resize according to user preference
    call DWM_ResizeMasterPaneWidth()
endfunction

" Split the current buffer
function! DWM_Split()
  " Move current master pane to the stack
  call DWM_Stack(1)
  " Create a vertical split
  vert topleft split
  call DWM_ResizeMasterPaneWidth()
endfunction


"imap <expr><CR> pumvisible() ? "\<C-k>" : "\<CR>"
map <silent> <Leader>wf :call DWM_Fix()<CR>
map <silent> <Leader>ws :call DWM_Split()<CR>
map <silent> <Leader>wo :call DWM_New()<CR>
map <silent> <Leader>wq :call DWM_Close()<CR>
nnoremap <expr><CR> &bt == '' && winnr() != 1 ? ":call DWM_Focus()\<CR>" : "\<CR>"
map <silent> <C-H> :call DWM_GrowMaster()<CR>
map <silent> <C-L> :call DWM_ShrinkMaster()<CR>
map <expr><TAB> winnr("$") == 1 ? ":call DWM_Split()\<CR>" : "\<C-W>w"
map <silent> <S-TAB> <C-W>W

nmap <expr><silent> q winnr("$") != 1 ? ":q\<CR>" : "q"

function! DWMOpenFunc(action,line)
    1wincmd w
    if &buftype == '' && !bufexists(bufname(a:line))
        call DWM_Split()
        call call('ctrlp#acceptfile', [a:action, a:line])
        call DWM_Focus()
    else
        call call('ctrlp#acceptfile', [a:action, a:line])
    endif
endfunction


let g:ctrlp_open_func = { 'files': 'DWMOpenFunc' }

" Show cheats
map <leader>ch :call ToggleCheatSheet()<CR>

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
nnoremap <Leader>r :exe ':r ! '.getline('.') <CR>


map <Leader>pc :call ToggleEnablePreview()<CR>

" requires vaxe
map <Leader>oh :call vaxe#OpenHxml()<CR>
map <Leader>ct :call vaxe#Ctags()<CR>
map <Leader>ic :call vaxe#ImportClass()<CR>
map <Leader>pj :call vaxe#ProjectHxml()<CR>

" All of my 'panels'
nmap <silent> <leader>q :call ToggleList("Quickfix List", 'c')<CR>
map <Leader>w :NERDTreeToggle<CR>
map <Leader>z :GundoToggle<CR>
map <Leader>g :TagbarToggle<CR>
"map <Leader>y :YRShow<CR>


" browser refresh settings
let g:RefreshRunningBrowserDefault = 'chrome'

" echo current syntax scope
map <Leader>syn :echo "hi<" . synIDattr(synID(line("."), col("."), 1), "name")
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

