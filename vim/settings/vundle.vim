syntax enable
filetype off

" load some bundles depending on where I'm logging from
let hostname = substitute(system('hostname'), '\n', '', '')

" I use vundle to manage libraries.  It handles the "Plugin" entries below
" If there are bundle-specific configs that I like, I add them under the
" bundle entry, while also indenting them.
Plugin 'gmarik/vundle'

" If a bundle has a slash in it, it's referenceing a github repo:
" http://www.github/gmarik/vundle
" If it is a simple name, it's available on vimpscripts.org, and you can find
" it by searching there.

Plugin 'altercation/vim-colors-solarized'
    " solarized options
    let g:solarized_termtrans = 1
    set background=dark
    colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins that support language-specific tooling and support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'OCamlPro/ocp-indent'
Plugin 'jcfaria/Vim-R-plugin'
Plugin 'jdonaldson/vim-eco'
Plugin 'jdonaldson/writeGooder'
Plugin 'vim-ruby/vim-ruby'
Plugin 'kchmck/vim-coffee-script'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'jsx/jsx.vim'
Plugin 'elzr/vim-json'
Plugin 'PProvost/vim-markdown-jekyll'
Plugin 'suan/vim-instant-markdown'
   let g:instant_markdown_slow = 1 
Plugin 'plasticboy/vim-markdown'
Plugin 'jdonaldson/vim-markdown-link-convert'
    map <Leader>il :call Inline2Ref()<CR>
Plugin 'ap/vim-css-color'
Plugin 'batsuev/csscomb-vim'
Plugin 'xolox/vim-lua-ftplugin'
    Plugin 'xolox/vim-misc'
Plugin 'jdonaldson/vaxel'
    map <Leader>dh :! ./haxe build.hxml<CR>
    map <Leader>dl :luafile ~/.vim/bundle/vaxel/lua/vaxel.lua<CR>
    let g:vaxe_haxe_version = 3
    let g:vaxe_completion_write_compiler_output = 1
    map <Leader>oh :call vaxe#OpenHxml()<CR>
    map <Leader>ct :call vaxe#Ctags()<CR>
    map <Leader>ic :call vaxe#ImportClass()<CR>
    map <Leader>pj :call vaxe#ProjectHxml()<CR>
    map <Leader>jd :call vaxe#JumpToDefinition()<CR>
if hostname == "jdonaldson-wsm1.internal.salesforce.com"
    Plugin 'vim-aura'
endif
Plugin 'gerw/vim-latex-suite'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins that provide general editor techniques and features
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Finding stuff
Plugin 'Lokaltog/vim-easymotion'
Plugin 'goldfeld/vim-seek'
Plugin 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_follow_symlinks = 2
    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
    if len(argv())==0 || argv()[0] == '.'
        " If I open a directory, assume I want to hard set a working path
        let g:ctrlp_working_path_mode = ''
        let g:ctrlp_use_caching=1
        let g:ctrlp_clear_cache_on_exit=0
        let g:ctrlp_max_files = 0
    endif
Plugin 'mileszs/ack.vim'
    " nnoremap <Leader>a :Ack<space>
    map <c-@> :Ack<space>
    " use silver searcher instead of ack:
    let g:ackprg = 'ag --follow --nogroup --nocolor --column'

Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-startify'
Plugin 'bling/vim-airline'
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
Plugin 'majutsushi/tagbar'
    nmap <silent><Leader>st :TagbarToggle<CR>
    " Extending tabar to support markdown (additionally to the ~/.ctags-file!)
        let g:tagbar_type_markdown = {
            \ 'ctagstype' : 'markdown',
            \ 'kinds' : [
                \ 'h:Heading_L1',
                \ 'i:Heading_L2',
                \ 'k:Heading_L3'
            \ ]
        \ }
Plugin 'Lokaltog/powerline'
" Plugin 'Align'
Plugin 'junegunn/vim-easy-align'
    " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    vmap <Enter> <Plug>(EasyAlign)
    "
    " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
    nmap <Leader>a <Plug>(EasyAlign)

    let g:easy_align_delimiters = {
                \ 't': { 'pattern': "\<tab>", 'left_margin': 0, 'right_margin': 0 } }

Plugin 'jdonaldson/vim-cheat-x-in-y'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
    let g:UltiSnipsSnippetDirectories=["UltiSnips", "bundle/UltiSnips/UltiSnips", "bundle/vim-aura/ultisnips"]
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"include perforce if I have a p4 client
if executable("p4") && getcwd() =~ "blt\\|projectone\\|main\\|patch\\|freeze"
    Plugin 'vim-scripts/perforce'
endif
Plugin 'michalliu/sourcebeautify.vim'
Plugin 'mkitt/browser-refresh.vim'
    " browser refresh settings
    let g:RefreshRunningBrowserDefault = 'chrome'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic'
    let g:syntastic_javascript_syntax_checker="gjslint"
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
    " syntastic gutter
    augroup syn_gutter
        au BufWinEnter * sign define mysign
        au BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')
    augroup END

" Most of Tim Pope's awesome bundles:
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
    " Plugin 'jaxbot/github-issues.vim'

Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-projectile'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-dispatch'
    map <Leader>dm :Make<CR>
    " Use dispatch to execute the current line as a shell command, insert
    " results below the line
    nnoremap <Leader>r :exe ':Dispatch '.getline('.') <CR>
    
Plugin 'tyru/open-browser.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'tsaleh/vim-matchit'
Plugin 'sjl/gundo.vim'
    map <Leader>su :GundoToggle<CR>

Plugin 'scrooloose/nerdtree'
    nmap <silent><Leader>sn :NERDTreeToggle<CR>
    command! En execute "NERDTree %"
    " Extended feature plugin
    Plugin 'jdonaldson/nerdtree-execute'


Plugin 'closetag.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'kana/vim-fakeclip'
" Plugin 'jdonaldson/wildfire.vim'
Plugin 'dharanasoft/rtf-highlight'
Plugin 'wellle/tmux-complete.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins that provide vimscript libraries for other bundles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'tomtom/tlib_vim'
Plugin 'vim-scripts/genutils'
Plugin 'michalliu/jsoncodecs.vim'
Plugin 'michalliu/jsruntime.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'L9'
Plugin 'utl.vim'


filetype plugin indent on " required!

