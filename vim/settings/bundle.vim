syntax enable
filetype off

" load some bundles depending on where I'm logging from
let hostname = substitute(system('hostname'), '\n', '', '')

" I use vim-plug to manage libraries.  It handles the "Plug" entries below
" If there are bundle-specific configs that I like, I add them under the
" bundle entry, while also indenting them.

" Start out with my favorite color scheme
Plug 'altercation/vim-colors-solarized'
    " solarized options
    let g:solarized_termtrans = 1
    set background=dark

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs that support file/language-specific tooling and support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ocaml
" Plug 'def-lkb/ocp-indent-vim'
"   let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
"   execute "set rtp+=" . g:opamshare . "/merlin/vim"
"   let g:syntastic_ocaml_checkers = ['merlin']
"   autocmd FileType ocaml exec ":source " . g:opamshare . "/ocp-indent/vim/indent/ocaml.vim"
"   autocmd FileType ocaml let b:comment_leader = '(* '

" R
Plug 'jcfaria/Vim-R-plugin'
  let vimrplugin_assign = 0

Plug 'chrisbra/csv.vim'
Plug 'vim-scripts/gitignore.vim'
Plug 'jdonaldson/vim-eco'
Plug 'jdonaldson/writeGooder'
Plug 'vim-ruby/vim-ruby'
Plug 'kchmck/vim-coffee-script'
Plug 'cakebaker/scss-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'klen/python-mode'
  let g:pymode_folding = 0
  autocmd FileType python nmap <Leader>ll  :PymodeLintAuto<cr>

Plug 'sophacles/vim-bundle-mako'
Plug 'jsx/jsx.vim'
Plug 'lervag/vimtex'
  autocmd FileType latex set makeprg=pdflatex\ %
Plug 'elzr/vim-json'
  command! -range -nargs=0 -bar JsonFormat <line1>,<line2>!python -m json.tool
Plug 'PProvost/vim-markdown-jekyll'
Plug 'suan/vim-instant-markdown'
  let g:instant_markdown_slow = 1
Plug 'plasticboy/vim-markdown'
  let g:vim_markdown_folding_disabled = 1
Plug 'jdonaldson/vim-markdown-link-convert'
  map <Leader>il :call Inline2Ref()<CR>
Plug 'ap/vim-css-color'
Plug 'batsuev/csscomb-vim'
Plug 'xolox/vim-lua-ftplugin'
    Plug 'xolox/vim-misc'
Plug 'jdonaldson/vaxe'
  map <Leader>dh :! ./haxe build.hxml<CR>
  map <Leader>dl :luafile ~/.vim/bundle/vaxe/lua/vaxe.lua<CR>
  let g:vaxe_haxe_version = 3
  let g:vaxe_completion_write_compiler_output = 1
  map <Leader>oh :call vaxe#OpenHxml()<CR>
  map <Leader>ct :call vaxe#Ctags()<CR>
  map <Leader>ic :call vaxe#ImportClass()<CR>
  map <Leader>pj :call vaxe#ProjectHxml()<CR>
  map <Leader>jd :call vaxe#JumpToDefinition()<CR>

" Eclim (installed with an installer)
 " let g:EclimLocateFileScope = 'workspace'
 " let g:EclimCompletionMethod = 'omnifunc'
 " let g:EclimDefaultFileOpenAction = 'vsplit'
 " let g:EclimJavaSearchSingleResult = 'vsplit'
 " let g:EclimProjectKeepLocalHistory = 0
 " au BufNewFile,BufRead *.java map <buffer><c-p> :LocateFile<CR>
 " au BufNewFile,BufRead *.java map <buffer><c-]> :JavaSearchContext "vsplit"<CR>
 " au BufNewFile,BufRead *.java map <buffer><c-[> "zyiw:exe ":JavaSearch -p ".@z." -x references -p vsplit "<CR>
 " au BufNewFile,BufRead *.java map <buffer><c-\> "zyiw:exe ":JavaSearch -p ".@z." -x implementors -p vsplit "<CR>
 " au BufNewFile,BufRead *.java map <buffer><c-@> :JavaSearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs that provide general editor techniques and features
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Finding stuff
Plug 'Lokaltog/vim-easymotion'
Plug 'goldfeld/vim-seek'
Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_follow_symlinks = 2
    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
    if len(argv())==0 || argv()[0] == '.'
        " If I open a directory, assume I want to hard set a working path
        let g:ctrlp_working_path_mode = ''
        let g:ctrlp_use_caching=1
        let g:ctrlp_clear_cache_on_exit=0
        let g:ctrlp_max_files = 0
    endif
