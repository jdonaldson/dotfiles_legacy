"  great overview of the rationale behind some of these options is given
" here: http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" trigger InsertLeave with Ctrl-C (:h i_Ctrl-c)
inoremap <C-C> <Esc>

" add ~/.vim to rtp
if has('nvim')
  let s:editor_root=expand("~/.nvim")
  let &rtp = &rtp . ',' . s:editor_root
  let viminfopath='~/.config/nvim/shada/main.shada'
  let &viminfo .= ',n' . escape(viminfopath, ',')
endif

" First, make the leader and command characters easier to type
let mapleader=","
nnoremap ; :

" Add some commands to quickly open or source this file
nmap <Leader>1 :e $MYVIMRC<CR>


" Now we need to load vim-plug, it manages all of the extra plugins for vim
call plug#begin("~/.vim/bundle")
    " bundle configs are stored in a separate file, source it.
    source ~/.vim/settings/bundle.vim
call plug#end()

colorscheme gruvbox
" colorscheme flattened_dark
" colorscheme molokai

"BASIC OPTIONS

set autowrite
set cindent      " useful for python
set copyindent   " copy the previous indentation on autoindenting
set expandtab    " expand tabs to spaces
set hidden       " hide the old buffer when switching
set lazyredraw
set nocompatible
set nowrap       " don't wrap lines
set formatoptions-=t " really don't wrap lines
set number       " always show line numbers
set shiftround   " use multiple of shiftwidth when indenting with '<' and '>'
set smartindent
set title        " change the terminal's title

" Silence
set noerrorbells " no, seriously, don't beep
set visualbell   " don't beep

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
set ts=4            " a tab is four spaces
set tags=./tags;/
set sts=4
set sw=4

" Ignore all files like this
set wildignore=*.swp,*.bak,*.pyc,*.class,*.sass-cache,*/_site/*


" increment letters in addition to numbers
set nrformats=octal,hex,alpha

" syntax highlighting
syntax on

"splits go to the right
set splitright

" too lazy to hit the forward slash
nnoremap <space> /
vnoremap <space> /

" Some  general reformatting command(s)
" strip whitespace at end of line
nnoremap <Leader>f$ :%s/\s\+$//<CR>:let @/=''<CR>


"GLOBAL AUTOMATIC ACTIONS
" autosave on lost focus
au FocusLost * :wa

if exists('+colorcolumn')
  set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

function! ToggleSet(toggle)
    execute "let x = &".a:toggle

    if x
        execute "set no".a:toggle
    else
        execute "set ".a:toggle
    endif
endfunction

function! ToggleSetValue(toggle, value)
    let toggle_saved_varname = "g:_toggle_saved_" . a:toggle
    if exists(toggle_saved_varname)
        execute "set "   . a:toggle . " = " . toggle_saved_varname
        execute "unlet " . toggle_saved_varname
    else
        execute "let " . toggle_saved_varname . " = " . a:toggle
        execute "set " . a:toggle . "="  a:value
    endif
endfunction


" MISC KEY MAPPING

" force write a file
cmap w!! w !sudo tee % >/dev/null

" Show/hide stuff: <Leader>s + letter
" refresh screen
nmap <silent><Leader>ss :redraw!<CR>
" hide highlights from last search
nmap <silent><Leader>sh :nohlsearch<CR>
" Show the bundle list
nmap <silent><Leader>bb :e ~/.vim/settings/bundle.vim<CR>

"Toggle stuff: <Leader>t + letter
" toggle paste mode
nmap <silent><Leader>tp :call ToggleSet("paste")<CR>

" Reload current buffer
nnoremap <leader>ee :edit!<cr>


" echo current syntax scope
map <Leader>syn :echo "hi<" . synIDattr(synID(line("."), col("."), 1), "name")
            \. "> trans<"
            \. synIDattr(synID(line("."),col("."),0),"name")
            \. "> lo<"
            \. synIDattr(synIDtrans(synID(line("."),col("."),1)), "name")
            \. ">"<CR>


" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vim/backup') == 0
  :silent !mkdir -p ~/.vim/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vim/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vim/swap') == 0
  :silent !mkdir -p ~/.vim/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vim/swap//
set directory+=~/tmp//
set directory+=.

" viminfo stores the the state of your previous editing session
set viminfo+=n~/.vim/viminfo

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

command! Thtml :%!tidy -q -i --show-errors 0

let g:netrw_liststyle=1

set nofoldenable

" transparent background
highlight Normal ctermbg=NONE
