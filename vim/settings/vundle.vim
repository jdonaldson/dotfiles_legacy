syntax enable
filetype off
if has("gui_running") || &term == "xterm-256color" || &term == 'screen'
    let g:fancy_term = 1
else
    let g:fancy_term = 0
endif

let s:is_windows = has('win32') || has('win64')

let hostname = substitute(system('hostname'), '\n', '', '')
if hostname == "jdonaldson-wsl"
    Bundle 'vim-aura'
endif
Bundle 'elzr/vim-json'
Bundle 'jdonaldson/vim-cheat'
Bundle 'csscomb/CSScomb-for-Vim'
Bundle 'altercation/vim-colors-solarized'
    " solarized options
    " let g:solarized_termcolors = 16
    let g:solarized_termtrans = 1
    set background=dark
    colorscheme solarized
Bundle 'freitass/todo.txt-vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'benmills/vimux'
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" Bundle 'xolox/vim-session'
"     let g:session_autoload = 'yes'
" original repos on github
" Bundle 'vim-scripts/YankRing.vim'
if executable("p4")
    Bundle 'vim-scripts/perforce'
endif
Bundle 'vim-scripts/genutils'
" Bundle 'zakj/vim-showmarks'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'jceb/vim-orgmode'

" Bundle 'Raimondi/delimitMate'
    " nnoremap <Leader>ds :DelimitMateSwitch<CR>
    " let g:delimitMate_expand_cr = 1
Bundle 'Rip-Rip/clang_complete'
Bundle 'airblade/vim-gitgutter'
Bundle 'mhinz/vim-startify'
" Bundle 'mattn/gist-vim'
Bundle 'ap/vim-css-color'
Bundle 'PProvost/vim-markdown-jekyll'
" Bundle 'Shougo/unite.vim'
"     call unite#filters#matcher_default#use(['matcher_fuzzy'])
"     call unite#filters#sorter_default#use(['sorter_rank'])
"     call unite#set_profile('files', 'smartcase', 1)
"     call unite#custom#source('line,outline','matchers','matcher_fuzzy')
"     let g:unite_data_directory='~/.vim/cache/unite'
"         let g:unite_enable_start_insert=1
"         let g:unite_source_history_yank_enable=1
"         let g:unite_source_rec_max_cache_files=5000
"         let g:unite_prompt='» '

"         if executable('ag')
"             let g:unite_source_grep_command='ag'
"             let g:unite_source_grep_default_opts='--nocolor --nogroup --hidden --follow'
"             let g:unite_source_grep_recursive_opt='-r'
"         elseif executable('ack')
"             let g:unite_source_grep_command='ack'
"             let g:unite_source_grep_default_opts='--no-heading --no-color -a --follow'
"             let g:unite_source_grep_recursive_opt='-r'
"         endif

"         function! s:unite_settings()
"             nmap <buffer> Q <plug>(unite_exit)
"             nmap <buffer> <esc> <plug>(unite_exit)
"             imap <buffer> <esc> <plug>(unite_exit)
"         endfunction
"         autocmd FileType unite call s:unite_settings()

"         nmap <Leader> [unite]
"         nnoremap [unite] <nop>

"         if s:is_windows
"             nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec buffer file_mru bookmark<cr><c-u>
"             nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec<cr><c-u>
"         else
"             nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async buffer file_mru bookmark<cr><c-u>
"             nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async<cr><c-u>
"         endif
"         nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
"         nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
"         nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
"         nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
"         nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
"         nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>


Bundle 'goldfeld/vim-seek'
Bundle 'cakebaker/scss-syntax.vim'
" Bundle 'garbas/vim-snipmate'
Bundle 'pangloss/vim-javascript'
Bundle 'SirVer/ultisnips' 
    let g:UltiSnipsSnippetDirectories=["bundle/UltiSnips/UltiSnips", "bundle/vaxe/ultisnips", "bundle/vim-aura/ultisnips"]
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"

Bundle 'hsitz/VimOrganizer'
Bundle 'jcfaria/Vim-R-plugin'
Bundle 'mileszs/ack.vim'
    nnoremap <Leader>a :Ack<space>
    let g:ackprg = 'ag --follow --nogroup --nocolor --column'
    " let g:ackprg="ack --with-filename --ignore-case --all --nocolor --nogroup --follow --column"
Bundle 'jdonaldson/vaxe'
    " let g:vaxe_cache_server_enable = 1
    let g:vaxe_default_parent_search_patterns = ["project.xml", "*.nmml", "build.hxml"]
    let g:vaxe_haxe_version = 3
    let g:vaxe_completion_write_compiler_output = 1
    map <Leader>oh :call vaxe#OpenHxml()<CR>
    map <Leader>ct :call vaxe#Ctags()<CR>
    map <Leader>ic :call vaxe#ImportClass()<CR>
    map <Leader>pj :call vaxe#ProjectHxml()<CR>
    map <Leader>jd :call vaxe#JumpToDefinition()<CR>
" Bundle 'jdonaldson/vim-powerline'
"     if g:fancy_term
"         let g:Powerline_symbols = 'fancy'
    " endif
" Bundle 'Lokaltog/powerline', {'rtp':'powerline/bindings/vim'}
"     set laststatus=2
" Bundle 'jdonaldson/linepower.vim'
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'bling/vim-airline'
    let g:airline_theme = "solarized"
    let g:airline_detect_whitespace=2 "icon only
    let g:airline_powerline_fonts = 1
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_branch_prefix = ' '
    let g:airline_readonly_symbol = ''
    let g:airline_linecolumn_prefix = ' '
"map <Leader>b :MiniBufExplorer<cr>
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
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
Bundle 'Align'
Bundle 'michalliu/jsoncodecs.vim'
Bundle 'michalliu/jsruntime.vim'
Bundle 'michalliu/sourcebeautify.vim'
Bundle 'mkitt/browser-refresh.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'scrooloose/syntastic'
    let g:syntastic_javascript_syntax_checker="gjslint"
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
    " syntastic gutter
    augroup syn_gutter
        au BufWinEnter * sign define mysign
        au BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')
    augroup END
" Bundle 'sjl/splice.vim'
Bundle 'sjl/vitality.vim'
Bundle 'suan/vim-instant-markdown'
" Bundle 'jdonaldson/molokai'
"     if g:fancy_term
"         let g:molokai_original = 1
"     endif
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-commentary'
    map <c-\> \\\
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-sleuth'
Bundle 'tpope/vim-speeddating'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tyru/open-browser.vim'
Bundle 'Valloric/YouCompleteMe'

Bundle 'Shougo/vimproc.vim'
" Bundle 'Shougo/neocomplcache'
"     let g:EclimCompletionMethod = 'omnifunc' " make neo play nice with eclim
"     let g:neocomplcache_enable_at_startup = 1
"     if !exists('g:neocomplcache_omni_patterns')
"         let g:neocomplcache_omni_patterns = {}
"     endif
"     let g:neocomplcache_enable_auto_select = 1
"     let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"     let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"     let g:neocomplcache_omni_patterns.haxe = '\v([\]''"\)]|\w|(^\s*))(\.|\()'
"     let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
Bundle 'tsaleh/vim-matchit'


" vim-scripts repos
"Bundle 'localvimrc'
Bundle 'Gundo'
    map <Leader>z :GundoToggle<CR>
Bundle 'L9'
Bundle 'The-NERD-tree'
Bundle 'utl.vim'
Bundle 'desert.vim'
Bundle 'closetag.vim'
" Bundle 'jdonaldson/vim-addon-local-vimrc'

filetype plugin indent on " required!

