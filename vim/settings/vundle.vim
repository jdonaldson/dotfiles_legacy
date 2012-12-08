syntax enable
filetype off

if has("gui_running") || &term == "xterm-256color" || &term == 'screen'
    let g:fancy_term = 1
else
    let g:fancy_term = 0
endif

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'xolox/vim-session'
    let g:session_autoload = 'yes'
" original repos on github
"Bundle 'Shougo/neocomplcache-snippets-complete'
"Bundle 'vim-scripts/YankRing.vim'
"Bundle 'zakj/vim-showmarks'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Raimondi/delimitMate'
    nnoremap <Leader>ds :DelimitMateSwitch<CR>
    let g:delimitMate_expand_cr = 1
Bundle 'Rip-Rip/clang_complete'
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
    if g:fancy_term
        let g:Powerline_symbols = 'fancy'
    endif
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
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
Bundle 'sjl/splice.vim'
Bundle 'sjl/vitality.vim'
Bundle 'suan/vim-instant-markdown'
Bundle 'tomasr/molokai'
    if g:fancy_term
        let g:molokai_original = 1
        colors molokai
    endif
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
    map <Leader>z :GundoToggle<CR>
Bundle 'L9'
Bundle 'The-NERD-tree'
Bundle 'desert.vim'
Bundle 'vim-addon-mw-utils'
Bundle 'jdonaldson/vim-addon-local-vimrc'

filetype plugin indent on " required!

