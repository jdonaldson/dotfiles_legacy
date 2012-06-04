" A great overview of the rationale behind some of these options is given here:
" http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" source all of the included vundles
source ~/.vimrc_vundle

"MODE/LEADER SWITCHING
" change the mapleader from \ to ,
let mapleader=","
"lazy commands
nnoremap ; :
" lazy insert mode escape
inoremap jj <Esc>


"SEARCHING/MOVING
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <tab> %
vnoremap <tab> %
nnoremap <space> /\v
vnoremap <space> /\v
nmap <silent> ,<space> :nohlsearch<CR>
" requires ack plugin
nnoremap <leader>a :Ack 
" requires ctrlp plugin
let g:ctrlp_follow_symlinks = 1

"REFORMATTING
" reformat paragraph
nnoremap <leader>q gqip
" strip whitespace
nnoremap <leader>W :%s/\s\+$//<CR>:let @/=''<CR>


"GLOBAL AUTOMATIC ACTIONS
" autosave on lost focus
au FocusLost * :wa
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
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " no, seriously, don't beep
set nobackup             " I'm using autosave/git, don't need backup files
set noswapfile           " I'm on a modern machine, don't need swapfiles


" DISPLAY STYLE OPTIONS
" color too-wide columns
syntax on         " syntax highlighting, natch
if exists('+colorcolumn')
  set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif


if has("gui_running") || &term == "xterm-256color"
    let g:molokai_original = 1 
    colors molokai 
    "set t_Co=256 " Explicitly tell vim that the terminal has 256 colors
    " requires vim-powerline 
    let g:Powerline_symbols = 'fancy'
    set guifont=Monaco\ for\ Powerline:h13
    " hide the toolbar for macvim
    set guioptions=egmrt
    highlight ColorColumn ctermbg=16
    highlight ColorColumn guibg=Black
else
    highlight ColorColumn ctermbg=8
    "set t_Co=16
    colors desert
endif


" MISC KEY MAPPING

" force write a file
cmap w!! w !sudo tee % >/dev/null
" insert a newline  below in normal mode
nnoremap <C-J> hmao<esc>`a
" execute the current line as a shell command, insert
" results below the line
nnoremap <leader>r :exe ':r ! '.getline('.') <CR>


" requires vihxen
map <leader>eb :call vihxen#OpenHxml()<CR>
map <leader>th : call vihxen#Ctags()<CR>

" All of my 'panels'
nmap <silent> <leader>1 :call ToggleList("Quickfix List", 'c')<CR>
map <leader>2 :NERDTreeToggle<CR>
map <leader>3 :GundoToggle<CR>
map <leader>4 :TagbarToggle<CR>
map <leader>5 :BuffergatorToggle <CR>

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>ev :e $MYVIMRC<CR>
nmap <Leader>sv :so $MYVIMRC<CR>

"Vim 7 specific mappings
if version >= 700
  map <C-t> <Esc>:tabnew<CR>
  map <C-F4> <Esc>:tabclose<CR>
endif

" echo current syntax scope
map <Leader>css :echo "hi<" . synIDattr(
            \. synID(line("."), col("."), 1), "name")
            \. "> trans<"
            \. synIDattr(synID(line("."),col("."),0),"name")
            \. "> lo<"
            \. synIDattr(synIDtrans(synID(line("."),col("."),1))
            \.,"name")
            \. ">"<CR>

" Functions to open a buffer as a toggle-able tab
function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'),
      \ 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction



" NEOCOMPLCACHE OPTIONS
" requires neocomplcache, obviously

"disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ?
            \"\<Plug>(neocomplcache_snippets_expand)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"<C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.haxe = '\%([\]''") ]\|\w\)\%(\.\|(\)'

