" different 'toggle' type functions

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

function! ToggleEnablePreview()
    if &l:completeopt == ''
        return
    else
        let opts = split(&l:completeopt, ',')
        if  &l:completeopt =~ 'preview'
            let opts = filter(opts, 'v:val != "preview"')
            echo 'disabling omnifunc preview'
        else
            let opts += ['preview']
            echo 'enabling omnifunc preview'
        endif
        let &l:completeopt = join(opts,',')
    endif
endfunction
