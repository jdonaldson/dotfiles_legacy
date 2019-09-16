syntax enable
filetype off

" load some bundles depending on where I'm logging from
let hostname = substitute(system('hostname'), '\n', '', '')

" I use vim-plug to manage libraries.  It handles the "Plug" entries below
" If there are bundle-specific configs that I like, I add them under the
" bundle entry, while also indenting them.

Plug 'adelarsq/vim-hackernews'

Plug 'morhetz/gruvbox'
" Plug 'romainl/flattened'
" Plug 'tomasr/molokai'

Plug 'jreybert/vimagit'
Plug 'editorconfig/editorconfig-vim'


" Most of Tim Pope's awesome bundles:
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

Plug 'tpope/vim-dispatch'
    map <Leader>dm :Make<CR>
    " Use dispatch to execute the current line as a shell command, insert
    " results below the line
    map <Leader>r :exe ':Dispatch '.getline('.') <CR>

Plug 'tpope/vim-commentary'
 xmap \\  <Plug>Commentary<CR>
 nmap \\  <CR><Plug>Commentary
 nmap \\\ <Plug>CommentaryLine<CR>
 nmap \\u <Plug>CommentaryUndo<CR>



Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
        map <c-p> :Files<CR>

Plug 'jremmen/vim-ripgrep'
  nmap <Leader><space> :Rg<space>

Plug 'ryanoasis/vim-devicons'
 set encoding=utf-8
 let g:airline_powerline_fonts=1

Plug 'scrooloose/nerdtree'

" Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugs that support file/language-specific tooling and support
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plug 'prabirshrestha/vim-lsp'
"     Plug 'prabirshrestha/async.vim'

Plug 'jdonaldson/vaxe', {'branch' : 'neovaxe', 'do' : 'sh install.sh'}
    let g:vaxe_enable_code_lens = 1

Plug 'neoclide/coc.nvim'
    " let g:coc_node_args = ['--nolazy', '--inspect-brk=6045']
    let g:coc_global_extensions = ['coc-snippets', 'coc-python']
    let g:coc_force_debug = 1
    let g:airline#extensions#coc#enabled = 1
    nmap <Leader>cl :CocList<CR>
    nmap <Leader>clc :CocList commands<CR>
    nmap <Leader>3 :CocList<CR>
    nmap <Leader>4 :CocList commands<CR>


  " " if hidden is not set, TextEdit might fail.
  set hidden

  " " Some servers have issues with backup files, see #649
  set nobackup
  set nowritebackup

  " " Better display for messages
  set cmdheight=2

  " " You will have bad experience for diagnostic messages when it's default 4000.
  set updatetime=300

  " don't give |ins-completion-menu| messages.
  set shortmess+=c

  " always show signcolumns
  set signcolumn=yes


  " let g:coc_snippet_next = '<tab>'


  " " Use <c-space> to trigger completion.
  " inoremap <silent><expr> <c-space> coc#refresh()

  " " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " " Coc only does snippet and additional edit on confirm.
  " " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  " " inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
  " "                                          \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " " Use `[c` and `]c` to navigate diagnostics
  " nmap <silent> [c <Plug>(coc-diagnostic-prev)
  " nmap <silent> ]c <Plug>(coc-diagnostic-next)

  " " Remap keys for gotos
  " nmap <silent> gd <Plug>(coc-definition)
  " nmap <silent> gy <Plug>(coc-type-definition)
  " nmap <silent> gi <Plug>(coc-implementation)
  " nmap <silent> gr <Plug>(coc-references)

  " " Use K to show documentation in preview window
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " " inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

  " " Remap for rename current word
  " nmap <leader>rn <Plug>(coc-rename)

  " Remap for format selected region
  xmap <Leader>f  <Plug>(coc-format-selected)
  nmap <Leader>f  <Plug>(coc-format-selected)

  " " Setup formatexpr specified filetype(s).
  " autocmd FileType haxe setl formatexpr=CocAction('formatSelected')
  " " Update signature help on jump placeholder
  " autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  " " " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
  " " xmap <leader>a  <Plug>(coc-codeaction-selected)
  " " nmap <leader>a  <Plug>(coc-codeaction-selected)

  " " " Remap for do codeAction of current line
  " " nmap <leader>ac  <Plug>(coc-codeaction)
  " " " Fix autofix problem of current line
  " " nmap <leader>qf  <Plug>(coc-fix-current)

  " " " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
  " " nmap <silent> <TAB> <Plug>(coc-range-select)
  " " xmap <silent> <TAB> <Plug>(coc-range-select)
  " " xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

  " " Use `:Format` to format current buffer
  " map <Leader>ff :call CocAction('format')<CR>

  " " " Use `:Fold` to fold current buffer
  " " command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " " " use `:OR` for organize import of current buffer
  " " command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  " " Add status line support, for integration with other plugin, checkout `:h coc-status`
  " " set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " " " Using CocList
  " " " Show all diagnostics
  " " nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
  " " " Manage extensions
  " " nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
  " " " Show commands
  " " nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
  " " " Find symbol of current document
  " " nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
  " " " Search workspace symbols
  " " nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
  " " " Do default action for next item.
  " " nnoremap <silent> <space>j  :<C-u>CocNext<CR>
  " " " Do default action for previous item.
  " " nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
  " " " Resume latest coc list
  " " nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

Plug 'SirVer/ultisnips'
    let g:UltiSnipsSnippetDirectories=["UltiSnips", "bundle/UltiSnips/UltiSnips"]
    " let g:UltiSnipsExpandTrigger="<tab>"
    " let g:UltiSnipsJumpForwardTrigger="<tab>"
    " let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

filetype plugin indent on " required!
