syntax enable
filetype off
let g:fancy_term = 0
if has("gui_running") || &term == "xterm-256color" || &term == 'screen'
    let g:fancy_term = 1
endif
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" original repos on github
"Bundle 'Shougo/neocomplcache-snippets-complete'
"Bundle 'vim-scripts/YankRing.vim'
"Bundle 'zakj/vim-showmarks'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Raimondi/delimitMate'
    nnoremap <Leader>ds :DelimitMateSwitch<CR>
    let g:delimitMate_expand_cr = 1
Bundle 'Shougo/unite.vim'
Bundle 'benmills/vimux'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'garbas/vim-snipmate'
Bundle 'pangloss/vim-javascript'
Bundle 'honza/snipmate-snippets'
Bundle 'hsitz/VimOrganizer'
Bundle 'jcfaria/Vim-R-plugin'
Bundle 'mileszs/ack.vim'
    nnoremap <Leader>a :Ack<space>
    let g:ackprg="ack --with-filename --ignore-case --all --nocolor --nogroup --follow --column"
Bundle 'jdonaldson/vaxe'
Bundle 'jdonaldson/vim-powerline'
"Bundle 'fholgado/minibufexpl.vim'
    "map <Leader>b :MiniBufExplorer<cr>
    "let g:miniBufExplMapWindowNavVim = 1
    "let g:miniBufExplMapWindowNavArrows = 1
    "let g:miniBufExplMapCTabSwitchBufs = 1
    "let g:miniBufExplModSelTarget = 1
Bundle 'kien/ctrlp.vim'
    let g:ctrlp_follow_symlinks = 2
Bundle 'majutsushi/tagbar'
Bundle 'michalliu/jsoncodecs.vim'
Bundle 'michalliu/jsruntime.vim'
Bundle 'michalliu/sourcebeautify.vim'
Bundle 'mkitt/browser-refresh.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'sjl/splice.vim'
Bundle 'sjl/vitality.vim'
Bundle 'suan/vim-instant-markdown'
Bundle 'tomasr/molokai'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tyru/open-browser.vim'
Bundle 'Shougo/neocomplcache'

" vim-scripts repos
"Bundle 'localvimrc'
Bundle 'Gundo'
Bundle 'L9'
Bundle 'The-NERD-tree'
Bundle 'desert.vim'
Bundle 'vim-addon-mw-utils'
Bundle 'jdonaldson/vim-addon-local-vimrc'

filetype plugin indent on " required!