Plug 'mileszs/ack.vim'
    " nnoremap <Leader>a :Ack<space>
    map <c-@> :Ack<space>
    " use silver searcher instead of ack:
    let g:ackprg = 'ag --follow --nogroup --nocolor --column'

" Plug 'jdonaldson/vim-metarw-gdrive'
"   Plug 'kana/vim-metarw'
"   Plug 'mattn/webapi-vim'

Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
  nnoremap <Leader>` :Startify<CR>
  let g:startify_session_persistence = 1
  let g:startify_custom_header = [
        \' ______   ______            _______  _______  ___   _  _______  ',
        \' |      | |    _ |          |       ||   _   ||   | | ||       |',
        \' |  _    ||   | ||          |       ||  |_|  ||   |_| ||    ___|',
        \' | | |   ||   |_||_         |       ||       ||      _||   |___ ',
        \' | |_|   ||    __  | ___    |      _||       ||     |_ |    ___|',
        \' |       ||   |  | ||   |   |     |_ |   _   ||    _  ||   |___ ',
        \' |______| |___|  |_||___|   |_______||__| |__||___| |_||_______|',
        \'',
        \'']

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
   let g:airline_theme = "solarized"
   let g:airline_powerline_fonts = 1
   let g:airline_left_sep = ''
   let g:airline_left_alt_sep = ''
   let g:airline_right_sep = ''
   let g:airline_right_alt_sep = ''
   if !exists("g:airline_symbols")
      let g:airline_symbols = {}
   endif
   let g:airline_symbols.branch = ''
   let g:airline_symbols.readonly = ''
   let g:airline_symbols.linenr = ''
Plug 'majutsushi/tagbar'
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
" Plug 'Lokaltog/powerline'
" Plug 'Align'
Plug 'junegunn/vim-easy-align'
    " Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
    vmap <Enter> <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
    nmap <Leader>a <Plug>(EasyAlign)
    let g:easy_align_delimiters = {
                \ '[': {
                \     'pattern':       '[[\]]',
                \     'left_margin':   0,
                \     'right_margin':  0,
                \     'stick_to_left': 0
                \   },
                \ '(': {
                \     'pattern':       '[()]',
                \     'left_margin':   0,
                \     'right_margin':  0,
                \     'stick_to_left': 0
                \   }
                \ }

Plug 'junegunn/vim-oblique'
   Plug 'junegunn/vim-pseudocl'

Plug 'jdonaldson/vim-cheat-x-in-y'
Plug 'laurentgoudet/vim-howdoi'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
    let g:UltiSnipsSnippetDirectories=["UltiSnips", "bundle/UltiSnips/UltiSnips", "bundle/vim-aura/ultisnips"]
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
"include perforce if I have a p4 client
if executable("p4") && getcwd() =~ "blt\\|projectone\\|main\\|patch\\|freeze"
    Plug 'jdonaldson/perforce'
      let g:p4Depot = 'jdonaldson-wsm1-blt'
endif
Plug 'mkitt/browser-refresh.vim'
    " browser refresh settings
    let g:RefreshRunningBrowserDefault = 'chrome'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'scrooloose/syntastic'
    let g:syntastic_javascript_syntax_checker="gjslint"
    let g:syntastic_error_symbol='✗'
    let g:syntastic_warning_symbol='⚠'
    " syntastic gutter
    augroup syn_gutter
        au BufWinEnter * sign define mysign
        au BufWinEnter * exe "sign place 1337 line=1 name=mysign buffer=" . bufnr('%')
    augroup END

" Most of Tim Pope's awesome bundles:
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-jdaddy'
Plug 'tpope/vim-projectile'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'
  " ocaml comments
  autocmd FileType ocaml set commentstring=(*\ %s\ *)
  if maparg('\\','n') ==# '' && maparg('\','n') ==# '' && get(g:, 'commentary_map_backslash', 1)
    xmap \\  <Plug>Commentary<CR>
    nmap \\  <CR><Plug>Commentary
    nmap \\\ <Plug>CommentaryLine<CR>
    nmap \\u <Plug>CommentaryUndo<CR>
  endif

Plug 'tpope/vim-dispatch'
    map <Leader>dm :Make<CR>
    " Use dispatch to execute the current line as a shell command, insert
    " results below the line
    nnoremap <Leader>r :exe ':Dispatch '.getline('.') <CR>

Plug 'tyru/open-browser.vim'


Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
    let g:ycm_server_keep_logfiles = 1
    let g:ycm_server_use_vim_stdout = 1
    let g:ycm_server_log_level = 'debug'
    let g:ycm_cache_omnifunc=1 

Plug 'sjl/gundo.vim'
    map <Leader>su :GundoToggle<CR>

Plug 'scrooloose/nerdtree'
    nmap <silent><Leader>sn :NERDTreeToggle<CR>
    command! En execute "NERDTree %"

Plug 'vim-scripts/VisIncr'

Plug 'closetag.vim'
" Plug 'christoomey/vim-tmux-navigator'

Plug 'kana/vim-fakeclip'
" Vim-fakeclip {{{2
let g:fakeclip_no_default_key_mappings=1
if !has('clipboard')
  nmap <silent> <leader>y <Plug>(fakeclip-y)
  nmap <silent> <leader>Y <leader>y$
  nmap <silent> <leader>yy <Plug>(fakeclip-Y)
  vmap <silent> <leader>y <Plug>(fakeclip-y)
  vmap <silent> <leader>Y <Plug>(fakeclip-Y)
  nmap <silent> <leader>p <Plug>(fakeclip-p)
  nmap <silent> <leader>P  <Plug>(fakeclip-P)
  nmap <silent> <leader>gp  <Plug>(fakeclip-gp)
  nmap <silent> <leader>gP  <Plug>(fakeclip-gP)
  nmap <silent> <leader>]p  <Plug>(fakeclip-]p)
  nmap <silent> <leader>]P  <Plug>(fakeclip-]P)
  nmap <silent> <leader>[p  <Plug>(fakeclip-[p)
  nmap <silent> <leader>[P  <Plug>(fakeclip-[P)
  vmap <silent> <leader>p  <Plug>(fakeclip-p)
  vmap <silent> <leader>P  <Plug>(fakeclip-P)
  vmap <silent> <leader>gp  <Plug>(fakeclip-gp)
  vmap <silent> <leader>gP  <Plug>(fakeclip-gP)
  vmap <silent> <leader>]p  <Plug>(fakeclip-]p)
  vmap <silent> <leader>]P  <Plug>(fakeclip-]P)
  vmap <silent> <leader>[p  <Plug>(fakeclip-[p)
  vmap <silent> <leader>[P  <Plug>(fakeclip-[P)
"  map! <silent> <C-r>p  <Plug>(fakeclip-insert)
"  map! <silent> <C-r><C-r>p  <Plug>(fakeclip-insert-r)
"  map! <silent> <C-r><C-o>p  <Plug>(fakeclip-insert-o)
"  imap <silent> <C-r><C-p>p  <Plug>(fakeclip-insert-p)
endif

" Plug 'jdonaldson/wildfire.vim'
Plug 'dharanasoft/rtf-highlight'
Plug 'wellle/tmux-complete.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs that provide vimscript libraries for other bundles
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tomtom/tlib_vim'
Plug 'vim-scripts/genutils'
Plug 'michalliu/jsoncodecs.vim'
Plug 'michalliu/jsruntime.vim'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'L9'
Plug 'utl.vim'

Plug 'ryanoasis/vim-devicons'
 set encoding=utf-8
 let g:airline_powerline_fonts=1


filetype plugin indent on " required!



