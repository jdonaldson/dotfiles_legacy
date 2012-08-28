
if !exists('*SCSStocss')
    function! SCSStocss()
        let src = tempname()
        let dst = substitute( bufname('%'),'.scss','.css','g' )
        echo 'writing css to ' . dst
        execute "w ! sass --scss -s " . dst
        w
    endfunction
endif

" convert scss to css when the buffer is written
au! BufWriteCmd *.scss call SCSStocss()
