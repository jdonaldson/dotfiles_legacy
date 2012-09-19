" Loads a 'cheat file' based on the filetype currently being edited.
if exists("g:loaded_cheat")
    finish
else
    let g:loaded_cheat = 1
endif

function! ToggleCheatSheet()
    let pathname = 'cheat/'.&ft
    let paths = split(globpath(&rtp,pathname),'\n')
    let path = ''

    if len(paths) < 1
        echomsg 'No cheat sheet found for '.&ft
        return
    else
        let path = paths[0] 
    endif

    if buflisted(expand(path))
        exe 'buffer '.bufname(expand(path))
        bd
    elseif filereadable(path)
        set splitright
        execute ':vsplit +setlocal\ noma\ ro '. path
        wincmd h
    else
        echomsg "file not readable: ".path
    endif
endfunction

