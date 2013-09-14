syntax enable
filetype off

" load some bundles depending on where I'm logging from
let hostname = substitute(system('hostname'), '\n', '', '')

" I use vundle to manage libraries.  It handles the "Bundle" entries below
" If there are bundle-specific configs that I like, I add them under the
" bundle entry, while also indenting them.
Bundle 'gmarik/vundle'

" If a bundle has a slash in it, it's referenceing a github repo:
" http://www.github/gmarik/vundle
" If it is a simple name, it's available on vimpscripts.org, and you can find
" it by searching there.

Bundle 'altercation/vim-colors-solarized'
    " solarized options
    let g:solarized_termtrans = 1
    set background=dark
    colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundles that support language-specific tooling and support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'jcfaria/Vim-R-plugin'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'elzr/vim-json'
Bundle 'PProvost/vim-markdown-jekyll'
Bundle 'ap/vim-css-color'
Bundle 'csscomb/CSScomb-for-Vim'
Bundle 'jdonaldson/vaxe'
    let g:vaxe_default_parent_search_patterns = ["project.xml", "*.nmml", "build.hxml"]
    let g:vaxe_haxe_version = 3
    let g:vaxe_completion_write_compiler_output = 1
    map <Leader>oh :call vaxe#OpenHxml()<CR>
    map <Leader>ct :call vaxe#Ctags()<CR>
    map <Leader>ic :call vaxe#ImportClass()<CR>
    map <Leader>pj :call vaxe#ProjectHxml()<CR>
    map <Leader>jd :call vaxe#JumpToDefinition()<CR>
if hostname == "jdonaldson-wsl"
    Bundle 'vim-aura'
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundles that provide general editor techniques and features
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Finding stuff
Bundle 'Lokaltog/vim-easymotion'
Bundle 'goldfeld/vim-seek'
Bundle 'kien/ctrlp.vim'
    let g:ctrlp_follow_symlinks = 2
    let g:ctrlp_custom_ignore = '\v(build|test|htdocs|apex|conf|class)\/'
    let g:ctrlp_user_command = 'find %s -type f -follow'
    if len(argv())==0 || argv()[0] == '.'
        " If I open a directory, assume I want to hard set a working path
        let g:ctrlp_working_path_mode = ''
        let g:ctrlp_use_caching=1
        let g:ctrlp_clear_cache_on_exit=0
        let g:ctrlp_max_files = 0
    endif
Bundle 'mileszs/ack.vim'
    " nnoremap <Leader>a :Ack<space>
    map <c-@> :Ack<space>
    " use silver searcher instead of ack:
    let g:ackprg = 'ag --follow --nogroup --nocolor --column'

Bundle 'airblade/vim-gitgutter'
Bundle 'mhinz/vim-startify'
Bundle 'bling/vim-airline'
    let g:airline_theme = "solarized"
    let g:airline_detect_whitespace=2
    let g:airline_powerline_fonts = 1
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_branch_prefix = ' '
    let g:airline_readonly_symbol = ''
    let g:airline_linecolumn_prefix = ' '
Bundle 'majutsushi/tagbar'
" Extending tabar to support markdown (additionally to the ~/.ctags-file!)
    let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
        \ ]
    \ }
Bundle 'Lokaltog/powerline'
Bundle 'Align'
Bundle 'jdonaldson/vim-cheat-x-in-y'
Bundle 'SirVer/ultisnips'
    let g:UltiSnipsSnippetDirectories=["bundle/UltiSnips/UltiSnips", "bundle/vaxe/ultisnips", "bundle/vim-aura/ultisnips"]
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"include perforce if I have a p4 client
if executable("p4") && getcwd() =~ "blt\\|projectone\\|work"
    Bundle 'vim-scripts/perforce'
endif
Bundle 'michalliu/sourcebeautify.vim'
Bundle 'mkitt/browser-refresh.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/syntastic'
    let g:syntastic_javascript_syntax_checker="gjslint"
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
    " syntastic gutter
    augroup syn_gutter
        au BufWinEnter * sign define mysign
        au BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')
    augroup END
Bundle 'suan/vim-instant-markdown'
Bundle 'tpope/vim-commentary'
" Most of Tim Pope's awesome bundles:
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sensible'
" Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'

Bundle 'tyru/open-browser.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'tsaleh/vim-matchit'
Bundle 'sjl/gundo.vim'
    map <Leader>z :GundoToggle<CR>
Bundle 'scrooloose/nerdtree'
Bundle 'closetag.vim'
Bundle 'christoomey/vim-tmux-navigator'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundles that provide vimscript libraries for other bundles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'vim-scripts/genutils'
Bundle 'michalliu/jsoncodecs.vim'
Bundle 'michalliu/jsruntime.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'L9'
Bundle 'utl.vim'


filetype plugin indent on " required!

