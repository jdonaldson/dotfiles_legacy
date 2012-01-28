syntax enable
" change the mapleader from \ to ,
let mapleader=","
" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap
nnoremap ; :
autocmd VimEnter * wincmd p
 
syntax on

""" BASIC OPTIONS 
set background=dark
set visualbell
set nocompatible
set laststatus=2 " Always show the statusline
set t_Co=256 " Explicitly tell vim that the terminal has 256 colors
" set t_Co=16 " Explicitly tell vim that the terminal has 256 colors
set number
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile


filetype plugin indent on     " required! 

""" pasting
set pastetoggle=<F2>


" Key Mappings
cmap w!! w !sudo tee % >/dev/null
map <s-J> <c-w>j<c-w>
map <s-K> <c-w>k<c-w>
map <s-h> <c-w>h<c-w>
map <s-l> <c-w>l<c-w>


" emacs movement keybindings in insert mode
imap <C-a> <C-o>0
imap <C-e> <C-o>$
map <C-e> $
map <C-a> 0

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

map <leader>1 :TagbarToggle <CR>
map <leader>2 :ToggleNERDTree <CR>
map <leader>3 :GundoToggle <CR>
" sources $MYVIMRC 
nmap <Leader>s :source $MYVIMRC
" 
" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>v :e $MYVIMRC

map <Leader>l V:w !sh<CR>

map <space> /
map <c-space> ?
nmap <silent> ,/ :nohlsearch<CR>

" echo current syntax scope
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

map <c-1> call haxe#BuildHXMLPath()
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" original repos on github
Bundle 'vim-scripts/a.vim'
Bundle 'scrooloose/snipmate-snippets'
Bundle 'tpope/vim-surround'
Bundle 'majutsushi/tagbar'
Bundle 'vim-scripts/taglist.vim'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'MarcWeber/vim-addon-manager'
Bundle 'MarcWeber/vim-addon-actions'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'MarcWeber/vim-addon-views'
Bundle 'MarcWeber/vim-addon-goto-thing-at-cursor'
Bundle 'MarcWeber/vim-addon-background-cmd'
Bundle 'MarcWeber/vim-addon-completion'
Bundle 'MarcWeber/vim-addon-swfmill'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'jdonaldson/vim-haxe'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'wincent/Command-T'
Bundle 'tsaleh/vim-supertab' 
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
Bundle 'msanders/snipmate.vim'
Bundle 'vim-scripts/Wombat.git'
Bundle 'tpope/vim-unimpaired' 

" vim-scripts repos
Bundle 'Gundo'
Bundle 'The-NERD-tree'
Bundle 'NERD_tree-Project'
Bundle 'The-NERD-Commenter'
Bundle 'desert.vim'
Bundle 'Color-Sampler-Pack'
Bundle 'vimomni'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'tlib'

" vim-omni 
"improve autocomplete menu color
highlight Pmenu ctermbg=238 gui=bold

filetype plugin indent on " required!
"
" Brief help
"
" :BundleInstall - install bundles (won't update installed)
" :BundleInstall! - update if installed
"
" :Bundles foo - search for foo
" :Bundles! foo - refresh cached list and search for foo
"
" :BundleClean - confirm removal of unused bundles
" :BundleClean! - remove without confirmation
"
" see :h vundle for more details
" or wiki for FAQ
" Note: comments after Bundle command are not allowed..

let g:Powerline_symbols = 'fancy'
set guifont=Menlo\ for\ Powerline:h11
let g:tagbar_type_haxe = {
    \ 'ctagstype' : 'haxe',
    \ 'kinds'     : [
        \ 'c:classes',
        \ 'v:variables',
        \ 'f:functions',
    \ ]
	\ }

